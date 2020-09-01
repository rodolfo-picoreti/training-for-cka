#!/bin/bash

source variables.sh

sudo apt-get update
sudo apt-get install -y nginx

cd /data

ip0=`echo $CONTROLLER_INTERNAL_IPS | cut -d',' -f 1`
ip1=`echo $CONTROLLER_INTERNAL_IPS | cut -d',' -f 2`
ip2=`echo $CONTROLLER_INTERNAL_IPS | cut -d',' -f 3`

cat > kubernetes.conf <<EOF

stream {
  upstream kubernetes_api {
    server $ip0:6443;
    server $ip1:6443;
    server $ip2:6443;
  }

  server {
    listen 6443;
    proxy_pass kubernetes_api;
  }
}

EOF

sudo mv kubernetes.conf /etc/nginx/modules-enabled/

sudo systemctl restart nginx
sudo systemctl enable nginx

