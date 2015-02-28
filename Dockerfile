FROM ubuntu:14.04
MAINTAINER Javier Aranda <javier@aranda.io>

ENV DEBIAN_FRONTEND noninteractive
ENV GIT_SSL_NO_VERIFY true
ENV SHELL /bin/bash

# packages
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
    git vim wget ca-certificates realpath && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# dotvim
RUN cd /root && git clone https://github.com/arandaio/dotvim.git .vim && \
    cd .vim && git submodule init && git submodule update

# dotfiles
RUN cd /root && git clone https://github.com/arandaio/dotfiles.git .dotfiles && \
    cd .dotfiles && ./install.sh -f

# default command
CMD /bin/bash -l