.PHONY: all container
all: tod-server

tod-server: main.go Makefile
	CGO_ENABLED=0 go build -ldflags="-s -w"

container: tod-server Makefile Dockerfile
	docker login
	docker build -t tod-server:latest .
	#docker tag tod-server egorse/tod-server:latest
	#docker push egorse/tod-server:latest
	docker logout
