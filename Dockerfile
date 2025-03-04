# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Install git to clone the repository
RUN apt-get update && apt-get install -y git

# Install system dependencies (if needed, e.g., for PostgreSQL)
RUN apt-get install -y libpq-dev

# Set environment variables to prevent Python from writing .pyc files to disk
# and to ensure that Python output is sent straight to the terminal (and not buffered).
ENV PYTHONUNBUFFERED=1

# Create and set the working directory inside the container
WORKDIR /app

# Clone the GitHub repository into the container
RUN git clone https://github.com/Harshwankhede04/python-Django.git .

# Install Django and any other Python dependencies you need
RUN pip install --no-cache-dir django

# If you have other dependencies, you can install them like this:
# RUN pip install --no-cache-dir <other-dependency>

# Expose the port Django will run on
EXPOSE 8000

# Run Django's development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

