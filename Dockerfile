FROM Tomcat:9.0.52-jdk8
COPY target/maven-web-app*.war /usr/local/tomcat/webapps/maven-web-app.war
