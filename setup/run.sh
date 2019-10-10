#!/usr/bin/env bash

image_name=${1:-fast-api-example}
container_name=${2:-fast-api-example}

echo $image_name, $container_name

docker build -t $image_name -f setup/Dockerfile  .

echo Delete old container...
docker rm -f $container_name

echo Run new container...
docker run -d -p 5000:80 --name $container_name $image_name