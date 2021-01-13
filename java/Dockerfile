FROM ubuntu:18.04

WORKDIR /

RUN apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y openjdk-8-jre && \
  apt-get -y autoremove && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["bash"]
