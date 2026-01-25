import duckdb
import os


con = duckdb.connect('greenway.db')

print("Initializing Database...")

con.execute("INSTALL spatial;")
con.execute("LOAD spatial;")

print("Ingesting Police Incidents...")
con.execute("""
    CREATE OR REPLACE TABLE raw_incidents AS 
    SELECT * FROM read_csv_auto('data/raleigh_incidents.csv');
""")


print("Ingesting Greenway Trails...")
con.execute("""
    CREATE OR REPLACE TABLE raw_greenways AS 
    SELECT * FROM ST_Read('data/greenway_trails.geojson');
""")

incident_count = con.execute("SELECT count(*) FROM raw_incidents").fetchone()[0]
greenway_count = con.execute("SELECT count(*) FROM raw_greenways").fetchone()[0]

print("Success!")
print(f"Total Incidents Loaded: {incident_count}")
print(f"Total Greenway Segments Loaded: {greenway_count}")

con.close()
