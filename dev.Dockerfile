FROM golang:1.12.9-alpine3.10

RUN set -eux; \
    apk add --no-cache git curl protobuf \
    && go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway \
    && go get -u github.com/golang/protobuf/protoc-gen-go \
    && curl -L -o /tmp/protobuf.tar.gz https://github.com/google/protobuf/releases/download/v3.0.0/protoc-3.0.0-linux-x86_64.zip \
    && unzip /tmp/protobuf.tar.gz -d /tmp/. \
    && mv include /usr/local/. \
    && mkdir /go/src/user

WORKDIR /go/src/user