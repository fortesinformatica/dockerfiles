FROM ubuntu:14.04
MAINTAINER Marlus Saraiva <marlus.saraiva@gmail.com>

RUN apt-get update && \
    apt-get -qy install python-pip groff-base ruby2.0 gdebi curl docker.io && \
    pip install awscli && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /opt/codedeploy-agent

WORKDIR /opt/codedeploy-agent

RUN curl -O https://s3-us-west-2.amazonaws.com/aws-codedeploy-us-west-2/latest/install

RUN chmod +x install
RUN ./install auto

ADD run.sh /opt/codedeploy-agent/run.sh
RUN chmod +x run.sh

CMD ["/opt/codedeploy-agent/run.sh", "start-no-update"]
