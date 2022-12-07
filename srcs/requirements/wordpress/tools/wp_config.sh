#!/bin/bash

sleep 10

cd /var/www/html

#curl -O https://wordpress.org/wordpress-6.1.tar.gz
#tar -xzvf wordpress-6.1.tar.gz
#rm -f wordpress-6.1.tar.gz
#mv wordpress/* .
#rm -rf wordpress

#cp wp-config.php wp-config-sample.php

sed -i "s/username_here/$SQL_USER/g" wp-config.php
sed -i "s/password_here/$SQL_USER_PWD/g" wp-config.php
sed -i "s/localhost/$DB_HOST/g" wp-config.php
sed -i "s/database_name_here/$DB_NAME/g" wp-config.php

#mv wp-config-sample.php wp-config.php

exec /usr/sbin/php-fpm7.3 --nodaemonize
