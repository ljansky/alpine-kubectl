FROM alpine:3.12

ENV KUBE_LATEST_VERSION="v1.19.2"

RUN apk add --no-cache ca-certificates bash git openssh-client openssh curl \
    && wget -q https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && chmod g+rwx /root \
    && mkdir /config \
    && chmod g+rwx /config


#ENV DOCKER_TLS_CERTDIR=/certs
#RUN mkdir /certs /certs/client && chmod 1777 /certs /certs/client

WORKDIR /config

CMD bash