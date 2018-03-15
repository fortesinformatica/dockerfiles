FROM fortes/java:8

ENV JRUBY_VERSION 9.1.16.0
ENV PATH /opt/jruby-$JRUBY_VERSION/bin:$PATH

RUN apt-get update && apt-get install -y --no-install-recommends curl && \
    curl http://jruby.org.s3.amazonaws.com/downloads/$JRUBY_VERSION/jruby-bin-$JRUBY_VERSION.tar.gz | tar xz -C /opt && \
    echo gem: --no-document >> /etc/gemrc  && \
    curl -O https://rubygems.org/gems/rubygems-update-2.7.6.gem && \
    gem install --local rubygems-update-2.7.6.gem && \
    update_rubygems && \
    rm rubygems-update-2.7.6.gem && \
    gem uninstall rubygems-update -x && \
    gem install bundler -v 1.16.1 && \
    apt-get -y remove --purge curl && \
    apt-get -y autoremove && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LANG C.UTF-8
