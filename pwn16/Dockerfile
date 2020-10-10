FROM ubuntu:16.04
MAINTAINER ARO7I <ARO7I@icloud.com>

ENV TZ Asia/Seoul
ENV LC_ALL=C.UTF-8
ENV PYTHONIOENCODING UTF-8
ENV USER_NAME pwn
ENV USER_PASS 1234
ENV SSH_PORT 4416

RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install vim git curl -y
RUN apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 -y
RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone

# Install shell
RUN apt-get install zsh -y
RUN useradd -m -s `which zsh` -g users ${USER_NAME}
RUN echo "${USER_PASS}\n${USER_PASS}\n" | passwd root
RUN echo "${USER_PASS}\n${USER_PASS}\n" | passwd ${USER_NAME}
WORKDIR /home/${USER_NAME}
USER ${USER_NAME}
ENV LC_ALL=C.UTF-8
RUN curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
ADD zshrc .zshrc
ADD vimrc .vimrc
USER root

# Install pwntools
RUN apt-get install python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential -y
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --upgrade pwntools

# Install ssh
RUN apt-get install openssh-server -y
RUN sed -ri "s/Port 22/Port ${SSH_PORT}/g" /etc/ssh/sshd_config

# Install nc
RUN apt-get install netcat-traditional

# Install gdb
RUN apt-get install gdb -y

# Install peda, Pwndbg
RUN git clone https://github.com/longld/peda.git .peda
RUN sed -ri 's/n", "a/ff", "a/g' .peda/lib/config.py
RUN git clone https://github.com/scwuaptx/Pwngdb.git .Pwngdb
RUN curl https://gist.githubusercontent.com/ARO7I/6846e36e56258a44b25c64b1036549ac/raw/bcd734006fd4b80e467d112a11482a7bb858bb1e/.gdbinit -o .gdbinit

# Install ROPgadget
RUN python3 -m pip install --upgrade capstone
RUN git clone https://github.com/JonathanSalwan/ROPgadget.git .ROPgadget
RUN echo 'alias ROPgadget="python3 $HOME/.ROPgadget/ROPgadget.py"' >> .zshrc

# Install one_gadget
RUN apt-get install ruby -y
RUN gem install one_gadget

#USER pwn
ADD start.sh /start.sh
RUN chmod +x /start.sh
