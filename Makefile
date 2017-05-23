.PHONY: all container
all: tod-server

tod-server: main.go Makefile
	CGO_ENABLED=0 go build -ldflags="-s -w"

DOCKER_TAG := $(if $(TRAVIS_TAG),$(TRAVIS_TAG),latest)
image: tod-server Makefile Dockerfile
	docker login -u $(DOCKER_USER) -p $(DOCKER_PASSWORD)
	docker build -t tod-server .
	docker tag tod-server $(DOCKER_USER)/tod-server:$(DOCKER_TAG)
	docker push $(DOCKER_USER)/tod-server:$(DOCKER_TAG)
	docker logout
