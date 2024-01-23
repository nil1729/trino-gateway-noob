FROM ubuntu:22.04

# update and install packages
RUN apt-get clean && apt-get update
RUN apt-get install -y sudo curl wget bc python3 apt-transport-https gnupg ca-certificates less postgresql-client

# install java
RUN curl -s https://repos.azul.com/azul-repo.key | sudo gpg --dearmor -o /usr/share/keyrings/azul.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/azul.gpg] https://repos.azul.com/zulu/deb stable main" | sudo tee /etc/apt/sources.list.d/zulu.list
RUN sudo apt update -y && sudo apt install -y zulu17-jdk

# set environment variables
ENV JAVA_HOME=/usr/lib/jvm/zulu17-ca-amd64
ENV VERSION=4
ENV POSTGRES_DB=NONE
ENV POSTGRES_USER=NONE
ENV POSTGRES_PASSWORD=NONE
ENV POSTGRES_HOST=NONE

# install trino-gateway
RUN wget -qO /root/gateway-ha.jar https://repo1.maven.org/maven2/io/trino/gateway/gateway-ha/${VERSION}/gateway-ha-${VERSION}-jar-with-dependencies.jar
RUN chmod +x /root/gateway-ha.jar
RUN mv /root/gateway-ha.jar /usr/bin/gateway-ha.jar

# install db-init script
RUN wget -qO /root/gateway-ha-persistence-postgres.sql https://raw.githubusercontent.com/trinodb/trino-gateway/main/gateway-ha/src/main/resources/gateway-ha-persistence-postgres.sql 

# entrypoint script
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

WORKDIR /root
