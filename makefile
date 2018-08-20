.PHONY: clean build push docker-build docker-tag docker-push

registry := quantworks
image := node-ci
tag := $(shell git rev-parse --short HEAD)

clean:
	docker image prune -f

build: clean docker-build docker-tag

push: docker-push

# --- docker ---

docker-build:
	docker build -t $(registry)/$(image) .

docker-tag:
	docker tag $(registry)/$(image) $(registry)/$(image):$(tag)
	docker tag $(registry)/$(image) $(registry)/$(image):latest

docker-push:
	docker push $(registry)/$(image):$(tag)
	docker push $(registry)/$(image):latest
