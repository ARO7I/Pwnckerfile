FROM ubuntu:16.04
MAINTAINER ARO7I <ARO7I@icloud.com>

ENV TZ Asia/Seoul
ENV LC_ALL=C.UTF-8
ENV PYTHONIOENCODING UTF-8
RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone

RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install curl git wget file zsh sudo vim libssl-dev libffi-dev build-essential netcat-traditional binutils-multiarch -y
RUN apt-get install gdb python3 python3-pip python3-dev ruby -y
RUN apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 -y
RUN gem install one_gadget

RUN useradd -ms /bin/zsh pwn16
WORKDIR /home/pwn16

RUN apt-get install openssh-server -y
RUN sed -ri "s/Port 22/Port 4416/g" /etc/ssh/sshd_config

USER pwn16
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN git clone https://github.com/djui/alias-tips.git /home/pwn16/.oh-my-zsh/custom/plugins/alias-tips

USER root
COPY zshrc /home/pwn16/.zshrc
RUN chmod 666 /home/pwn16/.zshrc
COPY vimrc /home/pwn16/.vimrc
RUN chmod 666 /home/pwn16/.vimrc

USER pwn16
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --upgrade pwntools
RUN git clone https://github.com/longld/peda.git /home/pwn16/.peda
RUN sed -ri 's/n", "a/ff", "a/g' /home/pwn16/.peda/lib/config.py
RUN git clone https://github.com/scwuaptx/pwngdb.git /home/pwn16/.pwngdb
RUN curl https://gist.githubusercontent.com/ARO7I/6846e36e56258a44b25c64b1036549ac/raw/bcd734006fd4b80e467d112a11482a7bb858bb1e/.gdbinit -o /home/pwn16/.gdbinit

RUN python3 -m pip install --upgrade capstone
RUN git clone https://github.com/JonathanSalwan/ROPgadget.git /home/pwn16/.ROPgadget
RUN curl -fLo /home/pwn16/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

USER root
RUN echo "1234\n1234\n" | passwd root
RUN echo "1234\n1234\n" | passwd pwn16
COPY README /home/pwn16/README
RUN chmod 666 /home/pwn16/README
COPY start.sh /start.sh
RUN chmod 750 /start.sh
