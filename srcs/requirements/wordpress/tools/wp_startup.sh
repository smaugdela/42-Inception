#!/bin/bash

sleep 15
# This sleep should be replace by some sort of loop using netcat to check if mariadb is up:
# netcat -vz mariadb 3306
# Check if it ends withn 'open', if not, continue the loop.

wp config create --path="/var/www/html/" --dbname=$DB_NAME --dbuser=$SQL_USER --dbpass=$SQL_USER_PWD --dbhost=$DB_HOST --allow-root --skip-check

wp core install --url=$HOSTNAME --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PWD --admin_email=$MAIL --allow-root

wp user create $WP_USER $WP_USER_MAIL --role=contributor --user_pass=$WP_USER_PWD --allow-root

echo "Wordpress is configured and ready!"

exec /usr/sbin/php-fpm7.3 -F
