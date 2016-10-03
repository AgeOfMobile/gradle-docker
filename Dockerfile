FROM anapsix/alpine-java:8_jdk

MAINTAINER Tri Bui <tri.bui@pycogroup.com>

ENV IVY_HOME /cache
ENV GRADLE_VERSION=3.1
ENV GRADLE_HOME /usr/local/gradle
ENV GRADLE_FOLDER=/root/.gradle
ENV PATH ${PATH}:${GRADLE_HOME}/bin

# Change to tmp folder
WORKDIR /usr/local

# Download and extract gradle to opt folder
RUN apk update && \
    apk add ca-certificates && \
    update-ca-certificates && \
    apk add openssl && \
    wget https://downloads.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip && \
    unzip gradle-$GRADLE_VERSION-bin.zip && \
    rm -f gradle-$GRADLE_VERSION-bin.zip && \
    ln -s gradle-$GRADLE_VERSION gradle

# Create .gradle folder
RUN mkdir -p $GRADLE_FOLDER

# Mark as volume
VOLUME  $GRADLE_FOLDER