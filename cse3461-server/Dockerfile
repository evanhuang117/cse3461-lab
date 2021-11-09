FROM python:3.10 AS dev
SHELL ["/bin/bash", "-c", "-l"]
ENV DEBIAN_FRONTEND noninteractive
ENV NODE_VERSION=12.13.0
RUN  apt-get update && apt-get install -y \
    git vim zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev curl wget tmux
RUN source /root/.bashrc 
ADD dot-files/.vimrc /root 
ADD dot-files/.tmux.conf /root
ADD dot-files/.bashrc /root 
ADD dot-files/.bash_profile /root
ADD dot-files/.bash_aliases /root
RUN mkdir code
WORKDIR /code
CMD /bin/bash

FROM python:3.10 AS prod
RUN . /root/.bashrc \
    && apt-get update 
COPY . /code
CMD . /root/.bashrc \
    && cd /code \
    && python3 server.py
