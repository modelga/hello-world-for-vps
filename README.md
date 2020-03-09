## Description

Here is the sample repository how to build a simple micro-serviced infrastructure on top of docker-compose deployment using Scaleway resources such as 



### Parts

* [`git-secret`](https://git-secret.io) - is a tool that allows you to store secrets inside the repisotory
* [`terraform`](https://www.terraform.io/) - Infrastracture as Code written in Go, declarative language describing your infrastructure and its dependencies
* [`scaleway`](https://scaleway.com) - Cheaper but less advanced similar to AWS provider for infrastructure solutions. From there it's possible to pick some parts like Object Storage (works like S3), Compute Instances (works like EC2, gives SSH access to VPS) and Container Registry (simple Docker Registry). 
* [`cloudflare`](https://cloudflare.com) - DNS and 