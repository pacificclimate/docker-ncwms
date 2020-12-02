FROM tomcat:9-jdk11
MAINTAINER James Hiebert <hiebert@uvic.ca>

# Add Tomcat User/Group
ARG RUN_USER=tomcat
ARG RUN_GROUP=tomcat
RUN groupadd -r ${RUN_GROUP} && \
    useradd -g ${RUN_GROUP} -d ${CATALINA_HOME} -s /bin/bash ${RUN_USER} && \
    chown -R tomcat:tomcat $CATALINA_HOME

USER ${RUN_USER}

# Download and unpack the full EPSG geodetic dataset
ADD --chown=tomcat:tomcat https://repo1.maven.org/maven2/org/apache/sis/non-free/sis-embedded-data/1.0/sis-embedded-data-1.0.jar ./sis-embedded-data-1.0.jar
RUN unzip sis-embedded-data-1.0.jar && \
    rm sis-embedded-data-1.0.jar
# Unpacking the jar creates a *directory* called SIS_DATA containing the dataset.
# The *env variable* SIS_DATA tells ncWMS where to find it.
ENV SIS_DATA=/usr/local/tomcat/SIS_DATA

# Download the ncWMS 2.5.1 snapshot (pre-release version).
# Note error in version number in release name: 1.5.1 should be 2.5.1.
# TODO: Use ADD instead
RUN curl -L https://github.com/Reading-eScience-Centre/ncwms/releases/download/1.5.1-SNAPSHOT-dynamic-dataset-fix/ncWMS2.war > $CATALINA_HOME/webapps/ncWMS.war

EXPOSE 8080
