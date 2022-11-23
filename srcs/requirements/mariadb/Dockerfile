FROM	debian:buster

RUN	apt update && \
	apt upgrade && \
	apt install mariadb \
				mariadb-client

COPY	conf/my.cnf /etc/my.cnf

RUN		mkdir -p /scripts
COPY	tools/startup.sh /scripts/startup.sh

RUN	mkdir -p /var/run/mysqld  && \
	chown -R mysql:mysql /var/run/mysqld && \
	chmod 777 /var/run/mysqld \
		/scripts/startup.sh

RUN	mysql_install_db --user=mysql

EXPOSE	3306

# FROM alpine:3.16.2

# RUN	apk update && \
# 	apk add openrc \
# 		mariadb \
# 		mariadb-client

# COPY	conf/my.cnf /etc/my.cnf

# RUN	mkdir -p /scripts
# COPY	tools/startup.sh /scripts/startup.sh

# RUN	mkdir -p /var/run/mysqld  && \
# 	chown -R mysql:mysql /var/run/mysqld && \
# 	chmod 777 /var/run/mysqld \
# 		/scripts/startup.sh

# RUN	mysql_install_db --user=mysql

# EXPOSE	3306

