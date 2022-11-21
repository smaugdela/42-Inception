#FROM debian:buster

#RUN	apt update && \
#	apt upgrade && \
#	apt install -y mariadb-server \
#			mariadb-client

#RUN	rm -rf /var/lib/apt/lists/*

#COPY	conf/my.cnf ~/my.cnf
#COPY	conf/my.cnf /etc/my.cnf
#COPY	conf/my.cnf /etc/mysql/my.cnf

#RUN	mkdir -p /var/run/mysqld && \
#	chown -R mysql:mysql /var/run/mysqld && \
#	chmod 777 /var/run/mysqld

#RUN	mysql_install_db

#EXPOSE 3306


FROM alpine:3.16.2

RUN	apk update && \
	apk add openrc \
		mariadb \
		mariadb-client

RUN	rm -rf /var/lib/apt/lists/*

COPY	conf/my.cnf ~/my.cnf
COPY	conf/my.cnf /etc/my.cnf
COPY	conf/my.cnf /etc/mysql/my.cnf

RUN	mkdir -p /var/run/mysqld && \
	chown -R mysql:mysql /var/run/mysqld && \
	chmod 777 /var/run/mysqld

RUN	mysql_install_db && \
	mysqld &

EXPOSE	3306

