FROM golang:1.10

MAINTAINER Eli Uriegas <eli.uriegas@docker.com>

RUN apt-get update && apt-get install -y git make autoconf automake libtool unzip

# Clone the initial protobuf library down
RUN mkdir -p /src
WORKDIR /src
ARG PROTOBUF_REF
ARG PROTOBUF_REPO
RUN git clone ${PROTOBUF_REPO}

# Switch to protobuf folder and carry out build
WORKDIR /src/protobuf
RUN git checkout ${PROTOBUF_REF}
# Cherry pick specific for big endian systems, see https://github.com/google/protobuf/pull/3955
RUN git cherry-pick -n 642e1ac635f2563b4a14c255374f02645ae85dac
RUN ./autogen.sh && ./configure --prefix=/usr
RUN make -j 3
RUN make check install

# Cleanup protobuf after installation
WORKDIR /src
RUN rm -rf protobuf

FROM golang:1.10-alpine

RUN apk -U add git

# TODO: Lock this down to specific versions
# Install gogo, an optimised fork of the Golang generators
RUN go get github.com/gogo/protobuf/proto \
       github.com/gogo/protobuf/protoc-gen-gogo \
       github.com/gogo/protobuf/gogoproto \
       github.com/gogo/protobuf/protoc-gen-gogofast \
       github.com/gogo/protobuf/protoc-gen-gogofaster \
       github.com/gogo/protobuf/protoc-gen-gogoslick

ENTRYPOINT ["protoc"]
