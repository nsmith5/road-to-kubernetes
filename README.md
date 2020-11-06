# Road to Kubernetes

_From VM to Kubernetes | One Python app's Journey_

Welcome to 2.0! Looks like we've hopped on the hype train
and started using containers 🐳! We've also got continuous
integration and deployment all set up! Very fancy ✨

**Local Development**

Wow! All we need is docker and docker-compose now. Want
to spin up our app? Just run `docker-compose up`.

**Deployment**

No need! We deploy automatically on every commit to `main`.

Still want to do it manually? Run these commands on the
production box:

```shell
$ pushd /opt/road-to-kubernetes
$ git pull                   # Pull down your changes
$ docker-compose build       # Rebuild the container
$ docker-compose restart web # Restart the web server
$ popd
```
