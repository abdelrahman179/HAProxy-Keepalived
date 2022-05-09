FROM nginx

COPY entrypoint.sh default.conf /tmp/
COPY ./ssl /tmp/

RUN \
# install packages
    apt-get update && \
    apt-get install --no-install-recommends --no-install-suggests -y \
    vim && \
    rm -rf /var/lib/apt/lists/* && \
# cp stuff
    cp /tmp/entrypoint.sh / && \
    cp -r /tmp/default.conf /etc/nginx/conf.d/ && \
    cp -r /tmp/certs /etc/ssl/ && cp -r /tmp/private /etc/ssl && \
# chmod
    chmod +x /entrypoint.sh && \
# clean up
    rm -r /tmp/*

EXPOSE 80 443

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/bin/bash"]
