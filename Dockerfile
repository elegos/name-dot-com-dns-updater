FROM alpine:3.17.2

RUN apk add --no-cache bind-tools curl jq
RUN adduser -D appdaemon
RUN echo "*/15 * * * * /runtime.sh" >> /var/spool/cron/crontabs/appdaemon

COPY --chown=appdaemon:appdaemon entrypoint.sh /entrypoint.sh
COPY --chown=appdaemon:appdaemon routine.sh /routine.sh

USER appdaemon
ENTRYPOINT [ "/entrypoint.sh" ]
