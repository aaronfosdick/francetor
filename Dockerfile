FROM alpine:edge

MAINTAINER Aaron F<aaron@hypervision.com>

ARG BUILD_DATE
ARG VCS_REF
#ARG VERSION

LABEL maintainer="Hypervision" \
    com.microscaling.license="MIT" \
    org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.name="Tor network client" \
    org.label-schema.url="https://www.torproject.org" \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.docker.cmd="docker run -d --rm -p 9050:9050 -p 9040:9040 --name francetor francetor" \
    org.label-schema.schema-version="1.0"

# --env-file ./env.list

RUN apk add tor

ADD ./torrc /etc/tor/torrc

EXPOSE 9040
EXPOSE 9050

VOLUME ["/var/lib/tor"]

USER tor

CMD ["/usr/bin/tor"]
