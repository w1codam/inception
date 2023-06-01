FROM debian:buster

EXPOSE 443

RUN apt-get update
RUN apt-get install -y nginx openssl

COPY conf/nginx.conf /etc/nginx/sites-available/nginx.conf

RUN rm -rf /etc/nginx/sites-enabled/*
RUN ln -sf /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf

COPY tools/configure.sh /usr/bin/
RUN chmod +x /usr/bin/configure.sh

RUN openssl req -new \
	-newkey rsa:2048 \
	-x509 \
	-sha256 \
	-days 365 \
	-nodes \
	-out /etc/ssl/certs/certificate.crt \
	-keyout /etc/ssl/private/certificate.key \
	-subj "/C=$SSL_COUNTRY/ST=$SSL_STATE/L=$SSL_LOCALITY/O=$SSL_ORGANISATION/CN=$DOMAIN_NAME"


ENTRYPOINT ["configure.sh"]
CMD ["nginx", "-g", "daemon off;"]
# CMD ["sleep", "10000"]
