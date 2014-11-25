FROM debian:wheezy
MAINTAINER Benedikt von St. Vieth

# install everything and clean-up afterwards
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get upgrade -y && apt-get install -y wget openjdk-7-jre-headless && \
  apt-get clean autoclean && apt-get autoremove && rm -rf /var/lib/{apt,dpkg,cache,log}

# install exist and cleanup
RUN wget -O '/opt/exist.jar' 'http://downloads.sourceforge.net/project/exist/Stable/2.2/eXist-db-setup-2.2RC2.jar' && \
    echo 'INSTALL_PATH=/opt/exist' > '/opt/options.txt' && \
    java -jar '/opt/exist.jar' -options '/opt/options.txt' && \
    rm -f '/opt/exist.jar' '/opt/options' 

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh

RUN useradd -s /bin/nologin exist && chown -R exist:exist /opt 
# too much?
VOLUME /opt/exist/webapp/WEB-INF/data/
USER exist

EXPOSE 8080
