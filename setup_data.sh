#!/bin/bash

mkdir -p data

echo "Downloading Greenway GeoJSON..."
curl -L -o data/raleigh_greenways.geojson "https://data-ral.opendata.arcgis.com/datasets/ral::raleigh-greenway-trails.geojson"

echo "Downloading Raleigh Incidents (155MB)..."
curl -L -o data/raleigh_incidents.csv "https://data-ral.opendata.arcgis.com/datasets/ral::raleigh-police-incidents-nibrs.csv"

echo "Data setup complete! You are ready to run dbt."