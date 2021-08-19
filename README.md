
# DockerCARNIVAL

Repository for building a docker image of [CARNIVAL](https://github.com/saezlab/CARNIVAL/).

## Build

To create a new image:
```
docker build -t carnival:latest -f Dockerfile .
```

## Download

To download an image from [dockerhub](https://hub.docker.com/repository/docker/bartoszbartmanski/carnival):
``` 
docker pull bartoszbartmanski/carnival:<version>
```
For example:
```
docker pull bartoszbartmanski/carnival:2.2.0
```

