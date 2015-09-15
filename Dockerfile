FROM php:5.6-apache
COPY config/php.ini /usr/local/etc/php/php.ini
COPY src/ /var/www/html/
RUN a2enmod rewrite

# Install modules
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
	php5-mysql \
    && docker-php-ext-install iconv mcrypt pdo pdo_mysql zip mbstring \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd

COPY permissions.sh /root/
RUN chmod u+x /root/permissions.sh
RUN sh /root/permissions.sh
