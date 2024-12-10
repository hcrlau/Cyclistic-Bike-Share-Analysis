-- 1. Check the length of ride_id --

SELECT LENGTH(ride_id), COUNT(*) AS count
FROM `earnest-math-437920-e1.divvy_tripdata.tripdata_combined_data`
GROUP BY LENGTH(ride_id);
-- All ride_id have l6 characters. --


-- Check for duplicate ride_id rows --

SELECT (COUNT(*) - COUNT(DISTINCT ride_id)) AS total_duplicate_rows
FROM `earnest-math-437920-e1.divvy_tripdata.tripdata_combined_data`;
-- Found 211 duplicate rows. --


-- 2. Verify unique rideable_type --

SELECT DISTINCT rideable_type, COUNT(rideable_type) AS number_of_trips
FROM `earnest-math-437920-e1.divvy_tripdata.tripdata_combined_data`
GROUP BY rideable_type;
-- Confirmed 3 unique rideable_type. --


-- 3. Validate ride durations in started_at and ended_at columns --

-- Count rides shorter than 1 minute --
SELECT COUNT(*) AS  short_rides
FROM `earnest-math-437920-e1.divvy_tripdata.tripdata_combined_data`
WHERE TIMESTAMP_DIFF(ended_at, started_at, MINUTE) <= 1;
-- 247115 rides have a duration shorter than 1 minute. --

-- Count rides longer than 1 day --
SELECT COUNT(*) AS long_rides
FROM `earnest-math-437920-e1.divvy_tripdata.tripdata_combined_data`   
WHERE TIMESTAMP_DIFF(ended_at, started_at, MINUTE) >= 1440;
-- 7801 rides have a duration longer than 1 day. --

-- 4. Check start_station_name, start_station_id, end_station_name, end_station_id --

-- Count null values in start_station_name and start_station_id
SELECT start_station_name, COUNT(*)
FROM `earnest-math-437920-e1.divvy_tripdata.tripdata_combined_data`
GROUP BY start_station_name
ORDER BY start_station_name;
-- There are 1079270 null values in start_station_name and start_station_id. --

-- Count null values in end_station_name and end_station_id
SELECT end_station_name, COUNT(*)
FROM `earnest-math-437920-e1.divvy_tripdata.tripdata_combined_data`
GROUP BY end_station_name
ORDER BY end_station_name;
-- There are 1112056 null values in end_station_name and end_station_id. --

-- Count rides with null station data by rideable type --
SELECT rideable_type, COUNT(*) AS num_of_rides
FROM `earnest-math-437920-e1.divvy_tripdata.tripdata_combined_data`
WHERE (start_station_name IS NULL OR
   start_station_id IS NULL OR
   end_station_name IS NULL OR
   end_station_id IS NULL)
   AND rideable_type IN ('electric_bike', 'electric_scooter', 'classic_bike')
GROUP BY rideable_type;
/* Electric bikes: 1,555,846 rides with null station data.
Electric scooters: 96,510 rides.
Classic bikes: 7,807 rides. */ 


-- 5. Check for start_lat, start_lng, end_lat, end_lng --

SELECT *
FROM `earnest-math-437920-e1.divvy_tripdata.tripdata_combined_data`
WHERE start_lat IS NULL OR
   start_lng IS NULL OR
   end_lat IS NULL OR
   end_lng IS NULL;
-- 7417 rows have missing coordinate data.


-- 6. Check member_casual column --

SELECT DISTINCT member_casual, COUNT(member_casual) AS no_of_trips
FROM `earnest-math-437920-e1.divvy_tripdata.tripdata_combined_data`
GROUP BY member_casual;
-- Confirmed 2 unique types with no null values--
