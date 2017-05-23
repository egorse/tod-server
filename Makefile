.PHONY: all container
all: tod-server

tod-server: main.go Makefile
	CGO_ENABLED=0 go build -ldflags="-s -w"

TRAVIS_TAG?=latest
image: tod-server Makefile Dockerfile
	echo docker login -u $(DOCKER_USER) -p $(DOCKER_PASSWORD)
	echo docker build -t tod-server .
	echo docker tag tod-server $(DOCKER_USER)/tod-server:$(TRAVIS_TAG)
	echo docker push $(DOCKER_USER)/tod-server:$(TRAVIS_TAG)
	echo docker logout
