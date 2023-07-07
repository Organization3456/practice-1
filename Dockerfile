FROM docker.io/library/maven:3.9.3-eclipse-temurin-8 as build
RUN mkdir /workplace
WORKDIR /workplace
ADD . .
RUN mvn clean package
# run stage
FROM docker.io/library/tomcat:jre17-temurin-jammy
EXPOSE 8080
COPY from build /workplace/target/maven-web-application*.jar /user/local/tomcat/webapps/maven-web-application
