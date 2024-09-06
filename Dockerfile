FROM alpine:latest

# install dependencies (go)
RUN apk add go

# install zmk-viewer to path
RUN GOBIN=/usr/local/bin/ go install github.com/mrmarble/zmk-viewer/cmd/zmk-viewer@latest

WORKDIR /images
