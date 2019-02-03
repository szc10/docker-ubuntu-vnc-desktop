################################################################################
# base system
################################################################################
ARG image=ubuntu:18.04
FROM $image as system

COPY sources.list /etc/apt/sources.list

RUN apt-get update \
    && apt-get install -y --no-install-recommends vim git inetutils-ping lsof wget