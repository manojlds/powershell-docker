FROM ubuntu:16.04
MAINTAINER manojlds <manojlds@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update --quiet && \
 apt-get upgrade --quiet --force-yes -y && \
 apt-get install --quiet --force-yes -y wget libunwind8 libicu55 && \
 wget -q -O /tmp/powershell.deb https://github.com/PowerShell/PowerShell/releases/download/v6.0.0-alpha.9/powershell_6.0.0-alpha.9-1ubuntu1.16.04.1_amd64.deb && \
 dpkg -i /tmp/powershell.deb && \
 rm /tmp/powershell.deb && \
 apt-get remove --quiet --force-yes -y wget && \
 apt-get clean --quiet && \
 rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD []
ENTRYPOINT ["powershell"]
