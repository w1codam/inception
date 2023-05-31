#!/bin/bash

sed -i "s/SERVER_NAME/$DOMAIN_NAME/g" /etc/nginx/sites-enabled/nginx.conf

exec "$@"