# Use the official Maven image as the build stage
FROM maven:3.8.3-openjdk-17 as build

ENV SERVICE_NAME=transactions

# Set the working directory
WORKDIR /app

# Copy the parent pom.xml file to the working directory
COPY ${SERVICE_NAME}-service/pom.xml .

# Copy the submodule directories (pom.xml and src)
COPY ${SERVICE_NAME}-service/${SERVICE_NAME}-service/pom.xml ${SERVICE_NAME}-service/
COPY ${SERVICE_NAME}-service/${SERVICE_NAME}-service/src ${SERVICE_NAME}-service/src/
COPY ${SERVICE_NAME}-service/${SERVICE_NAME}-api/pom.xml ${SERVICE_NAME}-api/

# Copy the config file
COPY config/${SERVICE_NAME}-service/application-docker.yml ${SERVICE_NAME}-service/src/main/resources/

# Download project dependencies
RUN mvn dependency:go-offline

# Package the application (including submodules)
RUN mvn clean package

# Use the official OpenJDK 17 image as the base image
FROM openjdk:17-slim

ENV SERVICE_NAME=transactions

# Set the working directory
WORKDIR /app

# Copy the JAR file from the build output to the container
COPY --from=build /app/${SERVICE_NAME}-service/target/*.jar app.jar

# Expose the port that the Spring Boot app will run on
EXPOSE 8080

# Start the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]