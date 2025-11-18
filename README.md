# Python Docker Development Container

## Prerequisites for Running Docker Development Containers

### Essential Software

- **Docker Desktop** (Windows/Mac) or **Docker Engine** (Linux) - latest version installed and running
- **Visual Studio Code** or another IDE with dev container support
- **Dev Containers Extension** (for VS Code) - install from the extensions marketplace
- **Git client** - for version control

### System Requirements (Windows)

- **WSL2** (Windows Subsystem for Linux) or **Hyper-V** enabled
- **Administrator privileges** during Docker Desktop installation

### Configuration Files

- **Dockerfile** or **Dockerfile.dev** - defines your container environment
- **devcontainer.json** - specifies VS Code dev container configuration
- **docker-compose.yml** - optional, for orchestrating multiple containers

### Development Environment

- **Text editor or IDE** - for editing files
- **Command line interface (CLI)** - familiarity with terminal commands
- **Internet connection** - for pulling Docker images

### Optional Components

- **Docker Compose** - for multi-container applications
- **Language-specific tools** - Python, Node.js, etc., depending on your project
- **Project dependencies** - requirements.txt, package.json, etc.

## Start a Docker Container with Compose Watch

The Development Container from this project can be started with this command:

```

docker compose -f docker-compose.watch.yaml up --watch

```

The command `docker compose -f docker-compose.watch.yaml up --watch` does the following:

- It uses Docker Compose with a specific Compose file named docker-compose.watch.yaml (specified by the `-f` option) to start and run the defined services.

- The up command builds, creates, starts, and attaches to the containers for the services defined in the Compose file.

- The `--watch` flag enables a file watch mode, where Docker Compose monitors specified files or directories for changes as configured in the Compose file.

- When changes are detected in the watched files, it can automatically synchronize those changes in the running containers or trigger container rebuilds and restarts based on the configured actions. This helps developers to see live updates in the containerized environment when source code or configuration files are modified.

In essence, this command is used for a development setup to automatically reflect file changes inside containers for an improved workflow, leveraging the "watch" capabilities introduced in Docker Compose for seamless live reloading and rebuilding of containers

- For Docker-related setup and usage, see [Docker Documentation](/docs/DOCKER.md).
- For Docker-Compose-related setup and usage, see [Docker Compose Documentation](/docs/DOCKER-COMPOSE.md).
- For Docker-Compose-Watch-related setup and usage, see [Docker Compose Watch Documentation](/docs/DOCKER-COMPOSE-WATCH.md).
- For Docker-DOCKERFILE-related setup and usage, see [Docker DOCKERFILE Documentation](/docs/DOCKER-DOCKERFILE.md).

## Sources

### Software

https://www.docker.com/

https://code.visualstudio.com/

### Tutorials

https://youtu.be/FhorvGysZ6w?si=S9Mlci3dEOrjCx_T

https://youtu.be/b1RavPr_878?si=72xdYYcN0m2Eg_Oa

## Archive / Old Shit

### Build Container

```

docker build -t my-python-dev .

```

### Run Container

```

docker run -it --rm -v $(pwd):/usr/app my-python-dev
docker run -it --rm -p 8080:8080 -v $(pwd):/usr/app my-python-dev

```

### Fast API

```

docker build -t myimage .
docker run -d --name mycontainer -p 8080:8080 myimage

```

```

```

```

```
