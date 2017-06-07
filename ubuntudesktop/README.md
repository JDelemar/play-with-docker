# Ubuntu Desktop

This project sets up an Ubuntu LXDE desktop in [play-with-docker](http://labs.play-with-docker.com/)

Why would you want to do this? 
  * Maybe you want to experiment with Docker and use Docker images that have a graphic user interface without doing it on your own computer.
  * Maybe you want to experiment with Docker and you have a slow Internet connection which inhibits you from downloading large images and/or modifying images.

#### Steps:
1. Clone this
2. Change directory to `ubuntudesktop`
3. Start the containers with `docker-compose up -d`


#### The following ports will be exposed:
|Port|Application|Purpose
|----|-----------|-------
|8081|Node File Manager|Allows you to download and upload files to PWD using your browser
|8080|Ubuntu Desktop LXDE|This is the desktop environment<br/>Port 5900 is also exposed but not utilized


When you are in the desktop, executing `start.sh` will install Node.js and Visual Studio Code
