# Try to get latest version from Docker Hub, fallback to default if fails
LATEST_VERSION=${LATEST_VERSION:-$(curl -s https://hub.docker.com/v2/repositories/xprobe/xinference/tags/ | grep -o '"name":"[^"]*"' | cut -d'"' -f4 | grep -v latest | sort -V | tail -n 1 || echo "v1.2.0")}
DOCKER_IMAGE=xprobe/xinference:${LATEST_VERSION}

echo "Pulling image: ${DOCKER_IMAGE}..."
singularity pull docker://${DOCKER_IMAGE}
