
# Pulling the latest base image for ubuntu
FROM centos
MAINTAINER Srikanth

# set user configurations
ARG USER_HOME=/root

# set dependant files directory
ARG FILES=./softwares

# set JDK configurations
ARG JDK=jdk1.8.0*


# set Tomcat configurations
ARG TOMCAT=apache-tomcat-8.5.31


# Copying JDK & Tomcat extracted files to root directory
COPY ${FILES}/${JDK} ${USER_HOME}/${JDK}
COPY ${FILES}/${TOMCAT} ${USER_HOME}/${TOMCAT}

# Change the ownership and full Permissions on JDK & Tomcat files to Root
RUN chown -R root:root ${USER_HOME}
RUN chmod -R 777 ${USER_HOME}

ARG JAVA_HOME=${USER_HOME}/${JDK}
ARG TOMCAT_HOME=${USER_HOME}/${TOMCAT}

 # Set the environment variables
ENV JAVA_HOME=${JAVA_HOME} \
   PATH=$JAVA_HOME/bin:$PATH \
   TOMCAT_HOME=${TOMCAT_HOME}

ADD ./targets/emasadmin.war ${USER_HOME}/${TOMCAT}/webapps/
ADD ./targets/emas2.war ${USER_HOME}/${TOMCAT}/webapps/

# Expose the port no's to map
EXPOSE 8080 9090 8081

# Excute the file using CMD command
#CMD ["${TOMCAT_HOME}/bin/catalina.sh", "run"]
ENTRYPOINT  ${TOMCAT_HOME}/bin/startup.sh && /bin/bash
