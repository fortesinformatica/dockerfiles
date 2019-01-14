FROM ubuntu:16.04

WORKDIR /

ENV RUBY_VERSION 2.4.4
ENV JRUBY_VERSION 9.1.17.0
ENV RUBYGEMS_VERSION 2.7.7
ENV BUNDLER_VERSION 1.16.2
ENV NODE_VERSION 8.11.3
ENV YARN_VERSION 1.7.0
ENV NODEJS_HOME /usr/local/lib/nodejs/node-v$NODE_VERSION/bin    
ENV PATH $NODEJS_HOME:$PATH

RUN apt-get update && \
    apt-get -qy upgrade && \
    apt-get -qy install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libffi-dev \
    libcurl4-openssl-dev python-software-properties python-pip libpq-dev libsqlite3-dev libxml2-dev libxslt-dev pkg-config \
    libicu-dev tzdata groff-base jq && \
    pip install awscli --upgrade && \
    apt-get install -y openjdk-8-jre && \
    curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -sc)-pgdg main" > /etc/apt/sources.list.d/PostgreSQL.list' && \
    curl -fsSL https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list' && \
    apt-get update && \
    apt-get install -y --no-install-recommends postgresql-client-10 && \
    apt-get install -y google-chrome-stable && \
    curl -L https://github.com/postmodern/ruby-install/archive/v0.7.0.tar.gz | tar -xzv -C . && \
    cd ruby-install-0.7.0/ && make install && cd .. && rm -rf ruby-install-0.7.0 && \
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
    npm install yarn@$YARN_VERSION -g && \
    npm install check-engines -g && \
    apt-get -y autoremove && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LANG C.UTF-8

CMD ["bash"]
