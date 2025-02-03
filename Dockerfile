FROM php:7.3-apache

WORKDIR /var/www/html/

RUN apt-get update && apt-get install -y \
ca-certificates \
zip \
unzip \
--no-install-recommends \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

RUN chown -R www-data:www-data /var/www/html/ && \
    chmod -R 755 /var/www/html/

COPY 000-default.conf /etc/apache2/sites-available/

COPY ./install-composer.sh /var/www/html/
RUN bash ./install-composer.sh && rm ./install-composer.sh

RUN a2enmod rewrite

EXPOSE 80

CMD ["apache2-foreground"]
