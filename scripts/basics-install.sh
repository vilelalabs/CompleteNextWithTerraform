#!/bin/bash

# -- Install Git --
sudo dnf install git -y

# -- Install Latest NodeJS / NPM --
sudo dnf install nodejs -y

# -- Install Yarn & PM2 --
npm install -g yarn pm2
pm2 update
