FROM ubuntu:trusty

ARG ARCHON_VERSION=3.21.3
ARG ARCHON_URL=https://github.com/archonproject/archon.git

ENV MYSQL_ROOT_PASSWORD=123456 \
    MYSQL_HOST=db \
    MYSQL_DB=archon \
    MYSQL_USER=archon \
    MYSQL_PASSWORD=archon

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install \
    apache2 \
    git \
    libapache2-mod-php5 \
    mysql-client \
    php-mdb2-driver-mysql \
    php-pear

RUN git clone --single-branch -b v${ARCHON_VERSION} ${ARCHON_URL} /app

ADD apache_default /etc/apache2/sites-available/000-default.conf
ADD start-apache2.sh /start-apache2.sh
ADD config.inc.php /app/config.inc.php
ADD archon.sql /archon.sql

RUN chmod 755 /*.sh && \
    a2enmod rewrite && \
    mkdir -p /app && rm -fr /var/www/html && ln -s /app /var/www/html

EXPOSE 80
CMD ["./start-apache2.sh"]
