#   Node File Manager 

cd /fmgr
git clone https://github.com/efeiefei/node-file-manager.git
cd node-file-manager 
npm i 
cd lib
mkdir files
node --harmony index.js -p 8080 -d /fmgr
