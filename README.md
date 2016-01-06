# docker-email-forward

Email forwarding service

## How to run

```bash
$ docker pull basecase/docker-email-forward
$ docker run -d --name email-forward -p 25:25 -e DOMAINS=example.com -e EMAILS="me@example.com me@gmail.com" email-forward
```

## How to setup domain MX records

TODO
