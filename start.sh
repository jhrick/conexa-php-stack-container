#!/bin/bash

## get write permissons
sudo chmod -R 777 ./src
sudo chgrp -R www-data ./src
sudo chmod -R g+rw ./src

## run bash inside container
read -p "Enter container name: " name

image=$(docker ps -a --format "{{.Image}}" --filter "name=^/${name}$")

if [ -z "$image" ]; then
  echo "No container found with the name: $name"
else
  docker run \
  -v ./src:/var/www/html/WebRoot \
  -it $image \
  bash
fi