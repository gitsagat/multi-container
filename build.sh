#!/bin/bash
echo "Build WP..."

echo "Iniciando serviços..."
sudo service docker start
sleep 5
docker-compose -f docker-compose.yml up -d
sleep 5
certbot --nginx -d wp1.sagat.com.br
sudo cp wp1sagat.conf /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/wp1sagat.conf /etc/nginx/sites-enabled/

sleep 5
certbot --nginx -d wp2.sagat.com.br
sudo cp wp2sagat.conf /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/wp2sagat.conf /etc/nginx/sites-enabled/

nginx -t 
systemctl restart nginx