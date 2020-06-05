FROM codercom/code-server:1.621
USER root

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:ondrej/php
RUN apt-get update

ARG TIMEZONE=Africa/Casablanca

# Set timezone
RUN ln -snf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && echo ${TIMEZONE} > /etc/timezone

RUN apt-get install -y php7.2
RUN apt-get install -y php-pear php7.2-curl php7.2-dev php7.2-gd \
    php7.2-mbstring php7.2-zip \
    zip unzip php7.2-mysql php7.2-xml
# Composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

COPY code /home/coder/projet

RUN composer install
USER coder
