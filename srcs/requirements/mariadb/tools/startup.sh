#!/bin/sh

/usr/bin/mysqld_safe --datadir='/var/lib/mysql' --user=mysql >/tmp/mysqld.stdout 2>/tmp/mysqld.stderr &

#mysql_secure_installation << STOP

n
n
Y
Y
Y
Y
STOP

