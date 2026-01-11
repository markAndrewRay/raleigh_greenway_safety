{{ config(
    materialized='view',
    pre_hook="INSTALL spatial; LOAD spatial;"
) }}

with source as (
    select * from st_read('/workspaces/raleigh_greenway_safety/data/raleigh_greenways.geojson')
)

select
    OBJECTID as object_id,
    LOCATION as trail_name,
    TYPE as segment_type,
    STATUS as status,
    geom as geometry 
from source