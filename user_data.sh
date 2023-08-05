#!/bin/bash
# Procedures for using on [Amazon Linux 2023] Instance

# -- Update the System --
sudo dnf update -y

# Create a log file
sudo touch /home/ec2-user/user_data.log


# -- Install basic tools --
sudo sh /home/ec2-user/basics-install.sh
sudo echo "Basic tools installed" >> /home/ec2-user/user_data.log

# -- Install NGINX and Certbot --   
sudo sh /home/ec2-user/nginx-certbot-install.sh
sudo echo "NGINX and Certbot installed" >> /home/ec2-user/user_data.log

# -- Prepare Configuration Files --
sudo sh /home/ec2-user/files-preparation.sh
sudo echo "Configuration files prepared" >> /home/ec2-user/user_data.log

# -- Register Certbot --
sudo sh /home/ec2-user/certbot-register.sh

# -- Start Server --
sudo sh /home/ec2-user/start-server.sh
sudo echo "Server started" >> /home/ec2-user/user_data.log

