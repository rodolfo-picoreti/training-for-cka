#!/bin/bash

kubeconfig=controller-certs/admin-external.kubeconfig

kubectl apply --kubeconfig ${kubeconfig} -f coredns-1.7.0.yaml