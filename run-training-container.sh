#!/bin/bash

if [[ -z "${DS_DIR}" ]]; then
  echo "Please set the environment variable 'DS_DIR' to point to directory containing datasets."
  exit -1
fi

if [[ -z "${ROOT_CACHE_DIR}" ]]; then
  echo "Please set the environment variable 'ROOT_CACHE_DIR' to point to directory which will contain cache contents from root home in container, this is purely to speed up the process."
  exit -1
fi

if [[ -z "${CHECKPOINT_DIR}" ]]; then
  echo "Please set the environment variable 'CHECKPOINT_DIR' to point to directory which will contian the trained models."
  exit -1
fi

docker run --rm -it --gpus=all --ipc=host \
-v $DS_DIR:/datasets \
-v $ROOT_CACHE_DIR:/root/.cache \
-v $CHECKPOINT_DIR:/checkpoints \
-v $PWD:/workspace \
ssd-pytorch:latest