FROM amazoncorretto:17-alpine3.17
LABEL author="ysp"
ARG USERNAME='petclinic'
ARG HOMEDIR='/petclinic'
RUN adduser -h ${HOMEDIR} -s /bin/sh -D ${USERNAME}
USER ${USERNAME}
WORKDIR ${HOMEDIR}
COPY --chown=${USERNAME}:${USERNAME} /spring-docker/target/spring-petclinic-3.1.0-SNAPSHOT.jar "${HOMEDIR}/spring-petclinic-3.1.0-SNAPSHOT.jar"
EXPOSE 8080
CMD ["java", "-jar", "spring-petclinic-3.1.0-SNAPSHOT.jar"]