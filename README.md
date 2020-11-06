# Road to Kubernetes

_From VM to Kubernetes | One Python app's Journey_

Welcome to 4.0! We're full on Kubernetes now and we're Cloud agnostic!

We now use Terraform to deploy the Kubernetes cluster but not the application.
Our application is bundled in a Helm Chart. It can be deployed to GCP, but also
any other Kubernetes cluster. We run Redis in a `StatefulSet` with persistent
volumes to save our data and we run our Python web servers in a `Deployment` for
easy horizontal scaling.

![GitHub Logo](/docs/diagram.png)

**Local Development**

Local development is the same as before, simple run `docker-compose up` or run
`helm install {release-name} chart` to install in a local Kubernetes clusters
(e.g minikube).

**Deployment**

No need! We deploy automatically on every commit to `main`.

Still want to do it manually? Run `helm install road-to-kubernetes chart --set
image.tag={commit-sha}` while connected to the production cluster in GCP.
