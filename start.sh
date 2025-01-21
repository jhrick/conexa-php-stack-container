#!/bin/bash
docker run \
  -v ./src:/var/www/html/WebRoot \
  -it yii-docker-server \
  bash