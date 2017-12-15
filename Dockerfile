FROM ubuntu:16.04
MAINTAINER duke

# noninteractive mode
ENV DEBIAN_FRONTEND=noninteractive
ENV tz Asia/Shanghai

RUN echo "$tz" > /etc/timezone && \
	locale-gen en_US.UTF-8 && \
	apt-get update && \
	apt-get install -y pppoe iputils-ping \
	vim-tiny iptables net-tools dnsutils && \
	apt-get clean

ADD start.sh /usr/bin/start.sh
ENTRYPOINT ["/usr/bin/start.sh"]
