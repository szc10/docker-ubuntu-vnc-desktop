################################################################################
# base system
################################################################################
ARG image=ubuntu:18.04
FROM $image as system

RUN rm /root/microsoft.gpg \
   && curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - \
   && apt-get install nodejs