with raw_incidents as (
    select * from read_csv_auto('https://data-ral.opendata.arcgis.com/datasets/ral::raleigh-police-incidents-nibrs.csv')
)

select * from raw_incidents