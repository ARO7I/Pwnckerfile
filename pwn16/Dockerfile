FROM ubuntu:16.04
MAINTAINER ARO7I <ARO7I@icloud.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install vim git curl -y

## Install shell
RUN apt-get install zsh -y
RUN useradd -m -s `which zsh` pwn
USER pwn
RUN curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
ADD zshrc /home/pwn/.zshrc
ADD vimrc /home/pwn/.vimrc
USER root

## Install gdb
RUN apt-get install gdb -y

## Install peda, Pwndbg
RUN git clone https://github.com/longld/peda.git /home/pwn/.peda
RUN git clone https://github.com/scwuaptx/Pwngdb.git /home/pwn/.Pwngdb
RUN curl https://gist.githubusercontent.com/ARO7I/6846e36e56258a44b25c64b1036549ac/raw/bcd734006fd4b80e467d112a11482a7bb858bb1e/.gdbinit -o /home/pwn/.gdbinit

## Install pwntools
RUN apt-get install python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential -y
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --upgrade pwntools

## Install ROPgadget
RUN python3 -m pip install --upgrade capstone
RUN git clone https://github.com/JonathanSalwan/ROPgadget.git /home/pwn/.ROPgadget
RUN echo 'alias ROPgadget="python3 $HOME/.ROPgadget/ROPgadget.py"' >> /home/pwn/.zshrc

## Install one_gadget
RUN apt-get install ruby -y
RUN gem install one_gadget

USER pwn