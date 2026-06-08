#!/bin/bash

set -e

apt-get update -y

apt-get install -y git curl

curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -

apt-get install -y nodejs

# App directory
APP_DIR="/home/ubuntu/app"

mkdir -p $APP_DIR
cd $APP_DIR

# Clean old clone if exists (important for reboots)
rm -rf $APP_DIR/*

git clone https://github.com/alakbr/api-basics-project.git .

npm install

nohup node server.js > app.log 2>&1 &