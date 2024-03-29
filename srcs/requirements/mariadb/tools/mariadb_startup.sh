#!/bin/bash

if [ -d "/var/lib/mysql/$DB_NAME" ]
then 
	echo "Database already exists, starting now."
	exec mysqld_safe --datadir='/var/lib/mysql'
fi

service mysql start

echo "Launching mysql secure installation."

expect -c "

set timeout 10

spawn mysql_secure_installation

expect \"Enter current password for root (enter for none):\"
send \"\r\"

expect \"Change the root password?\"
send \"Y\r\"

expect \"New password:\"
send \"$SQL_ROOT_PWD\r\"

expect \"Re-enter new password:\"
send \"$SQL_ROOT_PWD\r\"

expect \"Remove anonymous users?\"
send \"Y\r\"

expect \"Disallow root login remotely?\"
send \"Y\r\"

expect \"Remove test database and access to it?\"
send \"Y\r\"

expect \"Reload privilege tables now?\"
send \"Y\r\"

expect eof
"

echo "Setting up database and users."

mysql -u root -p$SQL_ROOT_PWD -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mysql -u root -p$SQL_ROOT_PWD -e "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_USER_PWD';"
mysql -u root -p$SQL_ROOT_PWD -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$SQL_USER' IDENTIFIED BY '$SQL_USER_PWD';"
mysql -u root -p$SQL_ROOT_PWD -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PWD';"
mysql -u root -p$SQL_ROOT_PWD -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p$SQL_ROOT_PWD shutdown

timeout 1 netcat wordpress 9000

echo "Mariadb is configured and ready!"

exec mysqld_safe --datadir='/var/lib/mysql'
