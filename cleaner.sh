#! /bin/bash
docker-compose down
docker rmi ha-proxy-ka-docker_lb-backup
docker rmi ha-proxy-ka-docker_lb-master
docker rmi ha-proxy-ka-docker_server-one
docker rmi ha-proxy-ka-docker_server-two
