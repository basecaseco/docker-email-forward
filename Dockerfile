FROM debian
MAINTAINER Ye Liu <yeliu@basecase.co>
COPY start.sh /opt/start.sh
RUN \
    apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y postfix && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    echo 'virtual_alias_domains = <%= domains %>' >> /etc/postfix/main.cf && \
    echo 'virtual_alias_maps = hash:/etc/postfix/virtual' >> /etc/postfix/main.cf
EXPOSE 25
ENTRYPOINT ["/bin/bash", "/opt/start.sh"]

