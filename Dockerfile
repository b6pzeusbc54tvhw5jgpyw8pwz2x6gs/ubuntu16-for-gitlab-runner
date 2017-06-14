FROM ubuntu:16.04
MAINTAINER Alfred UC b6pzeusbc54tvhw5jgpyw8pwz2x6gs@gmail.com

# Install vim-nox, python, zip
RUN apt-get update
RUN apt-get install software-properties-common apache2-utils git heirloom-mailx -y
RUN apt-get install hunspell hunspell-ko -y

RUN add-apt-repository ppa:jonathonf/vim -y
RUN apt-get update
RUN apt-get install wget curl vim-nox zip jq -yq
 
RUN curl -sL https://bootstrap.pypa.io/get-pip.py | python3 -
RUN pip install docker-compose
RUN pip install awscli
RUN pip install docker

# install node
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -

# Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn -y

# Hangul Install
RUN apt-get update && apt-get install -y \
    language-pack-ko && \
    dpkg-reconfigure locales && \
    locale-gen en_US.UTF-8 && \
    /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8


# cleaning
RUN apt-get clean && rm -r /var/lib/apt/lists/*
