FROM amazoncorretto:11-alpine-jdk
MAINTAINER MomirMilutinovic
COPY target/docker-film-server-0.1.jar film-server-0.1.jar
ENTRYPOINT java -jar /film-server-0.1.jar "--spring.datasource.url=$SPRING_DATASOURCE_URL" "--spring.datasource.username=$SPRING_DATASOURCE_USERNAME" "spring.datasource.password=$SPRING_DATASOURCE_PASSWORD" "--table.name=$TABLE_NAME"
