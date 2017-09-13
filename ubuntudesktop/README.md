# Ubuntu Desktop and Node File Manager

This project sets up an Ubuntu LXDE desktop and node file manager on a web server in [play-with-docker](http://labs.play-with-docker.com/). [Node File Manager by efeiefei](https://github.com/efeiefei/node-file-manager) allows you to compress and copy things to and from your play with docker session using your browser. 

#### Ubuntu LXDE desktop
<img src="https://github.com/JDelemar/play-with-docker/blob/master/ubuntudesktop/images/UbuntuDesktop.png"/>

#### Node File Manager
<img src="https://github.com/JDelemar/play-with-docker/blob/master/ubuntudesktop/images/NodeFileManager.png"/>

Why would you want to do this? 
  * Maybe you want to experiment with Docker and use Docker images that have a graphic user interface without doing it on your own computer.
  * Maybe you have a slow Internet connection which inhibits you from downloading large images and/or modifying images.

#### Steps:
1. Clone this
   ```
   # clone the whole repository
   git clone https://github.com/JDelemar/play-with-docker.git
   ```
   **OR**
   ```
   # do a sparse clone for this directory
   # create an empty repository
   mkdir play-with-docker
   cd play-with-docker
   git init
   git remote add -f origin https://github.com/JDelemar/play-with-docker.git
   git config core.sparseCheckout true
   # define which files/folders to check out
   echo "ubuntudesktop" >> .git/info/sparse-checkout
   ```
   `git pull origin master`  **OR** a shallow clone `git pull --depth=1 origin master`
2. Change directory to ubuntudesktop `cd ubuntudesktop`
3. Start the containers with `docker-compose up -d`


#### The following ports will be exposed:
|Port|Application|Purpose
|----|-----------|-------
|8081|Node File Manager|Allows you to download and upload files to PWD using your browser
|8080|Ubuntu Desktop LXDE|This is the desktop environment

In addition ports 3000 and 3001 are also exposed. These ports can be used if you build an application and need to expose a port in the Ubuntu Desktop container (8080/3000) or the Node File Manager container (8081/3001)

When you are in the desktop, executing `start.sh` will install Node.js and Visual Studio Code
