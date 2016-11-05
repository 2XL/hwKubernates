#!/usr/bin/env bash

sudo docker run \
				--volume=/:/rootfs:ro	\
				--volume=/sys:/sys:ro	\
				--volume=/dev:/dev	\
				--volume=/var/lib/docker/:/var/lib/docker:ro	\
				--volume=/var/lib/kubelet/:/var/lib/kubelet:rw	\
				--volume=/var/run:/var/run:rw	\
		        \
				--net=host	\
				\
				--pid=host	\
				\
				--privileged=true	\
				\
				-d gcr.io/google_containers/hyperkube:v1.0.1 \
				\
				/hyperkube kubelet	\
				--containerized	\
				--hostname-override="127.0.0.1"	\
				--address="0.0.0.0"	\
				--api-servers=http://localhost:8080	\
				--config=/etc/kubernetes/manifests

## Command parameters
# Docker volumenes to use
# connects the docker container to a network making use of the host container network inside the container
# set the pid namespace
# provides access to most of the capabilities of the host machine in terms of kernel features and host access
# starts the container in the background
# the container image
# the command run




## Master Components
# ApiServer: takes API requests, process them, and stores the result in etcd if required and returns the result.
# Scheduler: monitors the API for unscheduled pods and schedules them on a node to run and also notifies the about the same to the API
# Controller: manages the replication level of pods, starting new pods in a scale up event and stopping some of the pods in a scale down.
# Pause: keepds the ports mappings of all containers in the pod or the network endpoint of the pod.