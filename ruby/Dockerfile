FROM ubuntu:14.04

WORKDIR /

ENV RUBY ruby-2.4.3

RUN apt-get update && \
    apt-get -qy install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libffi-dev \
    libcurl4-openssl-dev python-software-properties libpq-dev libsqlite3-dev libxml2-dev libxslt1-dev libicu-dev && \
    curl -O http://cache.ruby-lang.org/pub/ruby/2.4/$RUBY.tar.gz && \
    tar -xzvf $RUBY.tar.gz && \
    cd $RUBY && \
    ./configure --disable-install-doc && \
    make && \
    make install && \
    cd .. && \
    rm -rf $RUBY* && \
    echo 'gem: --no-document' >> ~/.gemrc && \
    curl -O https://rubygems.org/gems/rubygems-update-2.7.3.gem && \
    gem install --local rubygems-update-2.7.3.gem && \
    update_rubygems && \
    rm rubygems-update-2.7.3.gem && \
    gem uninstall rubygems-update -x && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN locale-gen pt_BR.UTF-8
ENV LANG pt_BR.UTF-8

CMD ["bash"]
