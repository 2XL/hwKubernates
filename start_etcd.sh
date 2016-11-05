#!/usr/bin/env bash
sudo docker run	\
 --net=host	\
 -d	gcr.io/google_containers/etcd:2.0.12 /usr/local/bin/etcd \
 --addr=127.0.0.1:4001	\
 --bind-addr=0.0.0.0:4001 \
 --data-dir=/var/etcd/data
