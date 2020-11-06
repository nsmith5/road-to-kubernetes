# Road to Kubernetes

_From VM to Kubernetes | One Python app's Journey_

Welcome to 3.0! We are in the clouds big time now ☁️ ! We've moved our stateful
Redis instance into Google Cloud Platforms hosted Redis service and we're
running our stateless web app container using Cloud Run. All cloud
infrastructure is in code in the `/terraform` directory.

![GitHub Logo](/docs/diagram.png)

**Local Development**

Local development is the same as before, simple run
`docker-compose up`

**Deployment**

No need! We deploy automatically on every commit to `main`.

Still want to do it manually? Run `terraform apply` and pass
the commit sha you'd like to deploy as the `image_tag` variable.
