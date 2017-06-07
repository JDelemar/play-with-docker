# Node File Manager 

# Run
    # docker run -d -p 8080:8080 -v $PWD:/app --name fmanode node:7.10.0-alpine sh -c 'while sleep 360000; do :; done'

FROM node:alpine

# setup 
RUN mkdir -p /fmgr

RUN apk add --update git 

# copy startup script
COPY start.sh /root/start.sh

RUN chmod +x /root/start.sh 

CMD /root/start.sh