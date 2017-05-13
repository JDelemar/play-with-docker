# wordpress

This docker file sets up Wordpress and MySql on [play-with-docker](http://labs.play-with-docker.com/)

<br/>

Create a docker-compose.yml file 
```
vi, vim, nano, or cat > docker-compose.yml, CTR-Z to end the file
```

Deploy
```
docker deploy --compose-file docker-compose.yml stack
```

Remove
```
docker stack rm stack
```

Other commands:

Verify all nodes are added correctly
```
docker node ls
```
Check swarm information
```
docker service ps <container_name>
docker service ls
docker network inspect mynet
```
