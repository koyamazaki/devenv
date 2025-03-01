FROM ubuntu:22.04

RUN apt update && apt install -y openssh-server sudo

# SSH settings
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# X11 settings
RUN sed -i 's/#AllowTcpForwarding yes/AllowTcpForwarding yes/' /etc/ssh/sshd_config
RUN sed -i 's/#X11DisplayOffset 10/X11DisplayOffset 10/' /etc/ssh/sshd_config
RUN sed -i 's/#X11UseLocalhost yes/X11UseLocalhost yes/' /etc/ssh/sshd_config
RUN sed -i 's/#   ForwardX11 no/   ForwardX11 yes/' /etc/ssh/ssh_config

RUN mkdir -p /run/sshd
EXPOSE 22

# add user
RUN useradd -m -s /bin/bash developer
RUN echo "developer:developer" | chpasswd
RUN echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer

#ENTRYPOINT service ssh start && bash

#CMD ["tail", "-f", "/dev/null"]
CMD ["/usr/sbin/sshd", "-D"]