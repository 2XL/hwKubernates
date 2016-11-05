
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

#### Usefull Tools:

* Minikube: Install a single-node kubernetes cluster on local machine
```
## requirements: 
cat/proc/cpuinfo | grep 'vmx\|svm' # VT-x/AMD-v enabled in BIOS

## latest virutalbox
sudo apt-get install virtualbox-<x>

## minukube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.12.2/minikube-linux-amd64 
&& chmod +x minikube 
&& sudo mv minikube /usr/local/bin/


## kubectl
# linux/amd64
curl -Lo kubectl http://storage.googleapis.com/kubernetes-release/release/v1.3.0/bin/linux/amd64/kubectl && chmod +x kubectl && sudo mv kubectl /usr/local/bin/
# linux/386
curl -Lo kubectl http://storage.googleapis.com/kubernetes-release/release/v1.3.0/bin/linux/386/kubectl && chmod +x kubectl && sudo mv kubectl /usr/local/bin/
# linux/arm
curl -Lo kubectl http://storage.googleapis.com/kubernetes-release/release/v1.3.0/bin/linux/arm/kubectl && chmod +x kubectl && sudo mv kubectl /usr/local/bin/
# linux/arm64
curl -Lo kubectl http://storage.googleapis.com/kubernetes-release/release/v1.3.0/bin/linux/arm64/kubectl && chmod +x kubectl && sudo mv kubectl /usr/local/bin/
#linux/ppc64le
curl -Lo kubectl http://storage.googleapis.com/kubernetes-release/release/v1.3.0/bin/linux/ppc64le/kubectl && chmod +x kubectl && sudo mv kubectl /usr/local/bin/
# OS X/amd64 
curl -Lo kubectl http://storage.googleapis.com/kubernetes-release/release/v1.3.0/bin/darwin/amd64/kubectl && chmod +x kubectl && sudo mv kubectl /usr/local/bin/
# OS X/386 
curl -Lo kubectl http://storage.googleapis.com/kubernetes-release/release/v1.3.0/bin/darwin/386/kubectl && chmod +x kubectl && sudo mv kubectl /usr/local/bin/

```
* kops: Brung up complete kubernetes cluster on Amazon Web Services
* kubeadm: Install a secure kubernetes cluster on any pre-existing machines running linux



#### Kubernetes Components

1. etcd: simple, secure, fast and reliable distributed key-value store.

2. Kubernetes master: exposes K. API using which containers are run on nodes to handle tasks. 

3. Service proxy: runs on each node to provide the K. service interface for clients. It also routes the client traffic to a matching pod.

4. Kubelet: is an agent that runs on each node to monitor the containers running on the node, restarting them if required to keep the replication level.


#### Launching, Exposing, and Killing Applications [ref](http://kubernetes.io/docs/user-guide/quick-start/)

```
kubectl run <app-name> --image=<image-name> --replicas=<#replicas> --port=<port> 
# output: deployment "<app-name>" created 


```


 
#### Key Concepts

 * Kubernates is software for manage a cluster of Docker containers.
its management includes:
    * scheduling
    * distributing workload
    * scaling
    * seamlessly roll out/ roll back
 * Pod: is a collection fo one or more docker containers with single interface features such as providing network and filesystem at the  pod level rather than at the container level.
 * Labels: properties which services and replication controllers identify or select the containers or pods they manage. they are used to match a service with a pod
 
 * Service: is an abstraction for the logical set of pods represented by the service.
 
 
 * the private IP address of an Amazon EC2 instance remains the same across restarts
 
 
 * Container Benefits:
    * Agile application creation and deployment.
    * Continues development, integration, and deployment.
    * Dev and Ops separation of concerns.
    * Environmental consistency across development, testing and production.
    * Cloud and OS distribution portability
    * Application-centric manageent
    * Loosely coupled, distributed, elastic, liberated micro-services.
    * Resource isolation
    * Resource utilization
    



####

    