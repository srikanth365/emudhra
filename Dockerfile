
# Pulling the latest base image for ubuntu
FROM eaiesbhub/tomcat
MAINTAINER Sudheekar



# Expose the port no's to map
EXPOSE 8080 9090 8081

# Excute the file using CMD command
 ENTRYPOINT  ${TOMCAT_HOME}/bin/startup.sh && /bin/bash
#CMD ["${TOMCAT_HOME}/bin/catalina.sh", "run"]
