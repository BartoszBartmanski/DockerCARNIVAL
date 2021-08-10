
# DockerCARNIVAL

Repository for [CARNIVAL](https://github.com/saezlab/CARNIVAL/)
docker images based on Ubuntu 20.04. 

## Build

To create a new image:
```
cd <version>
docker build -t carnival:<version> -f Dockerfile .
```
For example:
```
cd 2.2.0
docker build -t carnival:2.2.0 -f Dockerfile .
```

## Download

To download an image:
```
docker pull bartoszbartmanski/carnival:<version>
```
For example:
```
docker pull bartoszbartmanski/carnival:2.2.0
```

