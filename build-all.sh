#!/usr/bin/env bash

IMAGES=$*

logged_into_registry() {
	if docker info | grep -P "(Username|Registry)" > /dev/null; then
		return 0
	else
		return 1
	fi
}

main() {
	for image in $IMAGES; do
		make -C "$image" build
	done
}

main
