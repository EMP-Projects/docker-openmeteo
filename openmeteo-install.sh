#!/bin/bash

# -----------------------------------
# Install Open-Meteo-API
sudo echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/openmeteo-archive-keyring.gpg] https://apt.open-meteo.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/openmeteo-api.list
sudo gpg --keyserver hkps://keys.openpgp.org --no-default-keyring --keyring /usr/share/keyrings/openmeteo-archive-keyring.gpg  --recv-keys E6D9BD390F8226AE

sudo apt update
sudo apt install -y openmeteo-api

# Download the latest ECMWF IFS 0.4° open-data forecast for temperature (50 MB)
sudo chown -R $(id -u):$(id -g) /var/lib/openmeteo-api
cd /var/lib/openmeteo-api
openmeteo-api sync ncep_gfs013,copernicus_era5,copernicus_dem90,cams_europe temperature_2m,precipitation,carbon_monoxide,nitrogen_dioxide,ozone,pm10,pm2_5

sudo systemctl status openmeteo-api
sudo systemctl restart openmeteo-api
sudo journalctl -u openmeteo-api.service