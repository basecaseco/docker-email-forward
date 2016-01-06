# docker-email-forward

Email forwarding service


## How to run

First, you need to pull the docker image:
```bash
$ docker pull basecase/docker-email-forward
```

Now, say you want to forward emails of "me@example.com" to "me@gmail.com", do the following:
```bash
$ docker run -d --name email-forward -p 25:25 \
    -e DOMAINS=example.com \
    -e EMAILS="me@example.com me@gmail.com" \
    basecase/email-forward
```

You want to forward emails for multiple email addresses? No problem!
```bash
$ docker run -d --name email-forward -p 25:25 \
    -e "DOMAINS=example1.com example2.com" \
    -e EMAILS="bob@example1.com bob@gmail.com;alice@example2.com alice@yahoo.com" \
    basecase/email-forward
```


## How to setup domain MX records

TODO


## License

MIT License
