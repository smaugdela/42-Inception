FROM	debian:buster

RUN	apt-get update -y && \
	apt-get install -y curl \
			php \
			php-fpm \
			php-mysql

WORKDIR	/var/www/html

RUN	curl -O https://wordpress.org/wordpress-6.1.tar.gz && \
	tar xzvf wordpress-6.1.tar.gz && \
	rm wordpress-6.1.tar.gz && \
	chown -R root:root /var/www/html

EXPOSE	9000
