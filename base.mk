FULL_DOCKER_IMAGE=$(DOCKER_IMAGE):$(TAG)

all: build

.PHONY: build
build:
	docker build $(BUILD_ARGS) -t $(FULL_DOCKER_IMAGE) .

.PHONY: exists
exists:
	docker pull $(FULL_DOCKER_IMAGE)

.PHONY: release
release:
	docker push $(FULL_DOCKER_IMAGE)

.PHONY: clean
clean:
	-docker rmi -f $$(docker images -q $(DOCKER_IMAGE))
