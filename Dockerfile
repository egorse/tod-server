FROM alpine:3.1
COPY tod-server /
EXPOSE 37/udp
ENTRYPOINT [/tod-server]
