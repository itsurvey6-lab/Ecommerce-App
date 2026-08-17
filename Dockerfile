FROM maven:3.8.7-eclipse-temurin-17 AS builder
WORKDIR /App
COPY . .
RUN mvn clean package

FROM tomcat:9.0 AS prodution
COPY --from=Builder /App/target/EcommerceApp.war /usr/local/tomcat/webapps/
EXPOSE 8080





