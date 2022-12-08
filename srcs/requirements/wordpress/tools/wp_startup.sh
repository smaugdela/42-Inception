#!/bin/bash

wp config create --path="/var/www/html/" --dbname=$DB_NAME --dbuser=$SQL_USER --dbpass=$SQL_USER_PWD --dbhost=$DB_HOST --allow-root --skip-check

# sleep 15

wp core install --url=$HOSTNAME --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PWD --admin_email=$MAIL

echo "wordpress configured and ready!"

exec /usr/sbin/php-fpm7.3 -F
