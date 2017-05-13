#!/bin/bash
# setup.sh
# This program sets up a docker swarm with manager nodes on play-with-docker (pwd) http://labs.play-with-docker.com/
# TODO: how to change back to host client
#       menu for what you want to launch in the swarm 

# directory used by docker-machine to store machine certs
DIRECTORY="$HOME/.docker/machine"

# get play-with-docker url 
echo "Please, enter the play with docker url (leave blank to quit)"
read URL
if [ "$URL" != "" ]; then
    # store url 
    export PWD_URL=$URL 

    # get number of nodes to create 
    echo "Please enter the number of nodes to create (1 to 5, anything else to quit)"
    read NUMBER 

    if ! [[ $NUMBER =~ ^[1-5]+$ ]]; then
        echo Quit 
        exit 
    fi 

    # check if any docker machines have been created and remove them
    echo Checking to see if $DIRECTORY exists
    if [ -d "$DIRECTORY" ]; then 
        echo Removing $DIRECTORY
        rm -r $DIRECTORY
    fi 

    # create nodes on pwd
    TOKENMANAGER=""
    echo Creating $NUMBER nodes
    for i in `seq 1 $NUMBER`;
    do
        echo Creating node$i 
        docker-machine create -d pwd node$i 
        echo Switch to node$i 
        eval $(docker-machine env node$i)
        NODEIP=$(docker-machine ip node$i)
        echo node$i address is $NODEIP 
        if [ $i = 1 ]; then 
            # create node swarm master
            echo Create swarm master 
            docker swarm init --advertise-addr $NODEIP 
            echo Get token manager for swarm 
            TOKENMANAGER=$(docker swarm join-token manager)
            echo $TOKENMANAGER
            # docker swarm init --advertise-addr 10.0.30.3
            # docker swarm join-token manager       
            echo List images 
            docker images 
            # echo Attempt to create a file 
            # echo 'Test file' > test$i 
            echo Creating overlay network 
            docker network create --driver overlay mynet
            echo Create portainer for node$i 
            docker service create -p 900$i:9000 --mount type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock --network mynet --constraint "node.hostname == node$i" --name portainer$i portainer/portainer
        else 
            # create other nodes and join them to the swarm as master
            echo node$i join swarm as master 
            # echo $TOKENMANAGER
            # eval $TOKENMANAGER
            sed 's/^.*docker/docker/;s/\\ //g' <<< $TOKENMANAGER
            eval $(sed 's/^.*docker/docker/;s/\\ //g' <<< $TOKENMANAGER)
            
            ##############
            # optional code begins here
            ##############
            # run portainer on each node
            echo Create portainer for node$i 
            docker service create -p 900$i:9000 --mount type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock --network mynet --constraint "node.hostname == node$i" --name portainer$i portainer/portainer
            ##############
            # optional code ends here
            ##############

        fi 
    done
    echo Switch to node1
    eval $(docker-machine env node1)

fi 

echo Program ended

exit