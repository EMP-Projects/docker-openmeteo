#!/bin/bash

# Get Source code
git clone https://github.com/open-meteo/open-meteo.git
cd open-meteo

# Build Docker image
docker build -t open-meteo .

# Create a Docker volume to store weather data
docker volume create --name open-meteo-data