FROM maven:3.8.7-eclipse-temurin-17 As builder

WORKDIR /App

COPY pom.xml .
RUN mvn dependency:go-offline -B

COPY src ./src
COPY mydatabase.db ./mydatabase.db

RUN mvn clean package -DskipTests

FROM tomcat:9.0 As prodution
COPY --from=Builder /App/target/EcommerceApp.war /usr/local/tomcat/webapps/
EXPOSE 8080





