/* BATTLE NOTE:
---------------------------------------------------------
Finalizing the Coordinate Flip. 
Using ST_FlipCoordinates to ensure Longitude (X) 
and Latitude (Y) are in the correct order for NC.
---------------------------------------------------------
*/

INSTALL spatial;
LOAD spatial;

-- 1. Incident Points View
CREATE OR REPLACE VIEW v_incident_points AS
SELECT 
    *,
    ST_Transform(ST_Point(longitude, latitude), 'EPSG:4326', 'EPSG:2264') AS geom_point
FROM stg_incidents
WHERE latitude != 0 AND longitude != 0;

-- 2. Greenway Lines View
CREATE OR REPLACE VIEW v_greenway_lines AS
SELECT 
    *,
    ST_Transform(ST_FlipCoordinates(ST_GeomFromGeoJSON(geometry_raw)), 'EPSG:4326', 'EPSG:2264') AS geom_line
FROM stg_greenways;
