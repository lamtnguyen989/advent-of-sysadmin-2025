#!/bin/bash

# Connect nginx to the correct static network
docker network connect static-net nginx

# Fixing the nginx local host resolver based on default config
docker exec nginx bash -c 'cat > /etc/nginx/conf.d/default.conf << "EOF"
    server {
        listen 80;
        location / {
            root   /usr/share/nginx/html;
            index  index.html index.htm;
        }
        location /1 {
            rewrite ^ / break;
            proxy_pass http://statichtml1:3000;
            proxy_connect_timeout   2s;
            proxy_send_timeout      2s;
            proxy_read_timeout      2s;
        }
        location /2 {
            rewrite ^ / break;
            proxy_pass http://statichtml2:3000;
            proxy_connect_timeout   2s;
            proxy_send_timeout      2s;
            proxy_read_timeout      2s;
        }
    }
EOF'

# Restart nginx
docker restart nginx