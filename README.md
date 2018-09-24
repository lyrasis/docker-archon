# Docker Archon

```bash
docker-compose build
docker-compose up
```

## Custom builds

```bash
VERSION=3.21.3
URL=https://github.com/archonproject/archon.git
docker-compose build --build-arg ARCHON_VERSION=$BRANCH ARCHON_URL=$URL app
docker-compose up
```

## Docker hub

To push this to docker hub follow the standard [docs](https://docs.docker.com/docker-cloud/builds/push-images/):

```bash
VERSION=3.21.3
DOCKER_ID_USER=lyrasis
docker tag archon:latest $DOCKER_ID_USER/archon:$VERSION
docker push $DOCKER_ID_USER/archon:$VERSION
```

---
