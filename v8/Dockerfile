FROM aro7i/pwn16:1.0.0
MAINTAINER ARO7I <ARO7I@icloud.com>

USER pwn16
RUN git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git /home/pwn16/.depot_tools

USER root
RUN apt-get update
RUN apt-get install python2.7 lsb-release -y
RUN ln -sf /usr/bin/python2.7 /usr/bin/python
COPY zshrc /home/pwn16/.zshrc
RUN chmod 666 /home/pwn16/.zshrc
