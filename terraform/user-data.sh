#!/bin/bash

set -e

apt-get update -y

apt-get install -y git curl

curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -

apt-get install -y nodejs git

mkdir -p /home/ubuntu/app

cd /home/ubuntu/app

git clone https://github.com/alakbr/api-basics-project.git .

npm install

nohup node server.js > app.log 2>&1 &