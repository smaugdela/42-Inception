FROM alpine:3.16.2

RUN apk update && apk upgrade && apk add nginx openssl
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/CN=smagdela.42.fr"
RUN mkdir -p /var/run/nginx/
COPY conf/nginx.conf /etc/nginx/nginx.conf
RUN mkdir -p /var/www/html
RUN chmod 755 /var/www/html
COPY conf/index.html /var/www/html/index.html
# RUN chown -R /var/www/html
CMD [ "nginx", "-g", "daemon off;" ]

