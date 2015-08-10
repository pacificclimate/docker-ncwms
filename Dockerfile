FROM tomcat:7.0
MAINTAINER Basil Veerman <bveerman@uvic.ca>

COPY ncwms/ncWMS-1.2.war ${CATALINA_HOME}/webapps/ncWMS.war

EXPOSE 8080
