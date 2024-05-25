#!/bin/bash
source $CODETREATS_BASHUTILS_DIR/docker-utils.sh
export MONITOR_SRC=pipeline.codetreats.internet-stats

CONFIG=$1
if [[ $CONFIG == "" ]] ; then
  CONFIG=config.cfg
fi

echo "Use config: $CONFIG"

source $CONFIG

remove_container internet-stats
prune_images
build_and_up internet-stats:master