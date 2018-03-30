FROM alpine:3.7

ARG RANCHER_CLI_VERSION=v0.6.8
COPY src /
RUN rancher-cli-setup

ENTRYPOINT ["rancher-cli-entrypoint"]
CMD ["/bin/sh"]
