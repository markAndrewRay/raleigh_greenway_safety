DROP TABLE IF EXISTS stg_greenways;

CREATE TABLE stg_greenways AS 
SELECT 
    prop.OBJECTID AS object_id,
    prop.GlobalID AS global_id,
    prop.TRAIL_NAME AS greenway_name,
    prop.STATUS AS status,
    prop.TYPE AS trail_type,
    prop.WIDTH_FT AS width,
    prop.MATERIAL AS surface,
    prop.MAP_MILES AS miles,
    feat.geometry AS geometry_raw
FROM (
    SELECT unnest(features) AS feat 
    FROM read_json_auto('data/greenway_trails.geojson')
) AS unnested_data,
LATERAL (SELECT feat.properties AS prop);
