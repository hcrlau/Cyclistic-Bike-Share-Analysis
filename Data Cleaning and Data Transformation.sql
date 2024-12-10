-- Create new table and remove duplicate rows --
-- Add calculated columns: ride_length, day_of_week, and month --

CREATE TABLE IF NOT EXISTS
`earnest-math-437920-e1.divvy_tripdata.cleaned_combined_data` AS
WITH CleanedData AS (
    SELECT *, 
          -- Calculate the ride length (duration) in minutes --
          TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS ride_length,

          -- Extract day og the week and month --
          format_date('%A', started_at) AS day_of_week,
          format_date('%B', started_at) AS month,

          -- Assign a row number to identify duplicates --
          ROW_NUMBER() OVER (PARTITION BY ride_id ORDER BY started_at DESC) AS row_num

FROM `earnest-math-437920-e1.divvy_tripdata.tripdata_combined_data`
WHERE start_station_name IS NOT NULL 
    AND start_station_id IS NOT NULL 
    AND end_station_name IS NOT NULL 
    AND end_station_id IS NOT NULL
    AND end_lat IS NOT NULL 
    AND end_lng IS NOT NULL 
    -- Filter ride_length between 1 minute and 1 day --
    AND TIMESTAMP_DIFF(ended_at, started_at, MINUTE) > 1 
    AND TIMESTAMP_DIFF(ended_at, started_at, MINUTE) < 1440
)

-- Select the cleaned data --

SELECT ride_id,
    rideable_type,
    started_at,
    ended_at,
    ride_length,
    day_of_week,
    month,
    start_station_name,
    end_station_name,
    start_lat,
    start_lng,
    end_lat,
    end_lng,
    member_casual
FROM CleanedData
WHERE row_num = 1;  -- remove duplicates --
-- The cleaned table contains 4,153,478 rows of data, with 1,780,234 rows removed to prevent skewed results. --