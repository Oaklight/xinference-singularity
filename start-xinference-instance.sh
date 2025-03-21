#!/bin/bash

LATEST_VERSION=${LATEST_VERSION:-v1.2.2}

BASE_DIR=${BASE_DIR:-${HOME}/dockervol/xinference/}
LOCAL_DIR=${LOCAL_DIR:-${BASE_DIR}/.xinference}
INSTANCE_NAME=${INSTANCE_NAME:-xinference}
LOG_FILE=${LOG_FILE:-${BASE_DIR}/xinference.log}

# Start the Singularity instance
singularity instance start \
  --fakeroot \
  --env XINFERENCE_MODEL_SRC=huggingface \
  --bind $LOCAL_DIR:/root/.xinference \
  --nv \
  --bind /tmp/.X11-unix:/tmp/.X11-unix \
  ${BASE_DIR}/xinference_${LATEST_VERSION}.sif \
  $INSTANCE_NAME

# Run the xinference-local command inside the instance
singularity exec instance://$INSTANCE_NAME \
  xinference-local -H 0.0.0.0 --log-level debug >>${LOG_FILE} 2>&1
