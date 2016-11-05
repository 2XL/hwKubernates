#!/usr/bin/env bash

sudo docker run \
 -d \
 --net=host \
 --privileged \
 gcr.io/google_containers/hyperkube:v1.0.1 \
 /hyperkube proxy --master=http://127.0.0.1:8080  --v=2


## Description: to start the proxy, which is a proxy for the kubernates service providing a pod's interface using a service selector with labels.

## Command
# run the container in the background
# sets the network for the container to the host's network
# provides access to most of the capabilities of the host machine in term of kernel features and host access
# the container image
# the command to run. the master url is set to http://<ip>:<port>