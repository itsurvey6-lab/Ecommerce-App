FROM maven:4.0.0 As Builder
WORKDIR /App
COPY . .
RUN mvn clean package

FROM tomcat:9.0 As prodution
COPY --from=Builder /App/target/EcommerceApp.war /usr/local/tomcat/webapps/
EXPOSE 8080





