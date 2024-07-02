SELECT b.payment_type_name, SUM(a.tip_amount)  FROM `global-terrain-404601.uber_data_engineering.fact_table` a
JOIN `global-terrain-404601.uber_data_engineering.payment_type_dim` b
ON a.payment_type_id = b.payment_type_id
GROUP BY b.payment_type_name;

SELECT a.pickup_location_id, COUNT(b.trip_distance_id) AS Number_of_trips FROM `global-terrain-404601.uber_data_engineering.pickup_location_dim` a
JOIN `global-terrain-404601.uber_data_engineering.trip_distance_dim` b
ON a.pickup_location_id = b.trip_distance_id
GROUP BY a.pickup_location_id LIMIT 10;

SELECT a.passenger_count, SUM(b.trip_distance_id) AS Total_trips FROM `global-terrain-404601.uber_data_engineering.passenger_count_dim` a   
JOIN `global-terrain-404601.uber_data_engineering.trip_distance_dim` b   
ON a.passenger_count_id = b.trip_distance_id
GROUP BY a.passenger_count;

SELECT b.pick_hour AS Hour_of_day, AVG(a.fare_amount) AS Average_amount FROM `global-terrain-404601.uber_data_engineering.fact_table` a
JOIN `global-terrain-404601.uber_data_engineering.datetime_dim` b  
ON a.datetime_id = b.datetime_id
GROUP BY b.pick_hour
ORDER BY b.pick_hour ASC;

CREATE OR REPLACE TABLE `global-terrain-404601.uber_data_engineering.tbl_analytics` AS (
SELECT 
f.VendorID,
d.tpep_dropoff_datetime,
d.tpep_pickup_datetime,
p.passenger_count,
t.trip_distance,
r.rate_code_name,
pick.pickup_latitude,
pick.pickup_longitude, 
a.dropoff_latitude, 
a.dropoff_longitude,
pay.payment_type_name,
f.fare_amount,
f.extra,
f.mta_tax,
f.tip_amount,
f.tolls_amount,
f.improvement_surcharge,
f.total_amount
FROM 
`global-terrain-404601.uber_data_engineering.fact_table` f
JOIN `global-terrain-404601.uber_data_engineering.datetime_dim` d      
ON f.datetime_id = d.datetime_id
JOIN `global-terrain-404601.uber_data_engineering.passenger_count_dim` p
ON p.passenger_count_id = f.passenger_count_id
JOIN `global-terrain-404601.uber_data_engineering.trip_distance_dim` t  
ON t.trip_distance_id = f.trip_distance_id
JOIN `global-terrain-404601.uber_data_engineering.rate_code_dim` r 
ON r.rate_code_id = f.rate_code_id
JOIN `global-terrain-404601.uber_data_engineering.pickup_location_dim` pick  
ON pick.pickup_location_id = f.pickup_location_id
JOIN `global-terrain-404601.uber_data_engineering.dropoff_location_dim` a
ON a.dropoff_location_id = f.dropoff_location_id
JOIN `global-terrain-404601.uber_data_engineering.payment_type_dim` pay  
ON pay.payment_type_id = f.payment_type_id)
