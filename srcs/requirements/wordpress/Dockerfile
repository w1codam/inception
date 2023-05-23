FROM debian:buster

RUN apt update
RUN apt install -y php7.3 php-mysqli php-fpm curl

EXPOSE 9000

# copy configuration files
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

# configure
COPY ./tools/configure.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/configure.sh
RUN bash /usr/local/bin/configure.sh
RUN rm -f /usr/local/bin/configure.sh

# run entry