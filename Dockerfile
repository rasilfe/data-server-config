FROM alpine:latest
RUN apk update
RUN apk add --update openjdk17
COPY /target/*.jar /CC/data-server-config.jar

RUN addgroup -g 1001 spring && adduser -u 1001 -G spring -D spring

RUN chown -R spring:spring /CC
RUN chown -R 777 /CC

ENV TZ="America/Sao_Paulo"
ENTRYPOINT ["java","-jar","-Dspring.cloud.config.server.git.uri=${GIT}","-Dserver.port=${PORT}","/CC/data-server-config.jar"]

EXPOSE ${PORT}