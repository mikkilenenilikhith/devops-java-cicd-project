FROM tomcat:10.1-jdk17-temurin

RUN rm -rf /usr/local/tomcat/webapps/*

COPY target/devops-java-app.war /usr/local/tomcat/webapps/devops-java-app.war

EXPOSE 8080

CMD ["catalina.sh", "run"]