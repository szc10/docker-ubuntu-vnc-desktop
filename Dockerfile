
################################################################################
# base system
################################################################################
ARG image=ubuntu:18.04
FROM $image as system

RUN apt-get update && echo 'export XMAKE_ROOT=y '>>/etc/profile

RUN  wget https://raw.githubusercontent.com/xmake-io/xmake/master/scripts/get.sh && bash get.sh
