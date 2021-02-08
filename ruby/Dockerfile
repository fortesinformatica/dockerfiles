FROM ubuntu:18.04

WORKDIR /

ENV RUBY ruby-2.6.6
ENV RUBYGEMS_VERSION 3.2.8
ENV BUNDLER_VERSION 2.2.8
ENV TZ=America/Fortaleza

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get -qy install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libffi-dev \
  libcurl4-openssl-dev libpq-dev libsqlite3-dev libxml2-dev libxslt-dev pkg-config \
  libicu-dev tzdata lsb-release && \
  curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
  sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" >> /etc/apt/sources.list.d/pgdg.list' && \
  apt-get update && \
  apt-get -y upgrade && \
  curl -O https://cache.ruby-lang.org/pub/ruby/2.6/$RUBY.tar.gz && \
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
