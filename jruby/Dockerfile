FROM fortes/java

ENV JRUBY_VERSION 1.7.16.2

RUN apt-get update && apt-get install -y --no-install-recommends curl && \
    curl http://jruby.org.s3.amazonaws.com/downloads/$JRUBY_VERSION/jruby-bin-$JRUBY_VERSION.tar.gz | tar xz -C /opt

ENV PATH /opt/jruby-$JRUBY_VERSION/bin:$PATH

RUN echo gem: --no-document >> /etc/gemrc

RUN curl -O https://rubygems.org/gems/rubygems-update-2.6.14.gem && \
    gem install --local rubygems-update-2.6.14.gem && \
    update_rubygems && \
    rm rubygems-update-2.6.14.gem && \
    gem uninstall rubygems-update -x

RUN gem install bundler -v 1.15.4

RUN apt-get -y remove --purge curl && \
    apt-get -y autoremove && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
