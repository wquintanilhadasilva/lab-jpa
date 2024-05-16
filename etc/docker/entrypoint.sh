#!/bin/sh
echo "Iniciando o serviço..."
exec java ${JAVA_OPTS} --enable-preview -Djava.security.egd=file:/dev/./urandom -jar ${APP_NAME}.jar "$@"
