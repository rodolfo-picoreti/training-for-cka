#!/bin/bash

set -e

cd /data
./bootstrap-worker-node.sh
./add-routes.sh