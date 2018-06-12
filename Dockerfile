
# Pulling the latest base image for ubuntu
FROM eaiesbhub/tomcat
MAINTAINER Sudheekar

ARG USER_HOME=/root
ARG TOMCAT=apache-tomcat-8.5.31
ARG TOMCAT_HOME=${USER_HOME}/${TOMCAT}
RUN chown -R root:root ${USER_HOME}
RUN chmod -R 777 ${USER_HOME}

ENV TOMCAT_HOME=${TOMCAT_HOME}

# Expose the port no's to map
EXPOSE 8080 9090 8081

# Excute the file using CMD command
 ENTRYPOINT  ${TOMCAT_HOME}/bin/startup.sh && /bin/bash
#CMD ["${TOMCAT_HOME}/bin/catalina.sh", "run"]
