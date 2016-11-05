#!/usr/bin/env bash

sudo docker run -d \
 --net=host \
 --privileged gcr.io/google_containers/hyperkube:v1.0.1 /hyperkube proxy \
 --master=http://127.0.0.1:8080 \
 --v=2

