#!/bin/sh
# Generate host keys
ssh-keygen -A

# Prepare authorized keys
# All variables that start with AUTHORIZED_KEY will be used
for line in "$(env | grep ^AUTHORIZED_KEY)"; do
  value=$(echo $line | cut -d= -f2-)
  echo $value >> /root/.ssh/authorized_keys
done

# Start sshd in the foreground and log to stderr
/usr/sbin/sshd -D -e "$@"
