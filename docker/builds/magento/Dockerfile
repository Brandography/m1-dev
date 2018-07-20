FROM php:5.6-apache

ENV XDEBUG_PORT 9000

# Install Magento requirements
RUN \
    apt-get update -qq && \
    apt-get install -y -qq --no-install-recommends \
        autoconf \
        git \
        jq \
        libicu-dev \
        libfreetype6-dev \
        libjpeg-dev \
        libmcrypt-dev \
        libpng-dev \
        libssl-dev \
        libxml2-dev \
        libxml2-utils \
        mailutils \
        ssh-client \
        ssmtp && \
    docker-php-ext-install -j$(nproc) \
        bcmath \
        gd \
        hash \
        intl \
        mcrypt \
        opcache \
        pdo_mysql \
        soap \
        zip

# Install xdebug
RUN pecl channel-update pecl.php.net \
    && pecl install xdebug-2.5.5 \
    && docker-php-ext-enable xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.iniOLD


ADD conf/php.ini /usr/local/etc/php/php.ini
ADD conf/magento.conf /etc/apache2/sites-available/magento.conf
ADD conf/custom-xdebug.ini /usr/local/etc/php/conf.d/custom-xdebug.ini
COPY bin/* /usr/local/bin/
RUN chmod +x /usr/local/bin/*
RUN ln -s /etc/apache2/sites-available/magento.conf /etc/apache2/sites-enabled/magento.conf