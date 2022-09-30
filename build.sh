#!/bin/bash
echo "Build WP..."

echo "Iniciando serviços..."
sudo service docker start
sleep 5
docker-compose -f docker-compose.yml up -d
sleep 5
sudo cp wp1.sagat.com.br /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/wp1.sagat.com.br /etc/nginx/sites-enabled/
nginx -t 
systemctl restart nginx