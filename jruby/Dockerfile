FROM fortes/java:8_2020-01

ENV JRUBY_VERSION 9.2.5.0
ENV RUBYGEMS_VERSION 3.0.2
ENV BUNDLER_VERSION 2.0.1
ENV PATH /opt/jruby-$JRUBY_VERSION/bin:$PATH

RUN apt-get update && apt-get install -y --no-install-recommends curl && \
    apt-get install -qy git-core && \
    curl http://jruby.org.s3.amazonaws.com/downloads/$JRUBY_VERSION/jruby-bin-$JRUBY_VERSION.tar.gz | tar xz -C /opt && \
    echo 'gem: --no-document' >> ~/.gemrc && \
    echo 'gem: --no-document' >> /etc/gemrc && \
    gem update --system $RUBYGEMS_VERSION && \
    gem install bundler -v $BUNDLER_VERSION && \
    apt-get -y remove --purge curl && \
    apt-get -y autoremove && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LANG C.UTF-8
