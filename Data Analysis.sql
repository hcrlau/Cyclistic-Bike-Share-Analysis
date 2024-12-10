-- Bike Types Summary --

SELECT rideable_type, member_casual, COUNT(*) AS total_rides
FROM `earnest-math-437920-e1.divvy_tripdata.cleaned_combined_data`
GROUP BY rideable_type, member_casual
ORDER BY member_casual, total_rides DESC;
/* Both casual and member riders favor classic bikes, which have the highest total rides, while electric scooters are the least used. */


-- Rides per Month --

SELECT member_casual, month, COUNT(*) AS total_rides
FROM `earnest-math-437920-e1.divvy_tripdata.cleaned_combined_data`
GROUP BY member_casual, month
ORDER BY member_casual, total_rides DESC;
/* Member riders peak in September (312879 rides) and lowest in January (90781 rides), while casual riders see the highest activity in July (227684 rides) and the lowest in January (17108 rides). These patterns highlight a strong preference for riding during the warmer months. */


-- Rides per Day of week --

SELECT member_casual, day_of_week, COUNT(*) AS total_rides
FROM `earnest-math-437920-e1.divvy_tripdata.cleaned_combined_data`
GROUP BY member_casual, day_of_week
ORDER BY member_casual, total_rides DESC;
/* Casual riders are most active on Saturdays (312104 rides), while member riders reach their peak on Wednesdays (449282 rides). 
Casual riders prefer weekends, while member riders show higher activity on weekdays. */


-- Rides per Hour --

SELECT member_casual, EXTRACT(hour FROM started_at) AS hour_of_day, COUNT(*) AS total_rides
FROM `earnest-math-437920-e1.divvy_tripdata.cleaned_combined_data`
GROUP BY member_casual, hour_of_day
ORDER BY member_casual, total_rides DESC;
/* Both member and casual riders are most active at 17:00, with 292359 rides for members and 145342 rides for casual riders. */


-- Average Ride Length per Rider Type --

SELECT member_casual, ROUND(AVG(ride_length),0) AS average_ride_length
FROM `earnest-math-437920-e1.divvy_tripdata.cleaned_combined_data`
GROUP BY member_casual;
/* Casual riders have a significantly longer average ride length (24 minutes) compared to member riders (12 minutes). */


-- Average Ride Length per Rideable Type --

SELECT member_casual, rideable_type, ROUND(AVG(ride_length),0) AS average_ride_length
FROM `earnest-math-437920-e1.divvy_tripdata.cleaned_combined_data`
GROUP BY member_casual, rideable_type;
/* Casual riders have the longest average ride length on classic bikes (29 minutes) and the shortest on electric scooters (11 minutes). 
Member riders show shorter durations overall, ranging from 8 minutes on electric scooters to 13 minutes on classic bikes. */


-- Average Ride Length per Month --

SELECT member_casual, month, ROUND(AVG(ride_length),0) AS average_ride_length
FROM `earnest-math-437920-e1.divvy_tripdata.cleaned_combined_data`
GROUP BY member_casual, month
ORDER BY month, member_casual;
/* Casual riders consistently have longer average ride lengths across all months, ranging from 15 minutes (January) to 27 minutes (May), compared to member riders, whose average ride lengths remain relatively stable between 11 minutes (March, November, and December) and 13 minutes (July, August, and May). */


-- Average Ride Length per Day --

SELECT member_casual, day_of_week, ROUND(AVG(ride_length),0) AS average_ride_length
FROM `earnest-math-437920-e1.divvy_tripdata.cleaned_combined_data`
GROUP BY member_casual, day_of_week
ORDER BY day_of_week, member_casual;
/* Casual riders average the longest rides on Sundays (28 minutes), while member riders have shorter, consistent durations, peaking at 14 minutes on weekends. */


-- Average Ride Length per Hour --

SELECT member_casual, EXTRACT(hour FROM started_at) AS hour_of_day, ROUND(AVG(ride_length),0) AS average_ride_length
FROM `earnest-math-437920-e1.divvy_tripdata.cleaned_combined_data`
GROUP BY member_casual, hour_of_day
ORDER BY hour_of_day, member_casual;
/* Casual riders consistently have longer average ride lengths throughout the day, with the highest at 10:00 (29 minutes) and 11:00 (29 minutes), while member riders maintain shorter, steady durations around 12-13 minutes across all hours. */


-- Ride Frequency per Start Station --

SELECT member_casual, start_station_name, COUNT(*) AS total_rides
FROM `earnest-math-437920-e1.divvy_tripdata.cleaned_combined_data`
GROUP BY start_station_name, member_casual
ORDER BY total_rides DESC;
/* Casual riders frequently start at Streeter Dr & Grand Ave (47038 rides), while member riders prefer Kingsbury St & Kinzie St (26104 rides).  */


-- Ride Frequency per End Station --

SELECT member_casual, end_station_name, COUNT(*) AS total_rides
FROM `earnest-math-437920-e1.divvy_tripdata.cleaned_combined_data`
GROUP BY end_station_name, member_casual
ORDER BY total_rides DESC;
/* Streeter Dr & Grand Ave is the most frequent end station for casual riders (51043 rides) and Kingsbury St & Kinzie St for member riders (25929 rides). */


-- Ride frequency by Start and End Station Pair --

SELECT member_casual, start_station_name, end_station_name, COUNT(*) AS total_rides
FROM `earnest-math-437920-e1.divvy_tripdata.cleaned_combined_data`
GROUP BY start_station_name, end_station_name, member_casual
ORDER BY total_rides DESC;
/* The most common route for casual riders is between "Streeter Dr & Grand Ave" and itself (7730 rides), while member riders frequently travel between "State St & 33rd St" and "Calumet Ave & 33rd St" (5764 rides). */


-- Ride Frequency During Peak Hours --

SELECT member_casual, start_station_name, end_station_name, EXTRACT(hour FROM started_at) AS hour_of_day, COUNT(*) AS total_rides
FROM `earnest-math-437920-e1.divvy_tripdata.cleaned_combined_data`
WHERE (EXTRACT(hour FROM started_at) BETWEEN 6 AND 9)
   OR (EXTRACT(hour FROM started_at) BETWEEN 16 AND 19)
GROUP BY start_station_name, end_station_name, member_casual, hour_of_day
ORDER BY total_rides DESC;
/* During peak hours, casual riders dominate with seven of the top 10 routes starting or ending at Streeter Dr & Grand Ave or DuSable Lake Shore Dr & Monroe St. */


-- Ride Frequency During Off-Peak Hours --

SELECT member_casual, start_station_name, end_station_name, EXTRACT(hour FROM started_at) AS hour_of_day, COUNT(*) AS total_rides
FROM `earnest-math-437920-e1.divvy_tripdata.cleaned_combined_data`
WHERE (EXTRACT(hour FROM started_at) NOT BETWEEN 6 AND 9)
   OR (EXTRACT(hour FROM started_at) NOT BETWEEN 16 AND 19)
GROUP BY start_station_name, end_station_name, member_casual, hour_of_day
ORDER BY total_rides DESC;
/* Streeter Dr & Grand Ave remains the most popular station during off-peak hours, with casual riders showing significantly higher usage, especially between 12 PM and 5 PM.  */