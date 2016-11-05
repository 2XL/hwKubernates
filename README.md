
##### TODO list:


* [ ] kubernates


#### Installing Kubernetes Using Docker

```
Services required for the current sample:

>Docker Engine (localhost One node Testing)
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

# Boostrap Kubernetes Service

./start_etcd.sh
./start_k8s_master.sh
./start_service_proxy.sh



## setup a service
kubectl run nginx --image=nginx


sudo docker ps
## the list will contain the following containers:
# container for the service proxy
# container for the kubelet
# container for the etcd
# container for the master scheduler, controller, apiserver,pause

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
    * Application-centric management
    * Loosely coupled, distributed, elastic, liberated micro-services.
    * Resource isolation
    * Resource utilization
    
 * What is a Node?
    node is a machine (physical or virtual) running kubernetes onto which pods may be scheduled.
    the node could be the master node of one of the worker nodes.

 * What is a Cluster?
    is a collection of nodes including other resources such as storage to run k8s apps.
    a cluster has a single k8s master node and zero or more worker nodes.
    a highly available cluster consists of multiple masters or master nodes.
 
 * What is a Pod? 
    is a collection of containers that are collocated and form an atomic unit.
    multiple apps may be run within a pod and though the different containers 
    within a pod could be for the same app.
 
 * What is a Service?
    is a external interface for one or more pods providing endpoints at which the application
    represented by the service may by invoked. a service is hosted at a single IP@ but
    provides zero or more endpoints depending on the application interface by the service.
    * services are connected to pods using label selectors.
    * an external client only need to know the name of the service and the port at which a particular application is exposed.
    * service can be used for load balancing.
 
 * What is a Replication Controller?
    it manages the representation level of pods as specified by the replicas setting in a replication controller defined or on the command line with replicas parameter.
    a replica controller is used for scaling the pods within a cluster. 
    a replica is defined at the pod level implying that if a pod consists of two containers
    a group of the two configured containers constitute a replica.
     
 * What is a Label?
    a label is a key-value pair identifying a resource such as a Pod, Service, ReplicaCtrl...
    most commonly a Pod, they are used to identify a group or subset of resources for tasks 
    such as assigning them to a Service.
 
 * What is a Selector?
    a selector is a key-value expression to identify resources using matching labels.
 
 
 * What is a Name?
    a name identifies a resource. a name is not the same as a label, a name is used for matching resources with a service a label is used and not a name.
 
 * What is a Namespace?
    a namespace is a level above the name to demarcate a group of resources for a project or team to prevent 
    name collisions. resources within different ns could have the same name, but resources within a namespace have different names.
 
 * What is a Volume?
    a volume is a directory within the fs of a container. a volume could be used to store data.
 
 * Why Kubernates?
    come along to overcome the lacking features of Docker containers orchestration.
    it provides a dynamic container cluster orchestration in real time. 
    * node scheduling, which node to run a certain service...
    * scaling, how to increase/decrease the number of running containers for an application
    * communication, how to communicate within containers
    it's a cluster manager which provides the following benefits:
    * Micro-services: by breaking an application into smaller, manageable, scalable components that could be used by groups with different requirements.
    * Fault-tolerant: clusters in which if a single pod replica fails (whatever motive), another is started automatically.
    * Horizontal scaling: additional or fewer replicas of a pod could be run by just modifying the replicas settings in the replication controller or using the replicas parameter in the `kubectl scale` command
    * Efficiency and Higher resource utilization
    * Separation of concerns. The service development team does not need to interface with the cluster infrastructure team.
 
 
 

####

    