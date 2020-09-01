#!/bin/bash

set -e

cd /data
./add-hosts.sh
./bootstrap-etcd.sh
./bootstrap-control-plane.sh