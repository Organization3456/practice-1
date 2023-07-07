FROM maven:3.9.3-eclipse-temurin-8 as build
USER root
RUN mkdir /workplace
ADD . /workplace
RUN mvn clean package
# run stage
FROM tomcat
EXPOSE 8080
COPY from build /workplace/target/maven-web-application*.jar /user/local/tomcat/webapps/maven-web-application
