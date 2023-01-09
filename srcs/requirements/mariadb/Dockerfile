FROM	debian:buster

RUN	apt-get update -y && \
	apt-get install -y mariadb-server \
				mariadb-client \
				expect
COPY	conf/mariadb_conf.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN		mkdir -p /scripts
COPY	tools/mariadb_startup.sh /scripts/mariadb_startup.sh

RUN	mkdir -p /var/run/mysqld  && \
	chown -R mysql:mysql /var/run/mysqld && \
	chmod 755 /var/run/mysqld \
		/scripts/mariadb_startup.sh && \
	mysql_install_db

ENTRYPOINT ["/scripts/mariadb_startup.sh"]
