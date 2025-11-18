### Main documentation

[Back to README](../README.md)

### Docker Compose Watch Configuration

This project uses a `docker-compose-watch.yaml` file to define a Docker Compose service that supports automatic rebuild and restart based on file changes. This setup is particularly useful for development workflows where live reload or quick feedback loops are important.

```
services:
  app:
    build: .
    develop:
      watch:
        - path: app/
          # action: sync+restart
          action: rebuild
          target: /app
          # target: /app/app
        - path: requirements.txt
          action: rebuild
    ports:
      - 8080:8080
    command: uvicorn app.main:app --host 0.0.0.0 --port 8080
```

### What this configuration does

- **Service definition**  
  Defines a single service named `app`, for running the main application container.

- **Build context**  
  `build: .`  
  Builds the Docker image from the Dockerfile in the current directory.

- **Develop watch configuration**  
  The `develop.watch` section defines a set of file paths and actions Docker Compose or an associated tool should monitor during development.

  - The file or directory at `app/` is watched. On changes, the container triggers a `rebuild` action, syncing the local changes to `/app` inside the container.
  - The `requirements.txt` file is also watched. If it changes, the `rebuild` action triggers to update the container environment accordingly.
  - Commented-out examples show an alternative `sync+restart` action and a different target path, illustrating flexibility in configuration.

- **Port mapping**  
  `ports: - 8080:8080`  
  Exposes port 8080 from the container to the host, accessible at `http://localhost:8080`.

- **Startup command**  
  Runs a FastAPI application using Uvicorn, accessible on all interfaces of the container at port 8080.

### How to use this configuration

1. Ensure Docker and Docker Compose are installed.
2. Use a file-watching and rebuild tool compatible with the `develop.watch` format (this could be a custom script or a tool integrated into your development environment).
3. Start the service using Docker Compose:
   ```
   docker compose -f docker-compose-watch.yaml up --build
   ```
4. File changes within the specified watched paths will trigger automatic rebuilds or sync actions inside the container, speeding up your development cycle.

### Notes

- The `develop.watch` feature is not part of the standard Docker Compose specification. It is typically implemented by development tools or extensions that integrate with Docker Compose for live reload capabilities.
- Confirm your development environment supports this feature or adjust the file watching logic accordingly (e.g., using `docker-compose` along with a watcher like `docker-sync`, `watchexec`, or custom scripts).
