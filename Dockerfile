FROM chromedp/headless-shell:83.0.4103.97

RUN apt-get update && apt-get install -y ca-certificates && \
mkdir -p /usr/local/share/ca-certificate && \
mkdir -p /usr/local/work
COPY conf/crt /usr/local/share/ca-certificate
COPY run.sh /usr/local/work/run.sh
RUN chmod 755 /usr/local/work/run.sh && \
update-ca-certificates

WORKDIR /usr/local/work

EXPOSE 8888
EXPOSE 9999
EXPOSE 12658

ENTRYPOINT ["/usr/local/work/run.sh"]
