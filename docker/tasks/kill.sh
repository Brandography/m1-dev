#!/usr/bin/env bash
cd ../
source ../../.env

docker-compose -p $PROJECT_NAME stop
docker-compose -p $PROJECT_NAME down -v