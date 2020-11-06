# Road to Kubernetes

_From VM to Kubernetes | One Python app's Journey_

Howdy cowboy 🤠! Welcome to 1.0! At this stage local dev is basically the same
as production. We're SSH-ing all the time and things are pretty manual.

*Local Development*

Get your dependencies installed

```shell
# Install dependencies
$ sudo dnf install -y redis
$ sudo systemctl enable --now redis
$ pipenv install
```

and run!

```shell
$ pipenv run python main.py
```

*Deployment*

Give your SSH public key to <<Insert lead dev or grumpy sysadmin name here>>
and she will copy your key into the production server.

SSH into the prod server run the same commands as above.
