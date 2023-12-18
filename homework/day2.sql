use VOROBEVVP;
-- Create table
CREATE TABLE IF NOT EXISTS winemag (
line_id UInt32,
country String,
description String,
designation String, 
points UInt8,
price Decimal32(2),
province String,
region_1 String,
region_2 String,
taster_name String,
taster_twitter_handle String,
title String,
variety String,
winery String
) Engine = MergeTree()
order by line_id;
-- Load data to table (add line_id tag into file
-- clickhouse-client -h 127.0.0.1 -u default --pass qw123456 --format_csv_delimiter="," --query "insert into VOROBEVVP.winemag FORMAT CSV" < winemag-data-130k-v2.csv

-- найти максимальную цену для каждой страны
with max_price as (select country, max(price) as max_price
from VOROBEVVP.winemag w 
where country <> '' and price > 0.0
group by country)
-- вывести топ-10 стран с самыми дорогими винами (country, max_price)
select * from max_price
order by max_price DESC 
limit 10;
