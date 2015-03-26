FROM fortes/java

WORKDIR /

RUN apt-get update && apt-get install -y --no-install-recommends ant curl rsync && \
    apt-get -y autoremove && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -O https://archive.apache.org/dist/flex/4.13.0/binaries/apache-flex-sdk-4.13.0-bin.tar.gz && \
    tar zxvf apache-flex-sdk-4.13.0-bin.tar.gz && \
    rm -f apache-flex-sdk-4.13.0-bin.tar.gz

WORKDIR /apache-flex-sdk-4.13.0-bin/

RUN yes | ant -f installer.xml -Dair.sdk.version=2.6
RUN mv frameworks/libs/osmf.swc frameworks/libs/OSMF.swc

ENV FLEX_HOME /apache-flex-sdk-4.13.0-bin
