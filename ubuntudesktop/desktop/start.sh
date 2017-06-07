# Ubuntu Desktop LXDE VNC
# this isn't  running automatically since it wasn't present in the desktop environment
# run it: ./start.sh

# # Uninstall libreoffice
# apt-get remove -y --purge libreoffice*
# apt-get clean
# apt-get autoremove -y

# # XFCE
# apt-get update 
# apt-get install -y xfce4 

# Node and npm
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
apt-get install -y nodejs

# Visual Studio Code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg 
mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
apt-get update
apt install -y code

/startup.sh
