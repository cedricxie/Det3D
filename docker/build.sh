#!/bin/sh

DOCKER_NAME=cedricxie/det3d_base
DOCKERFILE_NAME=Dockerfile_Det3D_base.gpu

docker build -t $DOCKER_NAME -f $DOCKERFILE_NAME . --no-cache