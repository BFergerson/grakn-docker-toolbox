#
# Grakn Dockerfile
#
# https://github.com/bfergerson/grakn-dockerfile
#
FROM openjdk:8-jre-alpine

MAINTAINER github.com/bfergerson

ENV GRAKN_VERSION=1.2.0

ADD https://github.com/graknlabs/grakn/releases/download/v${GRAKN_VERSION}/grakn-dist-${GRAKN_VERSION}.tar.gz /tmp

RUN mkdir -p /opt && \
    tar -C /opt -xvf /tmp/grakn-dist-${GRAKN_VERSION}.tar.gz && \
    rm -f /tmp/grakn-dist-${GRAKN_VERSION}.tar.gz

WORKDIR /opt/grakn-dist-${GRAKN_VERSION}

VOLUME ["/opt/grakn-dist-${GRAKN_VERSION}/conf", "/opt/grakn-dist-${GRAKN_VERSION}/logs"]

EXPOSE 4567
