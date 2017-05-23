.PHONY: all container
all: tod-server

tod-server: main.go Makefile
	CGO_ENABLED=0 go build -ldflags="-s -w"

container: tod-server
	docker build -t tod-server:latest .
