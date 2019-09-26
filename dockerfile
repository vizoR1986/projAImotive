#getting the image 
FROM ubuntu:18.04

MAINTAINER rnagy

RUN apt-get update && \
    apt-get install -y \
    cmake \
    tar \
    gzip \
    git \
    build-essential \
    g++ \
    && apt-get clean

COPY ./cmd.sh /startup.sh

RUN /startup.sh
RUN mkdir /buildOutput
RUN cp /*.gz /buildOutput

ENTRYPOINT ["/bin/sh"]
