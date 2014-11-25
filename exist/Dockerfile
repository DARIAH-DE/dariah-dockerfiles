#FROM ubuntu:14.10
FROM debian:wheezy
MAINTAINER Benedikt von St. Vieth

# install everything and clean-up afterwards
RUN apt-get update && apt-get upgrade -y && apt-get install -y wget openjdk-7-jre-headless && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN useradd -s /bin/nologin exist
RUN chown -R exist:exist /opt
USER exist

# install exist and cleanup
RUN wget -O '/opt/exist.jar' 'http://downloads.sourceforge.net/project/exist/Stable/2.2/eXist-db-setup-2.2RC2.jar' && \
    echo 'INSTALL_PATH=/opt/exist' > '/opt/options.txt' && \
    java -jar '/opt/exist.jar' -options '/opt/options.txt' && \
    rm -f '/opt/exist.jar' '/opt/options' 

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh

EXPOSE 8080
