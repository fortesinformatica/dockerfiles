FROM ubuntu:14.04

WORKDIR /

ENV RUBY ruby-2.2.1

RUN apt-get update && \
    apt-get -qy install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libffi-dev \
    libcurl4-openssl-dev python-software-properties libpq-dev libsqlite3-dev libxml2-dev libxslt1-dev && \
    curl -O http://cache.ruby-lang.org/pub/ruby/2.2/$RUBY.tar.gz && \
    tar -xzvf $RUBY.tar.gz && \
    cd $RUBY && \
    ./configure --disable-install-doc && \
    make && \
    make install && \
    cd .. && \
    rm -rf $RUBY* && \
    gem update --system && \
    gem install bundler && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN locale-gen pt_BR.UTF-8
ENV LANG pt_BR.UTF-8

CMD ["bash"]
