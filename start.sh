#!/bin/bash
sudo chmod -R 777 ./src
sudo chgrp -R www-data ./src
sudo chmod -R g+rw ./src

sudo chmod -R 777 ./src ./yii
sudo chgrp -R www-data ./src ./yii
sudo chmod -R g+rw ./src ./yii

if [ ! -f ./yii/framework/yii.php ]; then
curl -fSL https://github.com/yiisoft/yii/releases/download/1.1.22/yii-1.1.22.bf1d26.tar.gz -o yii.tar.gz

tar --strip-components=1 -xzf yii.tar.gz -C ./yii
rm yii.tar.gz
fi

## run bash inside container
read -p "Enter container name: " name

image=$(docker ps -a --format "{{.Image}}" --filter "name=^/${name}$")

if [ -z "$image" ]; then
  echo "No container found with the name: $name"
else
  docker run \
  -v ./src:/var/www/html/WebRoot \
  -v ./yii:/var/www/html/yii \
  -it $image \
  bash
fi