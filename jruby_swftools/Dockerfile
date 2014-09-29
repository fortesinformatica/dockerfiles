FROM fortes/jruby

WORKDIR /

RUN apt-get update && apt-get -qy install libfreetype6-dev libpng12-dev libgif-dev libjpeg62-dev && \
    apt-get install -y curl build-essential && \
    curl -O http://www.swftools.org/swftools-0.9.2.tar.gz && \
    tar xvzf swftools-0.9.2.tar.gz && \
    cd /swftools-0.9.2 && \
    sed -i -E "s/slave_(.+)\[128\]/slave_\1\[8192\]/g" src/swfcombine.c && \
    sed -i -E "s/-o -L ..pkgdatadir..swfs.default_......\.swf//g" swfs/Makefile.in && \
    ./configure && \
    make && \
    make install && \
    cd .. && \
    rm -rf swftools-0.9.2* && \
    apt-get -y remove --purge build-essential && \
    apt-get -y remove --purge curl && \
    apt-get -y autoremove && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
