#!/bin/bash
set -e

echo "Starting Enterprise Data Bootstrap with Direct Links..."
mkdir -p data

INCIDENTS_URL="https://stg-arcgisazurecdataprod.az.arcgis.com/exportfiles-370-6155/Police_Incidents_-6034818725242524985.csv?sv=2025-05-05&st=2026-01-24T01%3A43%3A30Z&se=2026-01-24T02%3A48%3A30Z&sr=c&sp=r&sig=T%2Bo%2Bdal3Ha%2Fut0THFIbHtx9r4fqJhRYETot3ZJA2QqE%3D"
GREENWAY_URL="https://stg-arcgisazurecdataprod.az.arcgis.com/exportfiles-370-6695/Greenway_Trails_All_-4032572195167761375.geojson?sv=2025-05-05&st=2026-01-24T01%3A44%3A34Z&se=2026-01-24T02%3A49%3A34Z&sr=c&sp=r&sig=8LXCQkxgHzEQb8omt7CgeopcYolp9U0jSHM4%2FgWjmFA%3D"

echo "Downloading Greenway Trails (GeoJSON)..."
curl -L "$GREENWAY_URL" -o data/greenway_trails.geojson

echo "Downloading Police Incidents (CSV)..."
curl -L "$INCIDENTS_URL" -o data/raleigh_incidents.csv

echo "Verifying files..."
if [ -f "data/greenway_trails.geojson" ] && [ -f "data/raleigh_incidents.csv" ]; then
    echo "SUCCESS: Data files are present."
    echo "File Sizes:"
    du -h data/*
else
    echo "ERROR: Download failed."
    exit 1
fi
