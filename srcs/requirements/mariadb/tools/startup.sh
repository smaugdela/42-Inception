#!/bin/sh

service mysql start

mysql_secure_installation << STOP

Y
$SQL_ROOT_PWD
$SQL_ROOT_PWD
Y
Y
Y
Y
STOP

mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME"
mysql -e "CREATE USER IF NOT EXISTS mysql@localhost IDENTIFIED BY $SQL_USER_PWD"
mysql -e "FLUSH PRIVILEGES"

service mysql stop

exec mysqld_safe
