FROM ubuntu:16.04

WORKDIR /

ENV RUBY ruby-2.5.8
ENV RUBYGEMS_VERSION 3.2.4
ENV BUNDLER_VERSION 2.2.4

RUN apt-get update && \
  apt-get -y upgrade && \
  apt-get -qy install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libffi-dev \
  libcurl4-openssl-dev python-software-properties libpq-dev libsqlite3-dev libxml2-dev libxslt-dev pkg-config \
  libicu-dev tzdata && \
  curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
  sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -sc)-pgdg main" > /etc/apt/sources.list.d/PostgreSQL.list' && \
  apt-get update && \
  apt-get -y upgrade && \
  curl -O http://cache.ruby-lang.org/pub/ruby/2.5/$RUBY.tar.gz && \
  tar -xzvf $RUBY.tar.gz && \
  cd $RUBY && \
  ./configure --disable-install-doc && \
  make && \
  make install && \
  cd .. && \
  rm -rf $RUBY* && \
  echo 'gem: --no-document' >> ~/.gemrc && \
  gem update --system $RUBYGEMS_VERSION && \
  gem install -f bundler -v $BUNDLER_VERSION && \
  apt-get -y remove --purge curl && \
  apt-get -y autoremove && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LANG C.UTF-8

CMD ["bash"]
