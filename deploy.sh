#!/bin/bash

# Get the latest release tag
LATEST_TAG=$(git describe --tags `git rev-list --tags --max-count=1`)
echo "Latest release tag: $LATEST_TAG"

# Checkout to the latest release tag (to ensure we're on the latest stable code)
git checkout $LATEST_TAG

# Build the Docker image
docker build -t python-webapp:$LATEST_TAG .

# Check if a container with the same name already exists, and remove it if so
EXISTING_CONTAINER=$(docker ps -a -q -f "name=python-webapp")
if [ ! -z "$EXISTING_CONTAINER" ]; then
    echo "Stopping and removing existing container..."
    docker stop python-webapp
    docker rm python-webapp
fi

# Run the new container, binding to port 5000
docker run -d --name python-webapp -p 5000:5000 python-webapp:$LATEST_TAG

# Print container IP address
CONTAINER_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' python-webapp)
echo "Container is running. Access it at: http://$CONTAINER_IP:5000"
