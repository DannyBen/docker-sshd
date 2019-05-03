FROM alpine

RUN apk add --no-cache openssh

RUN mkdir -p /root/.ssh && \
    chmod 700 /root/.ssh && \
    touch /root/.ssh/authorized_keys && \
    chmod 600 /root/.ssh/authorized_keys

RUN sed -i s/root:!/"root:*"/g /etc/shadow

COPY sshd-entrypoint /sshd-entrypoint

EXPOSE 22
