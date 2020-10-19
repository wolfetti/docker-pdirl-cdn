#!/bin/bash

if [[ "$(docker ps -a | grep 'wolfetti-pdirl-cdn-dev')" != "" ]]; then
  docker stop wolfetti-pdirl-cdn-dev
  docker rm wolfetti-pdirl-cdn-dev
fi

docker volume create wolfetti-pdirl-cdn-dev_data

docker run -d --name wolfetti-pdirl-cdn-dev \
  -p 35080:80 \
  -v wolfetti-pdirl-cdn-dev_data:/var/www/html \
  wolfetti/pdirl-cdn
