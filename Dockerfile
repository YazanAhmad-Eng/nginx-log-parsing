FROM bash:5.0-alpine3.15
RUN mkdir -p /scripts
COPY script.sh /scripts
COPY Access.log /scripts

WORKDIR /scripts
RUN chmod +x script.sh
#RUN bash script.sh Access.log all