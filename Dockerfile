FROM golang:1.8.1 as builder
WORKDIR /go/src/github.com/egorse/tod-server/
COPY . .
RUN CGO_ENABLED=0 go build -ldflags="-s -w"

FROM alpine:3.3
WORKDIR /sbin/
COPY --from=builder /go/src/github.com/egorse/tod-server/tod-server .
EXPOSE 37/udp
CMD ["/sbin/tod-server"]
