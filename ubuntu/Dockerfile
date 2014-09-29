FROM ubuntu:14.04

RUN apt-get update && \
    apt-get install -y vim htop && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN echo export CLICOLOR=1 >> /etc/bash.bashrc
RUN echo export LSCOLORS=gxFxCxDxCxegedabagacad >> /etc/bash.bashrc
RUN echo "alias ll='ls -alF'" >> /etc/bash.bashrc
RUN echo "alias ll='ls -CF'" >> /etc/bash.bashrc

ADD .vimrc /

CMD ["bash"]
