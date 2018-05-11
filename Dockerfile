#
# Grakn Dockerfile
#
# https://github.com/bfergerson/grakn-dockerfile
#
FROM ubuntu
RUN apt-get update && apt-get install -y software-properties-common
#RUN apt-get update && apt-get install -y iputils-ping
#RUN apt-get install nano

RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

MAINTAINER github.com/bfergerson

ENV GRAKN_VERSION=1.2.0

ADD https://github.com/graknlabs/grakn/releases/download/v${GRAKN_VERSION}/grakn-dist-${GRAKN_VERSION}.tar.gz /tmp

RUN mkdir -p /opt && \
    tar -C /opt -xvf /tmp/grakn-dist-${GRAKN_VERSION}.tar.gz && \
    rm -f /tmp/grakn-dist-${GRAKN_VERSION}.tar.gz

WORKDIR /opt/grakn-dist-${GRAKN_VERSION}

#VOLUME ["/opt/grakn-dist-${GRAKN_VERSION}/conf", "/opt/grakn-dist-${GRAKN_VERSION}/logs"]

EXPOSE 4567

RUN echo "./grakn server start" >> /etc/bash.bashrc
ENTRYPOINT ["/bin/bash"]