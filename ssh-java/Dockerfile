FROM ubuntu:22.04

RUN apt update && apt install -y openssh-server sudo unzip

# java install
RUN apt install -y openjdk-21-jdk
ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
ENV PATH=${PATH}:${JAVA_HOME}/bin

# maven install
RUN wget https://archive.apache.org/dist/maven/maven-3/3.8.4/binaries/apache-maven-3.8.4-bin.zip
RUN unzip apache-maven-3.8.4-bin.zip
RUN mv apache-maven-3.8.4 /opt/maven
RUN mkdir -p ~/.m2
ENV MAVEN_HOME=/opt/maven
ENV PATH=${PATH}:${MAVEN_HOME}/bin

# gradle install
#TODO

# SSH settings
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
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

# copy wrapper script
COPY ./main.sh /main.sh
RUN chmod 755 /main.sh

CMD ["/main.sh"]