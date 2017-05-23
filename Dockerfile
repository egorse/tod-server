FROM alpine:3.3
COPY tod-server /sbin/
EXPOSE 37/udp
ENTRYPOINT ["/sbin/tod-server"]
