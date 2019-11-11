#!/bin/bash

# https://stackoverflow.com/a/41323079/6318316

imageName=propensity-minimal:latest
containerName=$(docker ps --filter "ancestor=${imageName}" -q --format '{{.Names}}')

docker build -t $imageName -f Dockerfile  .

echo Delete old container...
docker rm -f $containerName

echo Run new container...
docker run -d -p 8080:8080 --name $containerName $imageName serve
