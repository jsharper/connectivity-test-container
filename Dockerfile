FROM alpine
MAINTAINER Jason Harper <jsharper@asu.edu>

RUN apk add --no-cache bash nmap-ncat bind-tools

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
