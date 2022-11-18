FROM alpine:3.16.2

# Updating OS and installing ...
RUN	apk update && \
	apk upgrade && \
	apk add mariadb \
	mariadb-client

COPY	conf/my.cnf /etc/my.cnf
RUN	mkdir -p /run/mysqld && \
	chown -R mysql:mysql /run/mysqld && \
	chmod 777 /run/mysqld
EXPOSE 3306
