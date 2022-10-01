#!/bin/bash
echo "Install Docker and docker compose and nginx.."

sudo apt-get update
sudo apt-get --yes --force-yes install apt-transport-https ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
     "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
     $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sleep 5
sudo apt-get update
sudo apt-get --yes --force-yes install docker-ce docker-ce-cli containerd.io
sudo apt-get --yes --force-yes install docker-compose
sudo service docker start

sudo apt-get --yes --force-yes install nginx -y
sudo nginx -t
sudo systemctl restart nginx

sudo apt-get update
sudo apt-get --yes --force-yes install certbot python3-certbot-nginx