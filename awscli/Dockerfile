FROM ubuntu

WORKDIR /

RUN apt-get update && \
    apt-get -qy install python-pip groff-base && \
    pip install awscli && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["bash"]
