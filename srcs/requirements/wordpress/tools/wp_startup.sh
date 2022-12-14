#!/bin/bash

IP=mariadb
PORT=3306
LISTEN_PORT=9000

if [ -f "wp-config.php" ]
then
	echo "Wordpress already installed, launching immediatly."
	exec /usr/sbin/php-fpm7.3 -F
fi

echo "Waiting for mariadb."

RECEPTION=$( netcat -l -p $LISTEN_PORT )

echo "Mariadb is ready, now waiting for it to be up."

CONDITION=$( netcat -vz $IP $PORT 2>&1 | grep "open" | wc -w )

while [ "$CONDITION" == "0" ]
do
	sleep 1
	echo -n "."
	CONDITION=$( netcat -vz $IP $PORT 2>&1 | grep "open" | wc -w )
done

echo "$IP is ready!"

wp config create --dbname=$DB_NAME --dbuser=$SQL_USER --dbpass=$SQL_USER_PWD --dbhost=$DB_HOST --allow-root

wp core install --url=$HOSTNAME --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PWD --admin_email=$MAIL --allow-root

wp theme activate twentytwentytwo --allow-root

wp user create $WP_USER $WP_USER_MAIL --role=contributor --user_pass=$WP_USER_PWD --allow-root

echo "Wordpress is configured and ready!"

exec /usr/sbin/php-fpm7.3 -F
