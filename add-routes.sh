#!/bin/bash

set -e

source variables.sh

for worker in "${!POD_CIDRS[@]}"; do
  if [ "$worker" == "$HOSTNAME" ]; then
    continue
  fi

  if ip route | grep -q ${POD_CIDRS[$worker]}
  then
    echo "Route ${POD_CIDRS[$worker]} via ${WORKER_IPS[$worker]} already exists"
  else
    echo "Adding route ${POD_CIDRS[$worker]} via ${WORKER_IPS[$worker]}"
    sudo ip route add ${POD_CIDRS[$worker]} via ${WORKER_IPS[$worker]};
  fi
done
