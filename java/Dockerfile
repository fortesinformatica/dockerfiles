FROM ubuntu:14.04

WORKDIR /

RUN apt-get update && \
    apt-get install -y openjdk-7-jre && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["bash"]
