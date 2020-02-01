################################################################################
# base system
################################################################################
ARG image=szc10/vscode
FROM $image as system

COPY sources.list /etc/apt/sources.list
COPY depot_tools /depot_tools

## tools env path
RUN echo "export PATH=/depot_tools:\$PATH:" >> /root/.bashrc

RUN apt-get update \
    && apt-get install -y --no-install-recommends g++ make gcc

    #  ./install-build-deps.sh –no-chromeos-fonts