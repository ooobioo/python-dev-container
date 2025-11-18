# FROM python:3.10-slim

# # WORKDIR /usr/app

# # COPY requirements.txt .
# # RUN pip install -r requirements.txt

# # COPY . .
# # CMD ["python", "app.py"]


# WORKDIR /usr/app

# COPY requirements.txt .

# RUN pip install --no-cache-dir --upgrade -r requirements.txt

# COPY . .

# CMD ["fastapi", "run", "main.py", "--port", "8080"]




# Use an official Python image
FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Set work directory
WORKDIR /code

# Install dependencies
COPY ./requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir -r /code/requirements.txt

# Copy project
COPY ./app /code/app

# Expose the port FastAPI will run on
EXPOSE 8080

# Run the FastAPI app with Uvicorn
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]
# CMD ["fastapi", "run", "app/main.py", "--port", "8080"]