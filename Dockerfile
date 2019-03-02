FROM java:8

RUN apt-get -y update && apt-get -y upgrade

RUN curl -o /usr/local/bin/embulk --create-dirs -L "http://dl.embulk.org/embulk-latest.jar" && \
  chmod +x /usr/local/bin/embulk && \
  /usr/local/bin/embulk gem install embulk-input-mysql embulk-output-bigquery

COPY start.sh /start.sh
RUN chmod +x /start.sh

COPY json-key.json /root/
COPY config /root/

WORKDIR /root
CMD ["/bin/sh", "/start.sh"]
