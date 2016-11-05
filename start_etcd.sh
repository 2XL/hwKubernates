#!/usr/bin/env bash
sudo docker run	\
 --net=host	\
 -d	\
 gcr.io/google_containers/etcd:2.0.12 \
 /usr/local/bin/etcd \
 --addr=127.0.0.1:4001	\
 --bind-addr=0.0.0.0:4001 \
 --data-dir=/var/etcd/data

## Fields
# connects the docker container to a network making use of the host container network inside the container
# starts the container in the background
# the container image
# the command to run <etcd> <args>

## start_etcd is required to be run each time k8s cluster manager is to be started