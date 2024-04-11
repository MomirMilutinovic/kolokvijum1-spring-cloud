FROM amazoncorretto:11-alpine-jdk
MAINTAINER MomirMilutinovic
COPY target/docker-film-server-0.1.jar film-server-0.1.jar
ENTRYPOINT ["java","-jar","/film-server-0.1.jar"]
