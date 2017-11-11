FROM gcr.io/android-battery-historian/stable:3.0
MAINTAINER shugaoye@yahoo.com

COPY scripts/bash.bashrc /root/bash.bashrc
RUN chmod 755 /root /root/bash.bashrc

