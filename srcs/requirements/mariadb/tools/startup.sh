#!/bin/sh

service mysql start

mysql_secure_installation << STOP

n
n
Y
Y
Y
Y
STOP
