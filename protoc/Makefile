include $(abspath ../base.mk)

DOCKER_ORG=seemethere
DOCKER_REPO_NAME=protoc
DOCKER_IMAGE=$(DOCKER_ORG)/$(DOCKER_REPO_NAME)

REF=v3.5.1
TAG=$(REF)
REPO=https://github.com/google/protobuf
BUILD_ARGS=--build-arg PROTOBUF_REF="$(REF)" --build-arg PROTOBUF_REPO="$(REPO)"
