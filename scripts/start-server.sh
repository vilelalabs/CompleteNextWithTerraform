#!/bin/bash

cd /var/www/demo-website

# -- Install Dependencies --
yarn install

# -- Build Application --
npm run build

# -- Start Application --
sudo pm2 start yarn --name demo-website -- start