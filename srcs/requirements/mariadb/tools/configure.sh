#!/bin/bash

mysql_install_db --user=mysql --datadir=/var/lib/mysql

sed -i "s/bind-address.*/bind-address = $MYSQL_HOSTNAME/" /etc/mysql/mariadb.conf.d/50-server.cnf

{
    echo "FLUSH PRIVILEGES;"
    echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
    echo "CREATE USER IF NOT EXISTS $MYSQL_USERNAME@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
    echo "GRANT ALL ON *.* TO $MYSQL_USERNAME@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
    echo "FLUSH PRIVILEGES;"
} | mysqld --bootstrap

exec "$@"