with raw_incidents as (
    select * from read_csv_auto('{{ var("data_path") }}/raleigh_incidents.csv')
)

select * from raw_incidents