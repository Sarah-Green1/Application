
-- This is a query with a join to find out how many guests are on the slope at 6:00pm-8:00pm.

SELECT COUNT(DISTINCT Guests.Guest_ID) AS NumberOfGuests
FROM Bookings
JOIN Guests ON Bookings.Guest_ID = Guests.Guest_ID
WHERE Bookings.Slope_ID = 1
    AND Bookings.Start_time <= '20:00'
    AND Bookings.End_time >= '18:00'
    AND Bookings.Day = 'Sunday';
    
-- A view with joins for booking details for the week

CREATE VIEW Booking_details AS
SELECT 
Bookings.Booking_ID,
Bookings.Week,
Bookings.Day,
CONCAT(Guests.G_First_name, ' ', Guests.G_Last_name) AS Guest_full_name,
CONCAT(Instructors.I_First_name, ' ', Instructors.I_Last_name) AS Instructor_full_name,
Bookings.Booking_type,
Bookings.Start_time,
Bookings.End_time,
Bookings.Price
FROM Bookings
JOIN Guests ON Bookings.Guest_ID = Guests.Guest_ID
JOIN Instructors ON Bookings.Instructor_ID = Instructors.Instructor_ID
ORDER BY Bookings.Booking_ID;

SELECT * FROM Booking_details;

SELECT *
FROM Booking_details
WHERE Week = 1;

-- Creating a stored function which finds the weekly revenue.

DELIMITER //

CREATE FUNCTION Weekly_revenue(Week_number INT) RETURNS DECIMAL(10, 2)
READS SQL DATA
BEGIN
DECLARE Weekly_revenue DECIMAL(10, 2);

SELECT COALESCE(SUM(Price), 0.00) INTO Weekly_revenue
FROM Bookings
WHERE Week = Week_number;

RETURN Weekly_revenue;
END //

DELIMITER ;

-- The function in a query

SELECT 
Week,
Weekly_revenue(1) AS Weekly_revenue
FROM Bookings
GROUP BY Week;

-- Example of a query with a subquery.
-- Query to find the total earnings of each instructor.

SELECT
Instructor_ID,
I_First_name,
I_Last_name,
Total_earnings,
RANK() OVER (ORDER BY Total_earnings DESC) AS Earnings_rank
FROM (
SELECT
B.Instructor_ID,
I.I_First_name,
I.I_Last_name,
SUM(B.Price) AS Total_earnings
FROM
Bookings B
JOIN
Instructors I ON B.Instructor_ID = I.Instructor_ID
GROUP BY
B.Instructor_ID
) AS Instructor_earnings;

-- This is a query which uses joins and grouping to get the days each instructor works.

SELECT
I.Instructor_ID,
I.I_First_name,
I.I_Last_name,
GROUP_CONCAT(DISTINCT B.Day) AS Working_days
FROM
Instructors I
LEFT JOIN
Bookings B ON I.Instructor_ID = B.Instructor_ID
GROUP BY
I.Instructor_ID, I.I_First_name, I.I_Last_name
ORDER BY
I.Instructor_ID;
    
-- View that uses 4 tables showing the location of the booking.

CREATE VIEW Booking_locations AS
SELECT
CONCAT(Guests.G_First_name, ' ', Guests.G_Last_name) AS Guest_full_name,
CONCAT(Instructors.I_First_name, ' ', Instructors.I_Last_name) AS Instructor_full_name,
Bookings.Booking_type,
Bookings.Day,
Bookings.Week,
Bookings.Start_time,
Bookings.End_time,
Slopes.Slope_name
FROM Bookings
JOIN Guests ON Bookings.Guest_ID = Guests.Guest_ID
JOIN Instructors ON Bookings.Instructor_ID = Instructors.Instructor_ID
JOIN Slopes ON Bookings.Slope_ID = Slopes.Slope_ID;

SELECT * 
FROM Booking_locations
ORDER BY Slope_name;


SHOW TABLES;
