FROM fortes/ubuntu

WORKDIR /

RUN apt-get update && \
    apt-get -qy install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev \
    libcurl4-openssl-dev python-software-properties libpq-dev libsqlite3-dev libxml2-dev libxslt1-dev && \
    curl -O http://ftp.ruby-lang.org/pub/ruby/ruby-2.0.0-p481.tar.gz && \
    tar -xzvf ruby-2.0.0-p481.tar.gz && \
    cd ruby-2.0.0-p481 && \
    ./configure --disable-install-doc && \
    make && \
    make install && \
    cd .. && \
    rm -rf ruby-2.0.0-p481* && \
    gem update --system && \
    gem install bundler && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["bash"]
