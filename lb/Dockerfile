FROM ubuntu:bionic

COPY /conf /tmp/
COPY /ssl /tmp/
COPY entrypoint.sh /tmp/

RUN \
# install packages
    apt-get update && \
    apt-get install --no-install-recommends --no-install-suggests -y \
    vim inetutils-ping iproute2 curl rsyslog haproxy keepalived && \
    rm -rf /var/lib/apt/lists/* && \
# syslog settings
    sed -i 's/^\(module.*imklog.*\)/# \1/g' /etc/rsyslog.conf && \
# cp stuff
    cp /tmp/entrypoint.sh / && \
    mkdir /etc/ssl && cp -r /tmp/certs/ /etc/ssl && cp -r /tmp/private/ /etc/ssl && \
    cp -r /tmp/haproxy/* /etc/haproxy && \
    cp -r /tmp/keepalived/* /etc/keepalived && \
# chmod
    chmod +x /entrypoint.sh && \
# clean up
    rm -r /tmp/*

EXPOSE 8080 8443 8090

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/bin/bash"]