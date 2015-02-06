FROM debian:wheezy
MAINTAINER Jedrzej Rybicki

RUN useradd -s /bin/nologin voyant
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get upgrade -y && apt-get install -y zip wget openjdk-7-jre-headless && \
  apt-get clean autoclean && apt-get autoremove && rm -rf /var/lib/{apt,dpkg,cache,log}
EXPOSE 8888
RUN echo -e 'port = 8888\nmemory = 1024\ndata_directory = /opt/data/\nuri_path = /\nhost = 0.0.0.0' > /opt/server-settings.txt
RUN wget -O '/opt/voyant.zip' 'http://dev.voyant-tools.org/downloads/current/VoyantServer.zip' && \
    cd /opt/ && unzip voyant.zip && rm voyant.zip && chown -R voyant:voyant /opt/
VOLUME /opt/data/
WORKDIR /opt/
USER voyant
CMD java -jar VoyantServer.jar --headless=true

