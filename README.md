# Python Docker Development Container

## Start a Docker Container with Compose Watch

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
