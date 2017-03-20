#
# Ubuntu 14.04
#
# https://hub.docker.com/_/ubuntu/
#

# Pull base image.
FROM uwitech/ohie-base

USER root

#install tools

RUN apt-get update
RUN apt-get -y install wget
RUN apt-get -y install curl
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
RUN apt-get -y install nodejs
RUN apt-get -y install git build-essential
RUN apt-get -y install software-properties-common python-software-properties

#install nginx
RUN \
  add-apt-repository -y ppa:nginx/stable && \
  apt-get update && \
  apt-get install -y nginx && \
  rm -rf /var/lib/apt/lists/* && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

#openhim console
#RUN cd ~
#RUN wget https://github.com/jembi/openhim-console/releases/download/v1.9.0/openhim-console-v1.9.0.tar.gz
#RUN cp openhim-console-v1.9.0.tar.gz var/www/html
#RUN cd var/www/html
COPY html /var/www/html/
#RUN tar -zxvf /var/www/html/openhim-console-v1.9.0.tar.gz -C /var/www/html/

RUN cd /etc/nginx

CMD nginx

EXPOSE 80
