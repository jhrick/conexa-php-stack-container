#!/bin/bash
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