FROM tomcat:9-jre8
MAINTAINER James Hiebert <hiebert@uvic.ca>

ENV NCWMS_VERSION 2.2.5

RUN curl -L https://github.com/Reading-eScience-Centre/ncwms/releases/download/ncwms-$NCWMS_VERSION/ncWMS2.war > $CATALINA_HOME/webapps/ncWMS.war

EXPOSE 8080
