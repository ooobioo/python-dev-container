### Main documentation

[Back to README](../README.md)

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

### Troubleshooting

- **Port conflict error**  
  If you get errors like `port is already allocated`, it means port 8080 is in use on your host. Stop other services using that port or change the port mapping in `docker-compose.yml`, for example:

  ```
  ports:
    - 8081:8080
  ```

  Then access the app at `http://localhost:8081`.

- **Permission issues with volume mounting**  
  On some systems (e.g., Windows or macOS), file permission mismatches can cause problems inside the container. Ensure your Docker Desktop or daemon has access rights to the project directory.

- **Container doesn't reflect code changes**  
  Confirm that the volume is correctly mounted by checking `/app` inside the container. Running `docker compose down` then `docker compose up` again can also help refresh mounts.

- **Uvicorn startup problems**  
  Check logs for errors related to missing dependencies or Python environment issues. Make sure the Dockerfile installs all required Python packages.

If problems persist, consult the Docker and Docker Compose documentation or ask in relevant community forums.
