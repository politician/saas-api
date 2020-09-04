# Local Development

## Install toolchain

```sh
brew install docker kind tilt-dev/tap/tilt kubectl
```

## Setup a local Kubernetes cluster

This is using Kind (Kubernetes in Docker)

```sh
curl -fsSL https://raw.githubusercontent.com/tilt-dev/kind-local/master/kind-with-registry.sh | bash
```

## Code flow

Nx builds apps and libraries to the `dist` folder. Then Tilt builds containers from the code found in the `dist/apps` folder and loads them into your local cluster.

```text
   Source code          Compiled code          Docker image            Container
+---------------+     +---------------+     +----------------+     +---------------+
|               |     |               |     |                |     |               |
|     */src     | --> |    */dist     | --> | local registry | --> |   local k8s   |
|               |     |               |     |                |     |               |
+---------------+     +---------------+     +----------------+     +---------------+

<------------------------------------->     <-------------------------------------->
                  Nx                                           Tilt
```

## Typical developer workflow

### 1. Build & deploy the project locally

```sh
yarn install
nx run-many --target=build --all && tilt up
```

_Press space to open the Tilt UI_

### 2. Working on an app/service

Now, let's say you need to work on `generic-api`. In a new terminal window (or split the current window):

```sh
nx serve generic-api
```

At this point you can test your app in two ways:

- **Direct** (the URL is specified in your terminal by Nx)
- **Deployed** (the URL is specified at the top Tilt's UI for each container)

> Tilt is setup to re-build/deploy containers automatically. If for some reason, you don't like this automatic behavior, just comment out the line `trigger_mode(TRIGGER_MODE_MANUAL)` in `Tiltfile` and hit the deploy icon highlighted in the Tilt UI when you make a change in the code.

## Useful commands

Don't be scared to destroy your containers or your cluster, you can spin them back up as easily as you destroyed them.

### Delete the current project

This will delete the project from your local k8s cluster, but keep the cluster intact.

```sh
tilt down
```

> Run `tilt up` to bring it back up

### Delete the local k8s cluster

```sh
kind delete cluster
```

> Run `curl -fsSL https://raw.githubusercontent.com/tilt-dev/kind-local/master/kind-with-registry.sh | bash` to bring it back up
