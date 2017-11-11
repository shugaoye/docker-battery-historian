FROM shugaoye/docker-battery-historian:latest
MAINTAINER shugaoye@yahoo.com

# Only use this for the local build
COPY scripts/sources.list /etc/apt/sources.list
RUN apt-get -y update && apt-get install -y sudo openssh-server

RUN mkdir /var/run/sshd
RUN export LC_ALL=C

RUN echo 'root:root' | chpasswd

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

EXPOSE 22

CMD    ["/usr/sbin/sshd", "-D"]

COPY scripts/bash.bashrc /root/bash.bashrc
RUN chmod 755 /root /root/bash.bashrc
COPY scripts/docker_entrypoint.sh /root/docker_entrypoint.sh

# ENTRYPOINT ["/root/docker_entrypoint.sh"]
