#!/bin/bash
if [ ! -d "/usr/local/lib/yii/" ]; then
  sudo mkdir /usr/local/lib/yii/

  curl -fSL https://github.com/yiisoft/yii/releases/download/1.1.22/yii-1.1.22.bf1d26.tar.gz -o yii.tar.gz

  sudo tar --strip-components=1 -xzf yii.tar.gz -C /usr/local/lib/yii/
  rm yii.tar.gz

  export YII=/usr/local/lib/yii/
fi

sudo chmod -R 777 /usr/local/lib/yii/
sudo chgrp -R www-data /usr/local/lib/yii/
sudo chmod -R g+rw /usr/local/lib/yii/

sudo chmod -R 777 ./app
sudo chgrp -R www-data ./app
sudo chmod -R g+rw ./app

read -p "Enter container name: " name

image=$(docker ps -a --format "{{.Image}}" --filter "name=^/${name}$")

if [ -z "$image" ]; then
  echo "No container found with the name: $name"
else
  docker run \
    -v ./:/var/www/html/WebRoot \
    -v $YII:/usr/local/lib/yii \
    -it $image \
    bash
fi
