#!/bin/bash


# -- CHECKS FOR IP ADDRESS BEFORE GO TO CERTBOT CERTIFICATION --
own_ip=$(curl -s http://checkip.amazonaws.com)  # Get the public IP of the instance
domain="joblinker.page"
while true; do
  
  resolved_ip=$(dig +short "$domain" @8.8.8.8)     # Use dig to resolve the domain
  
  if [ "$resolved_ip" = "$own_ip" ]; then
    echo "Domain $domain is correctly pointing to $own_ip."  >> /home/ec2-user/user_data.log
    break
  else
    echo "Resolved IP $resolved_ip is different from own IP $own_ip." >> /home/ec2-user/user_data.log
    echo "Domain $domain is not yet pointing to $own_ip. Retrying in 60 seconds..." >> /home/ec2-user/user_data.log
    sleep 60
  fi
done


# -- Register Certbot --
sudo certbot --nginx -d joblinker.page --non-interactive --agree-tos --email hvilelaeng@gmail.com

# -- Start NGINX --
sudo killall nginx
sleep 10
sudo systemctl restart nginx

# -- Adds to Log --
sudo echo "Certbot registered and nginx restarted." >> /home/ec2-user/user_data.log