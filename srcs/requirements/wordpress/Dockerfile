FROM	debian:buster

RUN	apt-get update -y && \
	apt-get install -y curl \
			php \
			php-fpm \
			php-mysql

COPY	conf/www.conf	/etc/php/7.3/fpm/pool.d/www.conf

WORKDIR	/var/www/html

RUN	curl -O https://wordpress.org/wordpress-6.1.tar.gz && \
	tar xzvf wordpress-6.1.tar.gz && \
	rm -f wordpress-6.1.tar.gz && \
	chown -R root:root /var/www/html && \
	mkdir -p /run/php

EXPOSE	9000

ENTRYPOINT ["/usr/sbin/php-fpm7.3", "-F"]

