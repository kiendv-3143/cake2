FROM php:7.1-fpm

# Install selected extensions and other stuff
RUN apt-get update && apt-get install -y libzip-dev && \
                      apt-get install -y git && \
                      apt-get install -y nano && \
                      apt-get install -y bash && \
                      apt-get install -y openssh-client

RUN apt-get update \
    && apt-get -y --no-install-recommends install apt-utils libxml2-dev gnupg apt-transport-https zip libzip-dev \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

RUN docker-php-ext-install intl zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
WORKDIR "/var/www/html"