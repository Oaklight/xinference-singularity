LATEST_VERSION=${LATEST_VERSION:-v1.2.2}

LOCAL_DIR=${LOCAL_DIR:-${HOME}/dockervol/xinference/.xinference}

singularity exec --fakeroot \
  --env XINFERENCE_MODEL_SRC=huggingface \
  --bind $LOCAL_DIR:/root/.xinference \
  --nv \
  --bind /tmp/.X11-unix:/tmp/.X11-unix \
  ${HOME}/dockervol/xinference/xinference_${LATEST_VERSION}.sif \
  xinference-local -H 0.0.0.0 --log-level debug
