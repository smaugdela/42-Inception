FROM	debian:buster

# Installing mariadb and tools necessary to the startup script
RUN	apt-get update -y && \
	apt-get install -y mariadb-server \
				mariadb-client \
				netcat \
				expect

# Setup of the mariadb configuration file
COPY	conf/mariadb_conf.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Installation of the startup script
RUN		mkdir -p /scripts
COPY	tools/mariadb_startup.sh /scripts/mariadb_startup.sh

# Managing authorizations and launching the default mysql install script
RUN	mkdir -p /var/run/mysqld  && \
	chown -R mysql:mysql /var/run/mysqld && \
	chmod 755 /var/run/mysqld \
		/scripts/mariadb_startup.sh && \
	mysql_install_db

# Launching container via my script
ENTRYPOINT ["/scripts/mariadb_startup.sh"]
