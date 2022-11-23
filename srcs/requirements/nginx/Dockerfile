FROM	debian:buster

# Updating OS and installing Nginx & Openssl
RUN	apt-get update && \
	apt-get install -y nginx \
				openssl

# Setting up SSL/TLS
RUN	mkdir -p /etc/nginx/ssl
RUN	openssl req -x509 -days 365 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/CN=smagdela.42.fr"

# Setting up nginx
COPY	conf/nginx.conf /etc/nginx/nginx.conf
RUN	mkdir -p /var/www/html
RUN	chmod 755 /var/www/html
COPY	conf/index.html /var/www/html/index.html

# Exposing https port
EXPOSE	443

# Launching container
CMD	[ "nginx", "-g", "daemon off;" ]

# FROM alpine:3.16.2

# # Updating OS and installing Nginx & Openssl
# RUN	apk update && \
# 	apk upgrade && \
# 	apk add nginx \
# 		openssl

# # Setting up SSL/TLS
# RUN mkdir -p /etc/nginx/ssl
# RUN openssl req -x509 -days 365 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/CN=smagdela.42.fr"

# # Setting up nginx
# COPY conf/nginx.conf /etc/nginx/nginx.conf
# RUN mkdir -p /var/www/html
# RUN chmod 755 /var/www/html
# COPY conf/index.html /var/www/html/index.html

# # Exposing https port
# EXPOSE 443

# # Launching container
# CMD [ "nginx", "-g", "daemon off;" ]

