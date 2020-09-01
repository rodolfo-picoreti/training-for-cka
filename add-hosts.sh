#!/bin/bash

set -e

declare -a hosts=(
  "192.168.1.30 worker-0"
  "192.168.1.31 worker-1"
)

for ((i = 0; i < ${#hosts[@]}; i++)); do
  host="${hosts[$i]}"
  if grep -q "$host" /etc/hosts
  then
    echo "Host $host already exists in /etc/hosts"
  else
    echo "Adding $host to /etc/hosts"
    sudo sh -c "echo $host >> /etc/hosts"
  fi
done