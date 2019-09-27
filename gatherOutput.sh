#!/bin/bash
DOCKERNAME="archiveLib"

#Run the docker image
docker run -itd --name $DOCKERNAME --memory=1024m --cpus=1 yaml-cpp:0.1

#Copy the generated tar.gz
docker cp $DOCKERNAME:/buildOutput/ ./

#destroy the docker container and remove the generated image
docker rm -f `docker ps -qa`
docker rmi "yaml-cpp:0.1"

