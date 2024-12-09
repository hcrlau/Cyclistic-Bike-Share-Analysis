-- Combine all datasets into a single table contianing data from Nov 2023 to Oct 2024 --
CREATE TABLE `divvy_tripdata.tripdata_combined_data` AS (
  SELECT * FROM `earnest-math-437920-e1.divvy_tripdata.202311_tripdata`
  UNION ALL
  SELECT * FROM `earnest-math-437920-e1.divvy_tripdata.202312_tripdata`
  UNION ALL
  SELECT * FROM `earnest-math-437920-e1.divvy_tripdata.202401_tripdata`
  UNION ALL
  SELECT * FROM `earnest-math-437920-e1.divvy_tripdata.202402_tripdata`
  UNION ALL
  SELECT * FROM `earnest-math-437920-e1.divvy_tripdata.202403_tripdata`
  UNION ALL
  SELECT * FROM `earnest-math-437920-e1.divvy_tripdata.202404_tripdata`
  UNION ALL
  SELECT * FROM `earnest-math-437920-e1.divvy_tripdata.202405_tripdata_1`
  UNION ALL
  SELECT * FROM `earnest-math-437920-e1.divvy_tripdata.202405_tripdata_2`
  UNION ALL
  SELECT * FROM `earnest-math-437920-e1.divvy_tripdata.202406_tripdata_1`
  UNION ALL
  SELECT * FROM `earnest-math-437920-e1.divvy_tripdata.202406_tripdata_2`
  UNION ALL
  SELECT * FROM `earnest-math-437920-e1.divvy_tripdata.202407_tripdata_1`
  UNION ALL
  SELECT * FROM `earnest-math-437920-e1.divvy_tripdata.202407_tripdata_2`
  UNION ALL
  SELECT * FROM `earnest-math-437920-e1.divvy_tripdata.202408_tripdata_1`
  UNION ALL
  SELECT * FROM `earnest-math-437920-e1.divvy_tripdata.202408_tripdata_2`
  UNION ALL
  SELECT * FROM `earnest-math-437920-e1.divvy_tripdata.202409_tripdata_1`
  UNION ALL
  SELECT * FROM `earnest-math-437920-e1.divvy_tripdata.202409_tripdata_2`
  UNION ALL
  SELECT * FROM `earnest-math-437920-e1.divvy_tripdata.202410_tripdata_1`
  UNION ALL
  SELECT * FROM `earnest-math-437920-e1.divvy_tripdata.202410_tripdata_2`
);

 -- Since bigquery cannot upload files larger than 100kb, I separate those files in 1 and 2. --

 SELECT COUNT(*)
FROM `earnest-math-437920-e1.divvy_tripdata.tripdata_combined_data`

-- There are 5933712 rows in total. --