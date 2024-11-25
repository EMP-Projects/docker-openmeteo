#!/bin/bash

# Start the API service on http://127.0.0.1:8080
docker run -d --rm -v open-meteo-data:/app/data -p 8080:8080 open-meteo

# Download airquality data
docker run -it --rm -v open-meteo-data:/app/data open-meteo sync ncep_gfs013,copernicus_era5,copernicus_dem90,cams_europe temperature_2m,precipitation,carbon_monoxide,nitrogen_dioxide,ozone,pm10,pm2_5