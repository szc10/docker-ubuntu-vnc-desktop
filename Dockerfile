################################################################################
# base system
################################################################################
ARG image=ubuntu:18.04
FROM $image as system

COPY sources.list /etc/apt/sources.list

RUN apt-get update \
    && apt-get install -y --no-install-recommends vim git inetutils-ping lsof wget apt-transport-https software-properties-common
# vscode
RUN apt-get install -y gnupg \
    && curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg \
    && install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/ \
    && sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' \
    && apt-get update \
    && apt-get install -y code # code-insiders

# sublime-text
RUN wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add - \
    && echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list \
    && apt-get update \
    && apt-get install sublime-text

# typora
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
RUN wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add - \
    # add Typora's repository
    && add-apt-repository 'deb https://typora.io/linux ./' \
    && apt-get update \
    # install typora
    && apt-get install typora
