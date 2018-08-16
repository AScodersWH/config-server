#!/bin/bash

./gradlew clean bootRepackage

docker build --rm . --tag xueqingliao/config-server:${VER:?invalid version}
docker push xueqingliao/config-server:${VER:?invalid version}

export VER
docker stack deploy todo -c docker-compose.yml