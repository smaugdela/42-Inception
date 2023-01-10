FROM	debian:buster

#Installing php as well as tools required by the startup script
RUN	apt-get update -y && \
	apt-get install -y curl \
						netcat \
						sendmail \
						mariadb-client \
						php7.3 \
						php7.3-cli \
						php7.3-fpm \
						php7.3-mysql \
						php7.3-json \
						php7.3-opcache \
						php7.3-mbstring \
						php7.3-xml \
						php7.3-gd \
						php7.3-curl

# Setup of the php configuration file
COPY	conf/www.conf	/etc/php/7.3/fpm/pool.d/www.conf

# Installation of wordpress cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

WORKDIR	/var/www/html

# Installation of wordpress
RUN	curl -O https://wordpress.org/wordpress-6.1.1.tar.gz && \
	ls && \
	tar xzvf wordpress-6.1.1.tar.gz && \
	rm -f wordpress-6.1.1.tar.gz && \
	mv wordpress/* . && \
	rm -rf wordpress && \
	mkdir -p /scripts

# Setup of the startup script
COPY	tools/wp_startup.sh	/scripts/wp_startup.sh

# Managing authorizations
RUN	chmod 755 /scripts/wp_startup.sh && \
	mkdir -p /run/php && \
	chown -R www-data:www-data . && \
	chmod 755 *

# Launching the container via my launch script
ENTRYPOINT ["/scripts/wp_startup.sh"]
