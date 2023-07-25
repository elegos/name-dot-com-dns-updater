FROM alpine:3.17.2

RUN apk add --no-cache bind-tools curl jq py3-pip
RUN adduser -D appdaemon
RUN mkdir -p /appdaemon && \
    chown -R appdaemon:appdaemon /appdaemon && \
    pip install yacron

COPY --chown=appdaemon:appdaemon entrypoint.sh /entrypoint.sh
COPY --chown=appdaemon:appdaemon routine.sh /routine.sh
COPY --chown=appdaemon:appdaemon yacron.yml /appdaemon/yacron.yml

USER appdaemon
ENTRYPOINT [ "/entrypoint.sh" ]
