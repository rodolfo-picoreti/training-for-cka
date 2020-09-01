#!/bin/bash

# Loadbalancer IP
KUBERNETES_PUBLIC_ADDRESS=192.168.1.9
#
CONTROLLER_INTERNAL_IPS=192.168.1.10,192.168.1.11,192.168.1.12
# The Kubernetes API server is automatically assigned the kubernetes internal dns name,
# which will be linked to the first IP address from the address range.
CLUSTER_FIRST_IP=10.32.0.1
#
KUBERNETES_HOSTNAMES=kubernetes,kubernetes.default,kubernetes.default.svc,kubernetes.default.svc.cluster,kubernetes.svc.cluster.local
#
workers="worker-0 worker-1"

# Etcd Config
ETCD_INITIAL_CLUSTER=controller-0=https://192.168.1.10:2380,controller-1=https://192.168.1.11:2380,controller-2=https://192.168.1.12:2380

# Control Plane Config
CLUSTER_CIDR=10.200.0.0/16
SERVICE_CLUSTER_IP_CIDR=10.32.0.0/24
ETCD_SERVERS=https://192.168.1.10:2379,https://192.168.1.11:2379,https://192.168.1.12:2379

# Worker Node Config
declare -A WORKER_IPS=(["worker-0"]="192.168.1.30" ["worker-1"]="192.168.1.31")
declare -A POD_CIDRS=(["worker-0"]="10.240.0.0/24" ["worker-1"]="10.240.1.0/24")

CLUSTER_DNS=10.32.0.10