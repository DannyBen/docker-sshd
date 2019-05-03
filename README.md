Alpine SSH Client and Server
==================================================

Minimal Alpine ssh client and server.

Quick Start
--------------------------------------------------

You can use the [docker-compose](docker-compose.yml) file, to get up and 
running quickly.

    $ export AUTHORIZED_KEY="ssh-rsa ..."
    $ docker-compose up server
    $ docker-compose run --rm client


Usage
--------------------------------------------------

This usage pattern shows how to have both a server and a client as docker
containers. If you need only one side of it, skip whatever is not relevant.


### Network

First, create a network for the two containers to share:

    $ docker network create -d bridge dockernet


### Server

Create an environment variable with your public key, then start the server.

    $ export AUTHORIZED_KEY="ssh-rsa ..."
    $ docker run --rm -it -e AUTHORIZED_KEY \
      --network dockernet \
      --entrypoint /sshd-entrypoint \
      --name server \
      dannyben/sshd


### Client

In another terminal, mount your private key and connect to the server:

    $ docker run --rm -it \
      -v ~/.ssh/id_rsa:/root/.ssh/id_rsa:ro \
      --network dockernet \
      dannyben/sshd \
      ssh server


Additional Information
--------------------------------------------------

- [dannyben/docker-sshd on GitHub][1]
- [dannyben/sshd on Docker Hub][2]

---

[1]: https://github.com/DannyBen/docker-sshd
[2]: https://hub.docker.com/r/dannyben/sshd/

