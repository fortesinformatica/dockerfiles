FROM ubuntu:16.04

WORKDIR /

ENV RUBY ruby-2.4.4
ENV RUBYGEMS_VERSION 2.7.7

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -qy install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libffi-dev \
    libcurl4-openssl-dev python-software-properties libpq-dev libsqlite3-dev libxml2-dev libxslt-dev pkg-config \
    libicu-dev tzdata && \
    curl -O http://cache.ruby-lang.org/pub/ruby/2.4/$RUBY.tar.gz && \
    tar -xzvf $RUBY.tar.gz && \
    cd $RUBY && \
    ./configure --disable-install-doc && \
    make && \
    make install && \
    cd .. && \
    rm -rf $RUBY* && \
    echo 'gem: --no-document' >> ~/.gemrc && \
    curl -O https://rubygems.org/gems/rubygems-update-$RUBYGEMS_VERSION.gem && \
    gem install --local rubygems-update-$RUBYGEMS_VERSION.gem && \
    update_rubygems && \
    rm rubygems-update-$RUBYGEMS_VERSION.gem && \
    gem uninstall rubygems-update -x && \
    apt-get -y remove --purge curl && \
    apt-get -y autoremove && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LANG C.UTF-8

CMD ["bash"]
