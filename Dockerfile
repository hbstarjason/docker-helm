FROM alpine

MAINTAINER cnych <icnych@gmail.com>

ARG HELM_VERSION="v2.10.0"

RUN apk add --update ca-certificates \
 && apk add --update -t deps wget git openssl bash \
 && wget https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz \
 && tar -xvf helm-${HELM_VERSION}-linux-amd64.tar.gz \
 && mv linux-amd64/helm /usr/local/bin \
 && curl -L https://github.com/docker/compose/releases/download/1.24.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose  \
 && chmod +x /usr/local/bin/docker-compose \
 && apk del --purge deps \
 && rm /var/cache/apk/* \
 && rm -f /helm-${HELM_VERSION}-linux-amd64.tar.gz

ENTRYPOINT ["helm"]
CMD ["help"]
