USE delhi_metro;

SELECT * FROM metro_trips;

################-----------Route Analysis-----------################
# 1. Which metro routes have the highest passenger traffic?
SELECT From_Station, To_Station, SUM(Passengers) as total_passengers
FROM metro_trips
GROUP BY From_Station, To_Station
ORDER BY total_passengers DESC; 

# 2. Which routes generate the highest total revenue?
SELECT From_Station, To_Station, SUM(Fare) as total_fare
FROM metro_trips
GROUP BY From_Station, To_Station
ORDER BY total_fare DESC;

# 3. What is the average fare for each route?
SELECT From_Station, To_Station, AVG(Fare) as average_fare
FROM metro_trips
GROUP BY From_Station, To_Station
ORDER BY average_fare DESC;

# 4. Which routes have the longest travel distances?
SELECT From_Station, To_Station, MAX(Distance_km) as distance
FROM metro_trips
GROUP BY From_Station, To_Station
ORDER BY distance DESC;

################-----------Station Analysis-----------################
# 5. Which stations have the highest number of trip departures? --- departure means trains leaves from_station
SELECT From_Station, COUNT(*) as train_departure_count
FROM metro_trips
GROUP BY From_Station
ORDER BY train_departure_count DESC;

# 6. Which stations receive the highest number of passengers? -- receive means to_station 
SELECT To_Station, SUM(Passengers) as passenger_count
FROM metro_trips
GROUP BY To_Station
ORDER BY passenger_count DESC;

# 7. What are the top 10 most frequently used metro stations?
SELECT From_Station, COUNT(*) as station_count
FROM metro_trips
GROUP BY From_Station
ORDER BY station_count DESC
LIMIT 10;

# 8. Which station pairs are most frequently used for travel?
SELECT From_Station, To_Station, COUNT(*) as trip_count
FROM metro_trips
GROUP BY From_Station, To_Station
ORDER BY trip_count DESC;

################-----------Revenue Analysis-----------################
# 9. What is the total revenue generated from all trips?
SELECT SUM(Fare) as total_revenue
FROM metro_trips;

# 10. What is the average fare per trip?
SELECT AVG(Fare) as average_fare
FROM metro_trips;

# 11. Which routes generate the highest revenue per kilometer?
SELECT From_Station, To_Station, SUM(Fare)/SUM(Distance_km) as fare_per_km
FROM metro_trips
GROUP BY From_Station, To_Station
ORDER BY fare_per_km DESC;

# 12. Which ticket type generates the highest revenue?
SELECT Ticket_Type, SUM(Fare) as total_revenue
FROM metro_trips
GROUP BY Ticket_Type
ORDER BY total_revenue DESC;

################-----------Passenger Analysis-----------##############
# 13. What is the average number of passengers per trip?
SELECT AVG(Passengers) as average_passengers
FROM metro_trips;

# 14. Which trips recorded the highest passenger counts?
SELECT TripID, From_Station, To_Station, Passengers
FROM metro_trips
ORDER BY Passengers DESC;

# 15. What is the passenger distribution by ticket type?
SELECT Ticket_Type, SUM(Passengers) as total_Passengers
FROM metro_trips
GROUP BY Ticket_Type;

# 16. What is the total passenger count for each station?
SELECT From_Station as Station, SUM(Passengers) as total_Passengers
FROM metro_trips
GROUP BY From_Station;

################-----------Travel Pattern Analysis-----------#########
# 17. How many trips occur during peak, off-peak, festival, and weekend conditions?
SELECT Remarks, COUNT(*) as trips_count
FROM metro_trips
WHERE Remarks IN ('Peak', 'Off-peak', 'Festival', 'Weekend')
GROUP BY Remarks
ORDER BY trips_count DESC;

# 18. Which travel condition generates the highest revenue?
SELECT Remarks, SUM(Fare) as total_revenue
FROM metro_trips
GROUP BY Remarks
ORDEr BY total_revenue DESC;

# 19. What is the monthly passenger trend across the dataset?
SELECT MONTH(Date) AS month, SUM(Passengers) AS total_passengers
FROM metro_trips
GROUP BY month
ORDER BY month;

# 20. Which travel condition has the highest average passenger count per trip?
SELECT Remarks, AVG(Passengers) AS avg_passengers
FROM metro_trips
GROUP BY Remarks
ORDER BY avg_passengers DESC;