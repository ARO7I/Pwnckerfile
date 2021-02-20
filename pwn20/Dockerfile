FROM ubuntu:20.04
MAINTAINER ARO7I <ARO7I@icloud.com>

ARG ID=pwn20
ARG PW=1234
ARG HOME=/home/${ID}/
ARG PORT=4420

ENV TZ Asia/Seoul
ENV LC_ALL C.UTF-8
ENV PYTHONIOENCODING UTF-8

RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone
RUN sed -i "s/archive.ubuntu.com/mirror.kakao.com/g" /etc/apt/sources.list

RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install curl git wget file zsh sudo vim libssl-dev libffi-dev build-essential netcat-traditional -y
RUN apt-get install gdb python3 python3-pip python3-dev ruby binutils-multiarch -y
RUN apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 -y
RUN apt-get upgrade -y
RUN apt-get autoremove -y
RUN gem install one_gadget

RUN useradd -ms /bin/zsh ${ID}
RUN adduser ${ID} sudo
WORKDIR ${HOME}

RUN apt-get install openssh-server -y
RUN sed -ri "s/#Port 22/Port ${PORT}/g" /etc/ssh/sshd_config

USER ${ID}
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN git clone https://github.com/djui/alias-tips.git ${HOME}/.oh-my-zsh/custom/plugins/alias-tips

USER root
COPY zshrc ${HOME}/.zshrc
RUN chmod 666 ${HOME}/.zshrc
COPY vimrc ${HOME}/.vimrc
RUN chmod 666 ${HOME}/.vimrc
COPY update.sh ${HOME}/.update.sh
RUN chmod +x ${HOME}/.update.sh

USER ${ID}
RUN pip3 install -U pip
RUN pip3 install -U pwntools
RUN git clone https://github.com/longld/peda.git ${HOME}/.peda
RUN sed -ri 's/n", "a/ff", "a/g' ${HOME}/.peda/lib/config.py
RUN git clone https://github.com/scwuaptx/Pwngdb.git ${HOME}/.Pwngdb
RUN curl https://gist.githubusercontent.com/ARO7I/6846e36e56258a44b25c64b1036549ac/raw/bcd734006fd4b80e467d112a11482a7bb858bb1e/.gdbinit -o ${HOME}/.gdbinit

RUN python3 -m pip install --upgrade capstone
RUN git clone https://github.com/JonathanSalwan/ROPgadget.git ${HOME}/.ROPgadget
RUN curl -fLo ${HOME}/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

USER root
RUN echo "${PW}\n${PW}\n" | passwd root
RUN echo "${PW}\n${PW}\n" | passwd ${ID}
COPY start.sh /start.sh
RUN chmod 750 /start.sh
