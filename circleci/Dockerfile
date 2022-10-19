FROM ubuntu:18.04

WORKDIR /

ENV RUBY_VERSION 2.7.5
ENV JRUBY_VERSION 9.3.3.0
ENV RUBYGEMS_VERSION 3.2.28
ENV BUNDLER_VERSION 2.2.28
ENV NODE_VERSION 16.18.0
ENV YARN_VERSION 1.22.19
ENV NODEJS_HOME /usr/local/lib/nodejs/node-v$NODE_VERSION/bin
ENV PATH $NODEJS_HOME:$PATH
ENV TZ=America/Fortaleza

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
  apt-get update && \
  apt-get -qy upgrade && \
  apt-get -qy install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libffi-dev \
  libcurl4-openssl-dev python-pip libpq-dev libsqlite3-dev libxml2-dev libxslt-dev pkg-config \
  libicu-dev tzdata groff-base jq lsb-release rsync && \
  pip install awscli --upgrade && \
  apt-get install -y openjdk-8-jre && \
  curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
  sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" >> /etc/apt/sources.list.d/pgdg.list' && \
  curl -fsSL https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list' && \
  apt-get update && \
  apt-get install -y --no-install-recommends postgresql-client-10 && \
  apt-get install -y google-chrome-stable && \
  curl -L https://github.com/postmodern/ruby-install/archive/v0.8.1.tar.gz | tar -xzv -C . && \
  cd ruby-install-0.8.1/ && make install && cd .. && rm -rf ruby-install-0.8.1 && \
  curl -L https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz | tar -xzv -C . && \
  cd chruby-0.3.9/ && ./scripts/setup.sh && cd .. && rm -rf chruby-0.3.9 && \
  echo "source /usr/local/share/chruby/chruby.sh" >> /root/.bashrc && \
  /bin/bash -c 'source /etc/profile.d/chruby.sh && chruby --version' && \
  echo 'gem: --no-document' >> ~/.gemrc && \
  echo 'gem: --no-document' >> /etc/gemrc && \
  ruby-install --jobs=$(nproc) -c ruby $RUBY_VERSION --no-install-deps -- --disable-install-doc && \
  /bin/bash -c 'source /etc/profile.d/chruby.sh && chruby ruby && gem update --system ${RUBYGEMS_VERSION} && gem install bundler:$BUNDLER_VERSION --force' && \
  ruby-install --jobs=$(nproc) -c jruby $JRUBY_VERSION --no-install-deps -- --disable-install-doc && \
  /bin/bash -c 'source /etc/profile.d/chruby.sh && chruby jruby && gem update --system ${RUBYGEMS_VERSION} && gem install bundler:$BUNDLER_VERSION' && \
  mkdir /usr/local/lib/nodejs && \
  curl https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz | tar -xJv -C /usr/local/lib/nodejs/ && \
  mv /usr/local/lib/nodejs/node-v$NODE_VERSION-linux-x64 /usr/local/lib/nodejs/node-v$NODE_VERSION && \
  npm install --location=global npm@latest && \
  npm install yarn@$YARN_VERSION --location=global && \
  npm install check-engines --location=global && \
  apt-get -y autoremove && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LANG C.UTF-8

CMD ["bash"]
