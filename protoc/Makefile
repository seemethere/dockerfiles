DOCKER_ORG=seemethere
DOCKER_REPO_NAME=protoc
DOCKER_IMAGE=$(DOCKER_ORG)/$(DOCKER_REPO_NAME)

REF=v3.5.1
REPO=https://github.com/google/protobuf
BUILD_ARGS=--build-arg PROTOBUF_REF="$(REF)" --build-arg PROTOBUF_REPO="$(REPO)"

FULL_DOCKER_IMAGE=$(DOCKER_IMAGE):$(REF)

all: image

.PHONY: image
image:
	docker build $(BUILD_ARGS) -t $(FULL_DOCKER_IMAGE) .

.PHONY: exists
exists:
	docker pull $(FULL_DOCKER_IMAGE)

.PHONY: release
release: image
	docker push $(FULL_DOCKER_IMAGE)

.PHONY: clean
clean:
	-docker rmi -f $$(docker images -q $(DOCKER_IMAGE))
