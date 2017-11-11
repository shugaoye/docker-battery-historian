FROM golang:latest
MAINTAINER shugaoye@yahoo.com

COPY scripts/sources.list /etc/apt/sources.list

RUN apt-get -y update && apt-get install -y openjdk-8-jre

RUN go get -d -u github.com/google/battery-historian
WORKDIR /go/src/github.com/google/battery-historian
RUN go run setup.go

EXPOSE 9999

