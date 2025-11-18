### Main documentation

[Back to README](../README.md)

## Development Container

This project uses a VS Code development container to provide a consistent Python development environment for all contributors.

The configuration is defined in `.devcontainer/devcontainer.json`:

```
{
  "name": "Python Dev Container",
  "build": {
    "dockerfile": "Dockerfile",
    "context": ".."
  },
  "customizations": {
    "vscode": {
      "settings": {
        "python.pythonPath": "/usr/local/bin/python"
      },
      "extensions": ["ms-python.python"]
    }
  },
  "forwardPorts":
}
```

### What this configuration does

- **Name**  
  `"name": "Python Dev Container"`  
  Sets the display name of the container as shown in VS Code.

- **Build configuration**  
  `"dockerfile": "Dockerfile"`  
  Tells VS Code to build the dev container image using the `Dockerfile` located in the `.devcontainer` directory.  
  `"context": ".."`  
  Uses the parent directory of `.devcontainer` as the Docker build context so the entire project is available during the image build.

- **VS Code customizations**  
  `"python.pythonPath": "/usr/local/bin/python"`  
  Configures VS Code to use the Python interpreter at `/usr/local/bin/python` inside the container.  
  `"extensions": ["ms-python.python"]`  
  Ensures the official Python extension is installed in the dev container for linting, IntelliSense, debugging, and other Python tooling.

- **Port forwarding**  
  `"forwardPorts": [8080]`  
  Forwards container port `8080` to the host, allowing you to access services running in the container via `http://localhost:8080`.

### How to use the dev container

1. Install the following tools on your host machine:

   - Docker (or a compatible container runtime)
   - Visual Studio Code
   - The Dev Containers extension (or Remote - Containers in older VS Code versions)

2. Open the project folder in VS Code.

3. When prompted, or via the Command Palette (`Ctrl+Shift+P` / `Cmd+Shift+P`), select:  
   **Dev Containers: Reopen in Container**

4. VS Code will:
   - Build the Docker image using the provided Dockerfile and context.
   - Create and start a container based on that image.
   - Attach your workspace to the running container.

Once the container is running, all actions (running Python scripts, debugging, installing dependencies) happen inside the container, ensuring a reproducible environment.

### Docker Compose Configuration

This project includes a `docker-compose.yml` file that defines how to run the application inside a Docker container. It provides a simple way to start and manage the project’s environment with one command.

```
services:
  app:
    build: .
    volumes:
      - .:/app
    ports:
      - 8080:8080
    command: uvicorn app.main:app --host 0.0.0.0 --port 8080
```

### What this configuration does

- **Service definition**  
  The file defines a single service named `app`, which represents the main web application container.

- **Build context**  
  `build: .`  
  Tells Docker Compose to build the image using the Dockerfile located in the current directory (`.`).

- **Volume mapping**  
  `volumes: - .:/app`  
  Mounts the current working directory on the host machine into the container at `/app`.  
  This allows live code changes on the host to immediately reflect inside the container without rebuilding the image.

- **Port mapping**  
  `ports: - 8080:8080`  
  Maps container port `8080` to host port `8080`, making the application accessible at `http://localhost:8080`.

- **Startup command**  
  `command: uvicorn app.main:app --host 0.0.0.0 --port 8080`  
  Runs a FastAPI application using Uvicorn, exposing it to all network interfaces inside the container on port 8080.

### How to use this configuration

1. Ensure Docker and Docker Compose are installed on your system.
2. In the project root (where the `docker-compose.yml` file is located), run:
   ```
   docker compose up --build
   ```
3. Docker Compose will:

   - Build the image from the local Dockerfile.
   - Start the container.
   - Forward port 8080 to your host machine.

4. Open a browser and visit:  
   `http://localhost:8080`

The application running via Uvicorn should now be accessible. Any code changes made locally will automatically appear inside the container due to the mounted volume.
