SHELL:=/bin/bash
IMAGES=$(shell find . -name "Dockerfile" | xargs dirname)

.PHONY: build
build:
	for image in $(IMAGES); do \
		make -C "$$image" build || exit 1; \
	done
