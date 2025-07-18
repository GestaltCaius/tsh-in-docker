<h1 align="center">Docker Client for Teleport's tsh CLI</h1>
<h3 align="center">Run any tsh version anywhere, with kubectl and k9s included.</h3>

---

<p align="center">
<img alt="Logo Banner" src="https://raw.githubusercontent.com/GestaltCaius/tsh-in-docker/refs/tags/v1.1.0/assets/banner.jpg?sanitize=true" height="300"/>
</p>

<br/>
<br/>

<p align="center">

<a href="https://hub.docker.com/r/uncookedconcept/tsh-in-docker">
<img alt="Docker Pulls" src="https://img.shields.io/docker/pulls/uncookedconcept/tsh-in-docker?logo=docker&color=lightblue">
</a>

<a href="https://github.com/GestaltCaius/tsh-in-docker/releases">
<img alt="Current Release" src="https://img.shields.io/github/release/GestaltCaius/tsh-in-docker.svg"/>
</a>

<a href="https://github.com/GestaltCaius/tsh-in-docker/actions/workflows/publish.yaml">
<img alt="GitHub Actions Workflow Status" src="https://img.shields.io/github/actions/workflow/status/GestaltCaius/tsh-in-docker/publish.yaml?label=release%20CI">
</a>

</p>

---

Run your [Teleport](https://goteleport.com/docs/connect-your-client/tsh/) `tsh` CLI inside a docker container, so you can use multiple `tsh` versions on the same machine.
`k9s` and `kubectl` are included so you can interact with K8s cluster easily.

The image is based on **Ubuntu 22.04**.

## ✨ Features

  * **Teleport Client (`tsh`)**: Access your Teleport clusters.
  * **`kubectl`**: Interact with your Kubernetes clusters through the Teleport proxy.
  * **`k9s`**: Browse your Kubernetes clusters with an enhanced terminal UI.
  * **Customizable**: The version of each tool can be specified at build time.

## 🚀 Getting Started

### Prerequisites

  * [Docker](https://www.docker.com/get-started/) must be installed on your machine.

### Use the Pre-Built Image (Recommended)

The easiest way to get started is to pull the latest image from Docker Hub.

```bash
docker pull uncookedconcept/tsh-in-docker:latest
```

### Run a Container

To start an interactive shell within the environment, run the following command.

The `-v` volume mounts are essential to persist your `tsh` and `kubectl` configurations between sessions.

```bash
docker run --rm -it \
  -v ~/.tsh:/root/.tsh \
  -v ~/.kube:/root/.kube \
  uncookedconcept/tsh-in-docker:latest
```

## 🔧 Customization (Local Build)

You can build the image locally to use specific versions of the included tools.

### 1. Clone the Repository

```bash
git clone https://github.com/GestaltCaius/tsh-in-docker.git
cd tsh-in-docker
```

### 2. Build the Image

You can override the default versions using `--build-arg` flags.

```bash
# Example: Build with a different version of tsh
docker build \
  --build-arg TELEPORT_VERSION=17.4.8 \
  -t tsh:17.4.8 .
```

### Available Build Arguments

| Argument           | Description                                | Default   |
| :----------------- | :----------------------------------------- | :-------- |
| `TELEPORT_VERSION` | The version of the Teleport client (`tsh`) | `13.4.26` |
| `KUBECTL_VERSION`  | The version of `kubectl`                   | `1.33.2`  |
| `K9S_VERSION`      | The version of `k9s`                       | `0.50.9`  |

## 🤝 Contributing

Contributions are welcome\! Please feel free to open an issue or submit a pull request.

## 📜 License

This project is licensed under the **AGPLv3** - see the `LICENSE` file for details.
