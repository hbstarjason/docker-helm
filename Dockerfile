FROM alpine

MAINTAINER cnych <icnych@gmail.com>

ARG HELM_VERSION="v2.10.0"

RUN apk add --update ca-certificates \
 && apk add --update -t deps wget git openssl bash curl py-pip python-dev libffi-dev openssl-dev gcc libc-dev make \
 && wget https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz \
 && tar -xvf helm-${HELM_VERSION}-linux-amd64.tar.gz \
 && mv linux-amd64/helm /usr/local/bin \
 && pip install "docker-compose" \
 && apk del --purge deps \
 && rm /var/cache/apk/* \
 && rm -f /helm-${HELM_VERSION}-linux-amd64.tar.gz

ENTRYPOINT ["helm"]
CMD ["help"]
