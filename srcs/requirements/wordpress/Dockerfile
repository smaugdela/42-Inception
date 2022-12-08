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
						php7.3-curl

COPY	conf/www.conf	/etc/php/7.3/fpm/pool.d/www.conf

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

WORKDIR	/var/www/html

RUN	curl -O https://wordpress.org/wordpress-6.1.tar.gz && \
	tar xzvf wordpress-6.1.tar.gz && \
	rm -f wordpress-6.1.tar.gz && \
	mv wordpress/* . && \
	rm -rf wordpress && \
	mkdir -p /scripts

COPY	tools/wp_startup.sh	/scripts/wp_startup.sh

RUN	chmod 755 /scripts/wp_startup.sh && \
	mkdir -p /run/php && \
	chown -R www-data:www-data . && \
	chmod 755 *

EXPOSE	9000

ENTRYPOINT ["bash", "/scripts/wp_startup.sh"]
