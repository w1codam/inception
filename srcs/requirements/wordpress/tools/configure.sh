#!/bin/bash

if [ ! -f "/var/www/html/wp-config.php" ]; then
	echo "installing wp"

	wp-cli.phar core download --path="/var/www/html" --allow-root

	wp-cli.phar config create --path="/var/www/html" \
	--dbname="$MYSQL_DATABASE" \
	--dbuser="$MYSQL_USERNAME" \
	--dbpass="$MYSQL_PASSWORD" \
	--dbhost="$MYSQL_HOSTNAME" \
	--allow-root

	wp-cli.phar core install --path="/var/www/html" \
	--title="big website" \
	--admin_user="$WP_ADMIN_USERNAME" \
	--admin_password="$WP_ADMIN_PASSWORD" \
	--admin_email="$WP_ADMIN_USERNAME@$DOMAIN_NAME" \
	--skip-email \
	--url="https://$DOMAIN_NAME/" \
	--allow-root

	wp-cli.phar user create "$WP_USER_USERNAME" $WP_USER_USERNAME@$DOMAIN_NAME \
	--path="/var/www/html" \
	--user_pass="$WP_USER_PASSWORD" \
	--allow-root
else
	echo "wp already installed"
fi

exec "$@"