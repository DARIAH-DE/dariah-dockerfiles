FROM tomcat:7.0
MAINTAINER Jedrzej Rybicki

EXPOSE 8080
RUN wget -q -O '/tmp/voyant.zip' 'http://dev.voyant-tools.org/downloads/current/VoyantServer.zip' && \
    mkdir /tmp/voyant/ && cd /tmp/voyant/ && unzip -qq /tmp/voyant.zip && \
    rm -rf /usr/local/tomcat/webapps/ROOT/ && cp -r _app/ /usr/local/tomcat/webapps/ROOT/ && \
    cd /usr/local/tomcat/ && rm -rf /tmp/voyant.zip /tmp/voyant/ && echo 'starting up...' > logs/empty.log 
VOLUME /usr/local/tomcat/temp
CMD bin/startup.sh && tail -f logs/*.log
