LOAD spatial;

CREATE OR REPLACE TABLE analysis_greenway_incidents AS
SELECT 
    g.greenway_name,
    i.*
FROM v_incident_points i
JOIN v_greenway_lines g 
  ON ST_DWithin(i.geom_point, g.geom_line, 50);
