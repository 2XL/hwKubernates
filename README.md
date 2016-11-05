
##### TODO list:


* [ ] kubernates


#### Installing Kubernetes Using Docker

```
Services required for the current sample:

>Docker Engine
>AWS EC2

Machine requirements:

>kernel 3.10+ # uname -r
>64-bits      # uname -p

### installing Docker

sudo apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

## add repo to source

deb	https://apt.dockerproject.org/repo ubuntu-trusty main > /etc/apt/source.list.d/docker.list

<!--Ubuntu	Distribution          Entry-->
<!--Ubuntu	Precise	12.04	(LTS) deb	https://apt.dockerproject.org/repo	ubuntu-precise	main-->
<!--Ubuntu	Trusty	14.04	(LTS) deb	https://apt.dockerproject.org/repo	ubuntu-trusty	main-->
<!--Ubuntu	Vivid	15.04         deb	https://apt.dockerproject.org/repo	ubuntu-vivid	main-->

## update source list

sudo apt-get update

## to avoid conflicts purge old repositories 

sudo apt-get purge lxc-docker*

## verify that the apt is pulling from the docker repo

sudo apt-cache policy docker-engine

## install the prerequisite linux-image-extra: It contains extra drivers left out of the base kernel package; install it only if you need these drivers
sudo apt-get install linux-image-generic[-lts-<my-distro-version>] #


## optionally: create a root directory for kubernetes with global permissions

sudo mkdir /kubernetes
sudo chmod -R 777 /kubernetes



```

#### Kubernetes Components

1. etcd: simple, secure, fast and reliable distributed key-value store.

2. Kubernetes master: exposes K. API using which containers are run on nodes to handle tasks. 

3. Service proxy: runs on each node to provide the K. service interface for clients. It also routes the client traffic to a matching pod.

4. Kubelet: is an agent that runs on each node to monitor the containers running on the node, restarting them if required to keep the replication level.


####


 
#### Key Concepts

 * Kubernates is software for manage a cluster of Docker containers.
its management includes:
    * scheduling
    * distributing workload
    * scaling
 * Pod: is a collection fo one or more docker containers with single interface features such as providing network and filesystem at the  pod level rather than at the container level.
 * Labels: properties which services and replication controllers identify or select the containers or pods they manage. they are used to match a service with a pod
 
 * Service: is an abstraction for the logical set of pods represented by the service.
 
 
 * the private IP address of an Amazon EC2 instance remains the same across restarts
 
 
 



####

    