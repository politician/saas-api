# Polystartup monorepo

All services are deployed on Kubernetes (k8s) for production. With Kubernetes you define how to deploy and **roll updates** for each service.
This means you have a little more work as a developer but it's totally worth it, since you can use this for all environments from your local machine to production.

## Documentation for each environment

- [Local development](docs/environments/local.md)
- [Testing (Continuously Integrated)](docs/environments/testing.md)
- [Staging (Continuously Deployed)](docs/environments/staging.md)
- [Production (Continuously Deployed)](docs/environments/production.md)
