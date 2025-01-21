FROM php:7.3-apache

WORKDIR /var/www/html/

RUN apt-get update && apt-get install -y \
git \
curl \
ca-certificates \
tar \
--no-install-recommends \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

RUN curl -fSL https://github.com/yiisoft/yii/releases/download/1.1.22/yii-1.1.22.bf1d26.tar.gz -o yii.tar.gz

RUN tar --strip-components=1 -xzf yii.tar.gz -C /var/www/html/
RUN rm yii.tar.gz

EXPOSE 80

CMD ["apache2-foreground"]
