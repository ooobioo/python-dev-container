### Main documentation

[Back to README](../README.md)

# FastAPI Docker Container – README

This README explains the provided Dockerfile and shows you how to build and run a container for a FastAPI application.

## Dockerfile Source

```
# Use an official Python image
FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
PYTHONUNBUFFERED=1

# Set work directory
WORKDIR /code

# Install dependencies
COPY ./requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir -r /code/requirements.txt

# Copy project
COPY app /code/app

# Expose the port FastAPI will run on
EXPOSE 8080

# Run the FastAPI app with Uvicorn
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]

```

## Explanation of Each Dockerfile Line

- **FROM python:3.11-slim**  
  Starts with an official, slim Python 3.11 base image.

- **ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1**

  - Prevents `.pyc` files from being written inside the container and disables output buffering, ensuring logs are printed immediately.

- **WORKDIR /code**  
  Sets the working directory for subsequent commands inside the container.

- **COPY ./requirements.txt /code/requirements.txt**

  - Copies your requirements file into the container.

- **RUN pip install --no-cache-dir -r /code/requirements.txt**

  - Installs Python dependencies without pip cache (minimizes image size).

- **COPY app /code/app**

  - Copies your FastAPI project source code into the container at `/code/app`.

- **EXPOSE 8080**

  - Makes port 8080 available for FastAPI.

- **CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]**
  - Runs FastAPI using Uvicorn, available to your network at port 8080.

## How to Build the Docker Image

Execute this command in the folder containing your Dockerfile:

`docker build -t fastapi-app .`

## How to Run the Docker Container

Start the container and map port 8080 to your host:

`docker run -d -p 8080:8080 fastapi-app`

You can then access your FastAPI app at `http://localhost:8080`.

## Development Tips

- To enable automatic reload for development, change the last line in the Dockerfile to  
  `CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080", "--reload"]`
- To mount your local code (live editing) without rebuilding:
  docker run -d -p 8080:8080 -v $(pwd)/app:/code/app fastapi-app
