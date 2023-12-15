# Use an official Maven image as the base image for building
FROM maven:3.8-openjdk-11 AS build
# Set the working directory inside the container
WORKDIR /app
# Copy the Maven project definition (pom.xml) into the container
COPY pom.xml .
# Download the project dependencies
RUN mvn dependency:go-offline
# Copy the application source code into the container
COPY src ./src
# Build the Spring Boot application JAR
RUN mvn package
# Use an official OpenJDK runtime image as the base image
FROM openjdk:11-jre-slim
# Set the working directory inside the container
WORKDIR /app
# Copy the Spring Boot JAR from the
