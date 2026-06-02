# Dockerfile

FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre-jammy
VOLUME /tmp
COPY --from=build /app/target/lec21.3-0.0.1-SNAPSHOT.jar taco.jar
EXPOSE 8085
ENTRYPOINT ["java", "-jar", "taco.jar"]
