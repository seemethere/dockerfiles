# Hey why is this ubuntu bionic?
# Because it contains the correct glibc libraries required to run rust binaries
FROM ubuntu:bionic

MAINTAINER Eli Uriegas <eli.uriegas@docker.com>

ARG REF
RUN apt-get update && apt-get install -y curl
RUN curl -L https://github.com/amzn/askalono/releases/download/${REF}/askalono.linux > /askalono
RUN apt-get purge -y curl && apt-get clean
RUN chmod +x /askalono

ENTRYPOINT [ "/askalono" ]
