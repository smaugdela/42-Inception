#!/bin/bash

docker container rm -f nginx mariadb wordpress

docker image rm srcs-nginx srcs-mariadb srcs-wordpress

docker volume rm srcs_mariadb_data
docker volume rm srcs_wordpress_data

docker ps -a
docker volume ls
docker image ls
