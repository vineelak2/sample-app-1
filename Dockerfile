FROM devopsmptech/tomcat8:8.0.0
COPY target/*.war /usr/local/tomcat/webapps/sampleapp.war
