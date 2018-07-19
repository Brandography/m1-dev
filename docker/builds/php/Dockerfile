FROM php:5.6-fpm

MAINTAINER Alexandre Jardin <info@ajardin.fr>
LABEL maintainer="Alexandre Jardin <info@ajardin.fr>"

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
        zip && \
    yes "" | pecl install apcu-4.0.11 lzf mongo redis && \
    docker-php-ext-enable apcu lzf mongo redis && \
    rm -rf /var/lib/apt/lists/* && \
    perl -pi -e "s/mailhub=mail/mailhub=maildev/" /etc/ssmtp/ssmtp.conf && \
    perl -pi -e "s|;pm.status_path = /status|pm.status_path = /php_fpm_status|g" /usr/local/etc/php-fpm.d/www.conf

# Install Composer globally
RUN \
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer


# Install custom PHP configuration
COPY conf/* /usr/local/etc/php/