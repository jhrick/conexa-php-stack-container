FROM php:7.2-apache

WORKDIR /var/www/html/

RUN apt-get update && apt-get install -y \
git \
curl \
ca-certificates \
tar \
--no-install-recommends \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

RUN curl -fSL https://raw.githubusercontent.com/yiisoft-contrib/museum/master/files/yii-1.0rc.r187.tar.gz -o yii.tar.gz

RUN tar -xzf yii.tar.gz

EXPOSE 80

CMD ["apache2-foreground"]
