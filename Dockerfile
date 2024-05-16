FROM openjdk:21-slim-buster as application
ENV TZ="America/Sao_Paulo"
ENV APP_NAME="lab-jpa"
ENTRYPOINT ["./entrypoint.sh"]
RUN pwd
WORKDIR /app

# Run as non-root
RUN useradd -ms /bin/bash oobj &&\
    mkdir -p /var/lib /app/logs &&\
    chown oobj:root /var/lib /app/logs &&\
    chmod 775 /var/lib
USER oobj

COPY --chown=oobj --chmod=0755 ./etc/docker/entrypoint.sh ./entrypoint.sh
COPY --chown=oobj --chmod=0777 ./target/${APP_NAME}.jar ./${APP_NAME}.jar
