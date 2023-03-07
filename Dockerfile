FROM alpine:3.17.2

RUN apk add --no-cache bind-tools curl jq
RUN adduser -D appdaemon
RUN mkdir -p /appdaemon && \
    echo "*/15 * * * * /runtime.sh" >> /appdaemon/cron && \
    chown -R appdaemon:appdaemon /appdaemon

COPY --chown=appdaemon:appdaemon entrypoint.sh /entrypoint.sh
COPY --chown=appdaemon:appdaemon routine.sh /routine.sh

USER appdaemon
ENTRYPOINT [ "/entrypoint.sh" ]
