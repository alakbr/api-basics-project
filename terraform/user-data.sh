#!/bin/bash

apt update

apt install -y nodejs npm git

mkdir -p /home/ubuntu/app

cd /home/ubuntu/app

git clone https://github.com/alakbr/api-basics-project.git .

cd app

npm install

nohup node server.js > app.log 2>&1 &