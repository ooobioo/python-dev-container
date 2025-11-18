# Docker Dev Container

## Build container

docker build -t my-python-dev .

## Run container

docker run -it --rm -v $(pwd):/usr/app my-python-dev
docker run -it --rm -p 8080:8080 -v $(pwd):/usr/app my-python-dev

# Fast API

docker build -t myimage .
docker run -d --name mycontainer -p 8080:8080 myimage
