FROM aro7i/pwn20:latest
MAINTAINER ARO7I <ARO7I@icloud.com>

RUN apt-get update
RUN apt-get install python2 -y

USER pwn20
RUN git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git /home/pwn20/.depot_tools

USER root
RUN ln -sf /usr/bin/python2 /usr/bin/python
COPY zshrc /home/pwn20/.zshrc
RUN chmod 666 /home/pwn20/.zshrc
COPY install.sh /home/pwn20/install.sh
RUN chmod +x /home/pwn20/install.sh
COPY buildRelease.sh /home/pwn20/buildRelease.sh
RUN chmod +x /home/pwn20/buildRelease.sh
COPY buildDebug.sh /home/pwn20/buildDebug.sh
RUN chmod +x /home/pwn20/buildDebug.sh
