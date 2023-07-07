FROM maven:3.9.3-eclipse-temurin-8 as build
USER root
RUN mkdir /workplace
ADD . /workplace
RUN mvn clean package
# run stage
FROM 8u372-b07-jre-jammy
USER root
RUN mkdir /app
ADD from build /workplace/*.jar /app
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/*.jar"]

