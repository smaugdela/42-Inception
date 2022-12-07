FROM	debian:buster

RUN	apt-get update -y && \
	apt-get install -y curl \
						php7.3 \
						php7.3-cli \
						php7.3-fpm \
						php7.3-mysql \
						php7.3-json \
						php7.3-opcache \
						php7.3-mbstring \
						php7.3-xml \
						php7.3-gd \
						php7.3-curl \
						mariadb-client

COPY	conf/www.conf	/etc/php/7.3/fpm/pool.d/www.conf

WORKDIR	/var/www/html

RUN	curl -O https://wordpress.org/wordpress-6.1.tar.gz && \
	tar xzvf wordpress-6.1.tar.gz && \
	rm -f wordpress-6.1.tar.gz && \
	mv wordpress/* . && \
	rm -rf wordpress

RUN	mkdir -p /scripts

COPY	tools/wp_config.sh	/scripts/wp_config.sh

RUN	chmod 755 /scripts/wp_config.sh && \
	mkdir -p /run/php && \
	chown -R root:root * && \
	chmod 755 *

# EXPOSE	9000

ENTRYPOINT ["sh", "/scripts/wp_config.sh"]
