FROM alpine:latest

# install dependencies (curl, sudo, bash)
RUN apk --no-cache add curl sudo bash

# install zmk-viewer
RUN curl -sL https://raw.githubusercontent.com/MrMarble/zmk-viewer/master/scripts/install.sh | sudo -E bash -

WORKDIR /images
