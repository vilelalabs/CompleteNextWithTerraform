
# directory where site will be hosted ( nginx will seach for)
sudo mkdir -p /var/www
cd /var/www
#import project folder from github (from example)
sudo git clone https://github.com/emanuelturis/deploy-nextjs-from-scratch.git
# rename project folder
sudo mv deploy-nextjs-from-scratch demo-website
# ec2-user as owner of project folder
sudo chown -R ec2-user:ec2-user /var/www/demo-website

# folders for basic nginx configuration
sudo mkdir -p  /etc/nginx/sites-available
sudo mkdir -p  /etc/nginx/sites-enabled

# copy nginx modified configurations
sudo cp /home/ec2-user/nginx.conf /etc/nginx/nginx.conf
sudo cp /home/ec2-user/demo-website /etc/nginx/sites-available/demo-website

# create a symlink to the sites-enabled folder
sudo ln /etc/nginx/sites-available/demo-website /etc/nginx/sites-enabled/demo-website
