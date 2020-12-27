FROM ubuntu:18.04
MAINTAINER ARO7I <ARO7I@icloud.com>

ENV TZ Asia/Seoul
ENV LC_ALL=C.UTF-8
ENV PYTHONIOENCODING UTF-8
RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone
RUN sed -i "s/archive.ubuntu.com/mirror.kakao.com/g" /etc/apt/sources.list

RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install curl git wget file zsh sudo vim libssl-dev libffi-dev build-essential netcat-traditional -y
RUN apt-get install gdb python3 python3-pip python3-dev ruby binutils-multiarch -y
RUN apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 -y
RUN gem install one_gadget

RUN useradd -ms /bin/zsh pwn18
WORKDIR /home/pwn18

RUN apt-get install openssh-server -y
RUN sed -ri "s/#Port 22/Port 4418/g" /etc/ssh/sshd_config

USER pwn18
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN git clone https://github.com/djui/alias-tips.git /home/pwn18/.oh-my-zsh/custom/plugins/alias-tips

USER root
COPY zshrc /home/pwn18/.zshrc
RUN chmod 666 /home/pwn18/.zshrc
COPY vimrc /home/pwn18/.vimrc
RUN chmod 666 /home/pwn18/.vimrc

USER pwn18
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --upgrade pwntools
RUN git clone https://github.com/longld/peda.git /home/pwn18/.peda
RUN sed -ri 's/n", "a/ff", "a/g' /home/pwn18/.peda/lib/config.py
RUN git clone https://github.com/scwuaptx/Pwngdb.git /home/pwn18/.Pwngdb
RUN curl https://gist.githubusercontent.com/ARO7I/6846e36e56258a44b25c64b1036549ac/raw/bcd734006fd4b80e467d112a11482a7bb858bb1e/.gdbinit -o /home/pwn18/.gdbinit

RUN python3 -m pip install --upgrade capstone
RUN git clone https://github.com/JonathanSalwan/ROPgadget.git /home/pwn18/.ROPgadget
RUN curl -fLo /home/pwn18/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

USER root
RUN echo "1234\n1234\n" | passwd root
RUN echo "1234\n1234\n" | passwd pwn18
COPY README /home/pwn18/README
RUN chmod 666 /home/pwn18/README
COPY start.sh /start.sh
RUN chmod 750 /start.sh
