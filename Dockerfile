FROM amazoncorretto:17-alpine3.17
LABEL author="ysp"
RUN mkdir spc
WORKDIR /spc
COPY ./target/spring-petclinic-3.1.0-SNAPSHOT.jar /spc/spring-petclinic-3.1.0-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT [ "java" ]
CMD [ "-jar","spring-petclinic-3.1.0-SNAPSHOT.jar" ]