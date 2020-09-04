# Polystartup monorepo

All services are deployed on Kubernetes (k8s) for production. With Kubernetes you define how to deploy and **roll updates** for each service.
This means you have a little more work as a developer but it's totally worth it, since you can use this for all the environments from local to production.

## Local development

### Setup environment

### Install dependencies

```sh
brew install docker kind tilt-dev/tap/tilt kubectl
```

### Setup a local Kubernetes cluster with Kind

This is using Kind (Kubernetes in Docker)

```sh
curl -fsSL https://raw.githubusercontent.com/tilt-dev/kind-local/master/kind-with-registry.sh | bash
```

### Typical workflow

#### 1. Build & deploy the project locally

```sh
nx run-many --target=build --all && tilt up
```

ℹ️ Press space to open the Tilt web UI

> Nx builds all the apps and libraries to the `dist` folder. Then Tilt builds containers from the code found in the `dist/apps` folder and loads them into your local cluster. The code flow is `uncompiled (src)` > `compiled (dist)` > `docker image (local registry)` > `container (local k8s)`

#### 2. Working on an app/service

Now, let's say you need to work on `generic-api`. In a new terminal window (or split the current window):

```sh
nx serve generic-api
```

Nx will watch for changes in `generic-api` and any local library it depends on and will rebuild them into to the `dist` folder. You can use the given URL to test your changes instantly.

If you would like to test the changes in your local cluster, just hit the re-build/deploy icon next to the `generic-api` container. And open the URL specified at the top of the container's UI.

> Tilt could also re-build/deploy the updated containers automatically. Just comment out the line `trigger_mode(TRIGGER_MODE_MANUAL)` in `Tiltfile`. This is especially useful if you are working on the deployment configuration or the Docker file.

**Just repeat step 2 for any other app you want to work on.** And don't forget to re-build/deploy the apps you changed if your other apps are depending on them and you want to see the changes.

### Useful commands

> Don't be scared to destroy your containers or your cluster, you can spin them back up as easily as you destroyed them.

#### Delete the current project from your local k8s cluster, but keep the cluster

```sh
tilt down
```

#### Delete the current project and reset your local k8s cluster

```sh
kind delete cluster && curl -fsSL https://raw.githubusercontent.com/tilt-dev/kind-local/master/kind-with-registry.sh | bash
```

## Testing (Continuously Integrated)

## Staging (Continuously Deployed)

## Production (Continuously Deployed)
