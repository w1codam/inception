FROM debian:buster

RUN apt update
RUN apt install -y nginx openssl

EXPOSE 443

# configure
COPY ./tools/configure.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/configure.sh
RUN bash /usr/local/bin/configure.sh
RUN rm -f /usr/local/bin/configure.sh

# run entry