README.md
# Google Data Analytics Capstone Project: Cyclistic bike-share analysis

## Background

Cyclistic is a bike-share program that features more than 5,800 bicycles and 600 docking stations across Chicago. The service offers a variety of bike options, including traditional bikes, reclining bikes, hand tricycles, and cargo bikes, making it accessible to a diverse group of riders. Cyclistic's customer base is segmented into two groups: casual riders, who purchase single-ride or full-day passes, and annual members, who buy yearly memberships. While both groups use the service, Cyclistic's finance team has determined that annual members are significantly more profitable than casual riders. As such, the company aims to convert casual riders into annual members to drive long-term growth.

To support this objective, the Cyclistic marketing analytics team will analyze historical bike trip data to uncover patterns in rider behavior. This data will include ride frequency, duration, preferred bike types, and time of usage for both casual riders and annual members. The analysis will also explore potential factors that could influence a casual rider’s decision to purchase a membership, including the impact of pricing, promotions, and digital marketing efforts. By identifying these trends, the team aims to provide actionable insights that can guide Cyclistic’s marketing campaigns, ultimately increasing the conversion rate of casual riders to annual members and contributing to the company's long-term growth.

**Business Task** 

Analyze how annual members and casual riders use Cyclistic bikes differently to develop a targeted marketing strategy that encourages casual riders to convert to annual members, driving long-term growth for the company.


**Business question**

1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?


## The dataset

The analysis will be based on Cyclistic's historical trip data for the period from November 2023 to October 2024, provided by Motivate International Inc. under this [license](https://divvybikes.com/data-license-agreement).

Data Source: [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html) [accessed on 11/14/24]

The dataset contains 12 monthly files, named according to the format YYYYMM-divvy-tripdata, and contains the following features:

- ride_id: Unique identifier for each ride
- rideable_type: Type of bike used
- started_at: Start time of the ride
- ended_at: End time of the ride
- start_station_name: Name of the start station
- start_station_id: ID of the start station
- end_station_name: Name of the end station
- end_station_id: ID of the end station
- start_lat: Latitude of the start station
- start_lng: Longitude of the start station
- end_lat: Latitude of the end station
- end_lng: Longitude of the end station
- member_casual: Indicates if the rider is a member or causal

**SQL Queries:**

1. [Data Combining](https://github.com/hcrlau/Cyclistic-Bike-Share-Analysis/blob/main/Data%20Combining.sql)
2. [Data Exploration](https://github.com/hcrlau/Cyclistic-Bike-Share-Analysis/blob/main/Data%20Exploration.sql)
3. [Data Cleaning and Data Transformation](https://github.com/hcrlau/Cyclistic-Bike-Share-Analysis/blob/main/Data%20Cleaning%20and%20Data%20Transformation.sql)
4. [Data Analysis](https://github.com/hcrlau/Cyclistic-Bike-Share-Analysis/blob/main/Data%20Analysis.sql)

**Data Visualizations:** [Tableau](https://public.tableau.com/app/profile/rachelle.lau/viz/GoogleDataAnalyticsCapstoneProjectCyclisticbike-shareanalysis_17327728755180/Dashboard4)


### Processing the Data from Dirty to Clean
This project was conducted using BigQuery

**Data Exploration**
SQL Query: [Data Exploration](https://github.com/hcrlau/Cyclistic-Bike-Share-Analysis/blob/main/Data%20Exploration.sql)
1. Check the data types
![Image](screenshots/Datatype.png)

2. Find the null values in each variables
![Image](screenshots/null_values.png)

3. Check for duplicate ride_id rows and found a total of 211 duplicates.

4. Confirmed 3 unique rideable types.
![Image](screenshots/rideable_type.png)

5. There are 1079270 null entries in the start_station_name and start_station_id columns, and 1112056 null entries in the end_station_name and end_station_id columns. These rows should be removed to ensure data integrity.

6. There are 7,417 rows with missing coordinate data in the start_lat, start_lng, end_lat, or end_lng columns. These rows should be removed.

7. Confirmed 2 rider type.
![Image](screenshots/member_casual.png)


**Data Cleaning and Data Transformation**
SQL Query: [Data Cleaning and Data Transformation](https://github.com/hcrlau/Cyclistic-Bike-Share-Analysis/blob/main/Data%20Cleaning%20and%20Data%20Transformation.sql)

1. Removed duplicate ride_id.

2. Removed rows with missing data.

3. Added calculated columns for ride length, day of week, and month.

4. Filtered out rides with durations outside of 1 minute and 1 day.

5. Resulting in 4,153,478 rows of clean data, with 1,780,234 rows removed to prevent skewed results.


**Data Analysis**
SQL Query: [Data Analysis](https://github.com/hcrlau/Cyclistic-Bike-Share-Analysis/blob/main/Data%20Analysis.sql)

1. Summarize bike usage patterns based on factors such as bike type and rider type (member or casual) 

2. Calculated the total number of rides for different bike types, month, days of the week, hours of the day.

3. Examined average ride lengths based on rider type, month, day, and hour. 

4. Analyzed ride frequency during peak and off-peak hours, as well as the most frequent start and end stations, to uncover trends in rider behavior.



### Answers to Business Questions Based on Visualizations
Data Visualization: [Tableau](https://public.tableau.com/app/profile/rachelle.lau/viz/GoogleDataAnalyticsCapstoneProjectCyclisticbike-shareanalysis_17327728755180/Dashboard4)

**1. How do annual members and casual riders use Cyclistic bikes differently?**

- ***Bike Preferences:*** Both annual member and casual riders prefer classic bikes, but members typically use them for shorter, more utilitarian trips (average ride length: 13 minutes), whereas casual riders often opt for longer rides (28 minutes).

- ***Temporal Patterns:*** 
  - By Month: Annual members ride consistently year-round, , likely due to daily commuting. Peaks in spring and fall, aligning with back-to-school or work-related activity. Casual riders are more active during summer (May to September) for leisure or tourism, with lower usage in colder months.

  - By Day: Annual members have higher ride frequency on weekdays, indicating regular work commutes. Casual riders ride more on weekends, suggesting leisure or recreational use.

  - By Hour: Annual members ride mostly during 7-9 AM and 4-6 PM, aligning with commuting patterns. Casual riders peak around midday to afternoon, likely for leisure or tourism activities.


- ***Geographic Patterns:*** Annual members focus on commuting routes between residential and business areas (e.g., State St & 33rd St to Calumet Ave & 33rd St), while casual riders frequently use tourist-friendly and scenic locations like Streeter Dr & Grand Ave and DuSable Lake Shore Dr & Monroe St.

- ***Top Routes:*** Casual riders dominate the most popular routes during both peak and off-peak hours, with high usage concentrated in recreational and tourist zones.


**2. Why would casual riders buy Cyclistic annual memberships?**

- ***Cost Savings:*** Casual riders who frequently use the same routes (e.g., Streeter Dr & Grand Ave or DuSable Lake Shore Dr & Monroe St) for leisure, can save significantly with membership plans.

- ***Convenience:*** Membership could appeal to riders seeking greater flexibility and unlimited access, offering lower costs per ride and making it ideal for those who take multiple rides or enjoy extended leisure trips.

- ***Promotions and Benefits:*** Offering incentives like discounts for memberships at high-traffic casual stations or during popular leisure times (e.g., weekends), along with exclusive perks such as priority access to bikes during peak hours, discounted rates for friends and family, or invitations to member-only events, can encourage casual riders to switch to memberships.


**3. How can Cyclistic use digital media to influence casual riders to become members?**

- ***Targeted Advertising:*** Use geo-targeted ads near high-frequency casual rider stations (e.g., Streeter Dr & Grand Ave) and during popular riding times (weekends or midday hours) to highlight membership benefits like unlimited rides and cost savings.

- ***Personalized Offers:*** Leverage ride data to send personalized email or app-based promotions to frequent casual riders, showcasing cost savings and membership perks tailored to their usage patterns.

- ***Engaging Content:*** Utilize social media platforms like Instagram and Facebook, as well as email campaigns, to promote testimonials from members who transitioned from casual riders, highlighting the benefits they have experienced.