FROM maven:3.9.3-eclipse-temurin-8 as build
WORKDIR /workplace
COPY . .
RUN mvn clean package
# run stage
FROM tomcat:jre17-temurin-jammy
EXPOSE 8080
COPY from build /workplace/target/maven-web-application*.jar /user/local/tomcat/webapps/maven-web-application
