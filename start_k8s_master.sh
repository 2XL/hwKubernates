#!/usr/bin/env bash

sudo docker run \
				--volume=/:/rootfs:ro	\
				--volume=/sys:/sys:ro	\
				--volume=/dev:/dev	\
				--volume=/var/lib/docker/:/var/lib/docker:ro	\
				--volume=/var/lib/kubelet/:/var/lib/kubelet:rw	\
				--volume=/var/run:/var/run:rw	\
				--net=host	\
				--pid=host	\
				--privileged=true	\
				-d gcr.io/google_containers/hyperkube:v1.0.1 /hyperkube	kubelet	\
				--containerized	\
				--hostname-override="127.0.0.1"	\
				--address="0.0.0.0"	\
				--api-servers=http://localhost:8080	\
				--config=/etc/kubernetes/manifests

