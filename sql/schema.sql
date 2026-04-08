CREATE DATABASE delhi_metro;

USE delhi_metro;

CREATE TABLE metro_trips(
	TripID INT PRIMARY KEY,
    Date DATE,
    From_Station VARCHAR(100),
    To_Station VARCHAR(100),
    Distance_km DECIMAL(6,2),
    Fare DECIMAL(10,2),
    Cost_per_passenger DECIMAL(10,2),
    Passengers INT,
    Ticket_Type VARCHAR(50),
    Remarks  VARCHAR(100)
);

SELECT * FROM metro_trips;

#DROP TABLE metro_trips;