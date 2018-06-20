SHELL:=/bin/bash
IMAGES=$(shell find . -name "Dockerfile" | xargs dirname)

.PHONY: build
build:
	for image in $(IMAGES); do \
		make -C "$$image" build || exit 1; \
	done

.PHONY: clean
clean:
	for image in $(IMAGES); do \
		make -C "$$image" clean || exit 1; \
	done
