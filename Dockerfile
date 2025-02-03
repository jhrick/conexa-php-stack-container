FROM php:7.3-apache

WORKDIR /var/www/html/

RUN apt-get update && apt-get install -y \
ca-certificates \
--no-install-recommends \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

RUN chown -R www-data:www-data /var/www/html/ && \
    chmod -R 755 /var/www/html/

COPY 000-default.conf /etc/apache2/sites-available/

COPY yii.sh /usr/bin/
RUN chmod +x /usr/bin/yii.sh
RUN echo "alias yii=yii.sh" >> ~/.bashrc
RUN export YII=/usr/local/lib/yii/

RUN a2enmod rewrite

EXPOSE 80

CMD ["apache2-foreground"]
