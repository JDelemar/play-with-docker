# setup

This program sets up a docker swarm with manager nodes on [play-with-docker](http://labs.play-with-docker.com/). It asks you for the play-with-docker (pwd) url you are using and the number of nodes you want to create. It then creates the nodes, joins them to a swarm as managers, and runs portainer on each node. Portainer is optional and used to interact with containers running on the node.
