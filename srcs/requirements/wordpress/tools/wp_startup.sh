#!/bin/bash

#cd /var/www/html

#curl -O https://wordpress.org/wordpress-6.1.tar.gz
#tar -xzvf wordpress-6.1.tar.gz
#rm -f wordpress-6.1.tar.gz
#mv wordpress/* .
#rm -rf wordpress

#cp wp-config.php wp-config-sample.php

#sed -i "s/username_here/$SQL_USER/g" wp-config.php
#sed -i "s/password_here/$SQL_USER_PWD/g" wp-config.php
#sed -i "s/localhost/$DB_HOST/g" wp-config.php
#sed -i "s/database_name_here/$DB_NAME/g" wp-config.php

#mv wp-config-sample.php wp-config.php

rm /var/www/html/wp-config.php
wp config create --path="/var/www/html/" --dbname=$DB_NAME --dbuser=$SQL_USER --dbpass=$SQL_USER_PWD --dbhost=$DB_HOST --allow-root --skip-check

sleep 15

echo "Launching php-fpm..."

exec /usr/sbin/php-fpm7.3 -F
