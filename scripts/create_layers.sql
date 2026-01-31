/* BATTLE NOTE:
---------------------------------------------------------
Both Incidents and Greenways arrive as (Lat, Long).
They are flipped to (Long, Lat) so the North Carolina 
projection (EPSG:2264) places them in the 2-million 
range instead of the 150-million range.
---------------------------------------------------------
*/

INSTALL spatial;
LOAD spatial;

-- 1. Incident Points View (Added Flip)
CREATE OR REPLACE VIEW v_incident_points AS
SELECT 
    *,
    ST_Transform(ST_FlipCoordinates(ST_Point(longitude, latitude)), 'EPSG:4326', 'EPSG:2264') AS geom_point
FROM stg_incidents
WHERE latitude != 0 AND longitude != 0;

-- 2. Greenway Lines View
CREATE OR REPLACE VIEW v_greenway_lines AS
SELECT 
    *,
    ST_Transform(ST_FlipCoordinates(ST_GeomFromGeoJSON(geometry_raw)), 'EPSG:4326', 'EPSG:2264') AS geom_line
FROM stg_greenways;
