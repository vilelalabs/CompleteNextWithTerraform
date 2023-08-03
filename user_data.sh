#!/bin/bash
# Procedures for using on [Amazon Linux 2023] Instance

# -- Update the System --
sudo dnf update -y

# -- Install NGINX and Certbot --   
sudo sh /home/ec2-user/nginx-certbot-install.sh

# -- Prepare Configuration Files --
sudo sh /home/ec2-user/files-preparation.sh