FROM php:5.6-apache

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
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.iniOLD


# Install Magerun
RUN curl -O https://files.magerun.net/n98-magerun.phar \
    && cp ./n98-magerun.phar /usr/local/bin/

# Install MPMD
RUN mkdir -p /var/www/.n98-magerun/modules/
RUN git clone https://github.com/AOEpeople/mpmd.git /var/www/.n98-magerun/modules/mpmd

# Update user permissions
RUN chmod 777 -R /var/www \
	&& chown -R www-data:1000 /var/www \
  	&& usermod -u 1000 www-data \
  	&& chsh -s /bin/bash www-data

RUN a2enmod rewrite
RUN service apache2 restart

# Install Mhsendmail
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install golang-go \
    && mkdir /opt/go \
    && export GOPATH=/opt/go \
    && go get github.com/mailhog/mhsendmail

# Install Ioncube - Needed for cart 2 quote extension
# ADD automatically untars
ADD https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz /tmp/
RUN tar -xvf /tmp/ioncube_loaders_lin_x86-64.tar.gz -C /tmp/ \
    && mkdir -p /usr/local/ioncube \
    && cp /tmp/ioncube/ioncube_loader_* /usr/local/ioncube \
    && rm -rf /tmp/ioncube

ADD conf/php.ini /usr/local/etc/php/php.ini
ADD conf/magento.conf /etc/apache2/sites-available/magento.conf
ADD conf/custom-xdebug.ini /usr/local/etc/php/conf.d/custom-xdebug.ini
COPY bin/* /usr/local/bin/
RUN chmod +x /usr/local/bin/*
RUN ln -s /etc/apache2/sites-available/magento.conf /etc/apache2/sites-enabled/magento.conf
