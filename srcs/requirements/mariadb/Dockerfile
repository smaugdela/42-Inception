FROM	debian:buster

RUN	apt-get update -y && \
	apt-get install -y mariadb-server \
				mariadb-client \
				expect
COPY	conf/my.cnf /etc/my.cnf

RUN		mkdir -p /scripts
COPY	tools/startup.sh /scripts/startup.sh

RUN	mkdir -p /var/run/mysqld  && \
	chown -R mysql:mysql /var/run/mysqld && \
	chmod 777 /var/run/mysqld \
		/scripts/startup.sh

RUN	mysql_install_db

EXPOSE	3306

ENTRYPOINT ["sh", "/scripts/startup.sh"]

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

