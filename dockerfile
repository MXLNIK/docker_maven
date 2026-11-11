FROM maven:3.9-eclipse-temurin-21 AS builder

WORKDIR /app
COPY pom.xml .
COPY src ./src

RUN mvn -B package

FROM eclipse-temurin:21-jre

WORKDIR /app
COPY --from=builder /app/target/docker-maven-1.0.jar app.jar

EXPOSE 10000

CMD ["sh", "-c", "java -jar app.jar"]