FROM debian:wheezy
MAINTAINER jj <somemail@mail.com>
RUN apt-get update && apt-get install openjdk-7-jre-headless wget -y && \
   apt-get clean autoclean && apt-get autoremove && \
   rm -rf /var/lib/{apt,dpkg,cache,log}
RUN wget -O - http://neo4j.com/artifact.php?name=neo4j-community-2.1.5-unix.tar.gz | tar zxf - && ln -s neo4j-community-2.1.5/ /neo4j && \
 sed -i 's/#org.neo4j.server.webserver.address/org.neo4j.server.webserver.address/g' /neo4j/conf/neo4j-server.properties
EXPOSE 7474 7473
VOLUME /neo4j/data/
CMD /neo4j/bin/neo4j start-no-wait && tail -f /neo4j/data/log/*.log
