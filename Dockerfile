FROM ubuntu:18.04
LABEL maintainer="Shinji Kawaguchi <shinji.kawaguchi@clouto.io>" \
      version="0.1" \
      description="nginx and ruby"

RUN apt-get update
RUN apt-get install -y git nginx wget curl libxrender-dev gcc make libssl-dev zlib1g-dev libreadline-dev

# Install Ruby
RUN git clone https://github.com/rbenv/rbenv /usr/local/rbenv
RUN mkdir /usr/local/rbenv/plugins
RUN git clone https://github.com/rbenv/ruby-build /usr/local/rbenv/plugins/ruby-build

ENV RBENV_ROOT /usr/local/rbenv
ENV PATH ${RBENV_ROOT}/bin:${PATH}
RUN eval "$(rbenv init --no-rehash -)"

RUN rbenv install 2.6.1
RUN rbenv global 2.6.1
RUN rbenv rehash

RUN rbenv exec gem install bundler
