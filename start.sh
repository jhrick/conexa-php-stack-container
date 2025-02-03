#!/bin/bash
sudo chmod -R 777 ./app
sudo chgrp -R www-data ./app
sudo chmod -R g+rw ./app

sudo chmod -R 777 ./
sudo chgrp -R www-data ./
sudo chmod -R g+rw ./

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
