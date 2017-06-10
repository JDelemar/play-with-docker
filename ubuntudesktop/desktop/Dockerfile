# Ubuntu Desktop LXDE VNC

# Run
    # docker run -d -v $PWD:/root/tmp -p 6080:80 -p 5900:5900 dorowu/ubuntu-desktop-lxde-vnc

FROM dorowu/ubuntu-desktop-lxde-vnc

# Uninstall libreoffice
RUN apt-get remove -y --purge libreoffice* \
    && apt-get clean \
    && apt-get autoremove -y

# XFCE
RUN apt-get update \
    && apt-get install git \
    && apt-get install -y xfce4 

# # Node and npm
# RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - \
#     && apt-get install -y nodejs

# # Visual Studio Code
# RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg \
#     && mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg \
#     && sh -c "echo 'deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main' > /etc/apt/sources.list.d/vscode.list" \
#     && apt-get update \
#     && apt install -y code

# copy startup script
COPY start.sh /root/start.sh

RUN chmod +x /root/start.sh 

# For some reason attempting to install things before physically starting the desktop is not working
# Can type ./start.sh in the console once the desktop is up
# CMD /root/start.sh

ENTRYPOINT ["/startup.sh"]
