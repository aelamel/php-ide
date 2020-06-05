FROM codercom/code-server:latest
USER root

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y software-properties-common
RUN add-apt-repository -r ppa:ondrej/php
RUN apt-get update

ARG TIMEZONE=Africa/Casablanca

# Set timezone
RUN ln -snf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && echo ${TIMEZONE} > /etc/timezone

RUN apt-get install -y php7.2
RUN apt-get install -y php-fpm php-gd php-curl php-mysql php-dev php-cli php-common php-mbstring php-intl php-zip php-bcmath unzip
# Composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer


COPY code /home/coder/project/
COPY Docker/startup.sh /tmp/

WORKDIR /home/coder/project
RUN composer install
RUN chown -R coder:coder /home/coder/project
RUN chmod +x /tmp/startup.sh

ENTRYPOINT ["/tmp/startup.sh"]
