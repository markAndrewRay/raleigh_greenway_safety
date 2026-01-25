/* STAGING SCRIPT: Raleigh Incidents (CSV)
---------------------------------------
BATTLE NOTE: 
This script uses read_csv_auto() with specific column names discovered via 
raw inspection after multiple "Binder Errors." 

KEY FINDINGS:
1. Column Count: The file claims 17 columns but the sniffer detects 23. 
   'null_padding=True' is mandatory to prevent crashes.
2. Naming: DuckDB's sniffer normalizes "Crime Category" to "Crime_Category" 
   (underscore) but keeps "Case Number" (space). We match that exactly here.
3. Casting: We manually cast Date/Lat/Long to ensure they aren't stored 
   as useless text strings.
*/

DROP TABLE IF EXISTS stg_incidents;

CREATE TABLE stg_incidents AS 
SELECT 
    "OBJECTID"::INTEGER AS object_id,
    "GlobalID" AS global_id,
    "Case Number" AS case_number,
    -- Using the names DuckDB just proved it can see:
    "Crime_Category" AS crime_category,
    "Crime Description" AS crime_description,
    "District" AS district,
    -- We'll use the date column that appeared in your preview
    "Reported Date"::TIMESTAMP AS reported_at,
    "Latitude"::DOUBLE AS latitude,
    "Longitude"::DOUBLE AS longitude
FROM read_csv_auto(
    'data/cleaned_incidents.csv',
    ignore_errors=True,
    null_padding=True
);