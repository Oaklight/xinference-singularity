LATEST_VERSION=${LATEST_VERSION:-v1.2.0}
DOCKER_IMAGE=xprobe/xinference:${LATEST_VERSION}

echo "Pulling image: ${DOCKER_IMAGE}..."
singularity pull docker://${DOCKER_IMAGE}
