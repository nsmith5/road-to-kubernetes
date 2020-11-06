# Road to Kubernetes

_From VM to Kubernetes | One Python app's Journey_

Hey there! This repository is a journey in continuous integration and
containers through 4 releases:

- [Release 1.0.0](https://github.com/nsmith5/road-to-kubernetes/tree/1.0.0) is
a basic "SSH to prod and pull updates" type situations. Everything is manual and
hard to reproduce.
- [Release 2.0.0](https://github.com/nsmith5/road-to-kubernetes/tree/2.0.0) is
the start of automation and containers. We use docker-compose to make our dev
environment reproducable and use a CI pipeline to produce containers for all
commits on `main`.
- [Release 3.0.0](https://github.com/nsmith5/road-to-kubernetes/tree/3.0.0) scales
out this setup by running stateless web application in a serverless container
service (Googles Cloud Run) and moves databases to managed cloud services
(hosted Google Redis instance here). We control everything with Terraform.
- [Release 4.0.0](https://github.com/nsmith5/road-to-kubernetes/tree/4.0.0) breaks
out of cloud vendor lock-in and ships the project as a Helm chart. We continue
to use Terraform to deploy the production cluster, but the application can
run on any cluster.

Navigate to each tag to learn more!

> Made with ❤️  in Vancouver, CA.
