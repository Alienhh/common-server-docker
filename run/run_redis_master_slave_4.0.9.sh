#!/bin/bash

root_path=`cd "$(dirname "$0")"; pwd`

compose_file=${root_path}/../conf/redis/master_slave/docker-compose.yml

# run docker
docker-compose -f ${compose_file} up --build -d
