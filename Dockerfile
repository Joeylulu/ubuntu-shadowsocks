FROM ubuntu:14.04
MAINTAINER joeyzhang

ENV REFRESHED_AT 2015-06-05

RUN apt-get -qq update && \
    apt-get install -q -y python-pip python-m2crypto
RUN pip install shadowsocks

ENV SS_SERVER_ADDR 0.0.0.0
ENV SS_SERVER_PORT 8388
ENV SS_PASSWORD password
ENV SS_METHOD aes-256-cfb
ENV SS_TIMEOUT 300

ADD shadowsocks.json /etc/
ADD start.sh /usr/local/bin/start.sh
RUN chmod 755 /usr/local/bin/start.sh

EXPOSE $SS_SERVER_PORT

#CMD ["sh", "-c", "/start.sh"]
ENTRYPOINT ["/usr/local/bin/ssserver"]
