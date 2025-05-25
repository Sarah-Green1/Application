-- Creating the database.
CREATE DATABASE IF NOT EXISTS Snowsports_Venue1;

-- Creating the tables, showing primary and foreign keys.
CREATE TABLE IF NOT EXISTS Guests (
    Guest_ID INT PRIMARY KEY,
    G_First_name VARCHAR(30),
    G_Last_name VARCHAR(30),
    Age INT
);
CREATE TABLE IF NOT EXISTS Instructors (
    Instructor_ID INT PRIMARY KEY,
    I_First_name VARCHAR(30),
    I_Last_name VARCHAR(30),
    Qualification_Ski INT,
    Qualification_Board INT
);
CREATE TABLE IF NOT EXISTS Bookings (
    Booking_ID INT PRIMARY KEY,
    Booking_type VARCHAR(50),
    Guest_ID INT,
    Instructor_ID INT,
    Start_time TIME,
    End_time TIME,
    Duration TIME,
    Day VARCHAR(15),
    Week INT,
    Price DECIMAL(5, 2),
    Slope_ID INT,
    FOREIGN KEY (Guest_ID) REFERENCES Guests(Guest_ID),
    FOREIGN KEY (Instructor_ID) REFERENCES Instructors(Instructor_ID),
    FOREIGN KEY (Slope_ID) REFERENCES Slopes(Slope_ID)
);
CREATE TABLE IF NOT EXISTS Slopes (
    Slope_ID INT PRIMARY KEY,
    Slope_name VARCHAR(20),
    Difficulty VARCHAR(10)
);
CREATE TABLE IF NOT EXISTS Equipment (
    Equipment_type VARCHAR(20),
    Size CHAR(1),
    Brand VARCHAR(20),
    Quantity INT,
    PRIMARY KEY (Equipment_type, Size, Brand)
);

-- Populate the tables.  
INSERT INTO Guests (Guest_ID, G_First_name, G_Last_name, Age)
VALUES
(1, 'Amy', 'Cortez', 26),
(2, 'Norman', 'Davies', 47),
(3, 'Tania', 'Vaughn', 30),
(4, 'Monty', 'Allen', 68),
(5, 'Rebecca', 'Conway', 24),
(6, 'Sara', 'Hart', 23),
(7, 'Safiyyah', 'Gardner', 39),
(8, 'Darrell', 'Peters', 26),
(9, 'Diego', 'Vitiello', 37),
(10, 'Phillip', 'Baker', 60),
(11, 'Kamil', 'Ware', 31),
(12, 'Julie', 'Archer', 27),
(13, 'Jade', 'Owen', 18),
(14, 'Nick', 'Odonnell', 50),
(15, 'Jean', 'Park', 53),
(16, 'Shannon', 'Erickson', 33),
(17, 'Alessia', 'Stephenson', 18),
(18, 'Meredith', 'Blair', 21),
(19, 'Zayd', 'Montoya', 26),
(20, 'Eva', 'Hartman', 45),
(21, 'Isaiah', 'Booth', 27),
(22, 'Leia', 'Valencia', 19),
(23, 'Francis', 'Atkins', 20),
(24, 'Everly', 'Woodard', 36),
(25, 'Jackson', 'McConnell', 32),
(26, 'Alice', 'Smith', 65),
(27, 'Mark', 'Yates', 23),
(28, 'Phoenix', 'Sears', 53),
(29, 'Tyrese', 'Adams', 32),
(30, 'Mathew', 'Fletcher', 23),
(31, 'Keane', 'Chen', 25),
(32, 'Kurt', 'Cooke', 18);

INSERT INTO Instructors (Instructor_ID, I_First_name, I_Last_name, Qualification_Ski, Qualification_Board)
VALUES
(1, 'Lauren', 'Griffin', 1, 0),
(2, 'Douglas', 'Hall', 1, 0),
(3, 'Ethan', 'Bennet', 2, 1),
(4, 'Liam', 'Mitchell', 0, 4),
(5, 'Sophia', 'Herrera', 3, 2),
(6, 'Poppy', 'Roberts', 3, 2),
(7, 'Dan', 'Kerr', 0, 1),
(8, 'Marcus', 'Jones', 2, 0);

INSERT INTO Bookings (Booking_ID, Booking_type, Guest_ID, Instructor_ID, Start_time, End_time, Duration, Day, Week, Price, Slope_ID)
VALUES
(1, 'Beginner ski lesson', 1, 2, '09:00', '11:00', '02:00', 'Monday', 1, 35.00, 1),
(2, 'Beginner ski lesson', 2, 1, '09:00', '13:00', '04:00', 'Monday', 1, 50.00, 1),
(3, 'Beginner board lesson', 3, 3, '13:00', '15:00', '02:00', 'Monday', 1, 35.00, 1),
(4, 'Intermediate ski lesson', 4, 3, '16:00', '18:00', '02:00', 'Monday', 1, 40.00, 2),
(5, 'Beginner ski lesson', 5, 2, '12:00', '16:00', '04:00', 'Monday', 1, 50.00, 1),
(6, 'Beginner ski lesson', 6, 1, '14:00', '18:00', '04:00', 'Monday', 1, 50.00, 1),
(7, 'Board day course', 27, 7, '10:00', '16:00', '08:00', 'Monday', 1, 110.00, 1),
(8, 'Intermediate board lesson', 7, 4, '10:00', '12:00', '02:00', 'Tuesday', 1, 40.00, 2),
(9, 'Beginner ski lesson', 1, 2, '09:00', '11:00', '02:00', 'Tuesday', 1, 35.00, 1),
(10, 'Board day course', 8, 3, '12:00', '20:00', '08:00', 'Tuesday', 1, 110.00, 1),
(11, 'Advanced board lesson', 9, 4, '13:00', '15:00', '02:00', 'Tuesday', 1, 55.00, 3),
(12, 'Beginner ski lesson', 5, 2, '12:00', '16:00', '04:00', 'Tuesday', 1, 50.00, 1),
(13, 'Ski day course', 10, 1, '12:00', '20:00', '08:00', 'Wednesday', 1, 110.00, 1),
(14, 'Intermediate ski lesson', 11, 5, '12:00', '14:00', '02:00', 'Wednesday', 1, 40.00, 2),
(15, 'Advanced ski lesson', 4, 5, '16:00', '18:00', '02:00', 'Wednesday', 1, 55.00, 3),
(16, 'Beginner board lesson', 3, 5, '19:00', '21:00', '02:00', 'Wednesday', 1, 35.00, 1),
(17, 'Board day course', 12, 4, '10:00', '18:00', '08:00', 'Thursday', 1, 110.00, 1),
(18, 'Ski day course', 10, 1, '12:00', '20:00', '08:00', 'Thursday', 1, 110.00, 2),
(19, 'Beginner ski lesson', 1, 2, '09:00', '11:00', '02:00', 'Friday', 1, 35.00, 1),
(20, 'Beginner ski lesson', 12, 1, '18:00', '22:00', '04:00', 'Friday', 1, 50.00, 1),
(21, 'Beginner ski lesson', 13, 2, '12:00', '16:00', '04:00', 'Friday', 1, 50.00, 1),
(22, 'Beginner ski lesson', 1, 2, '17:00', '19:00', '02:00', 'Friday', 1, 35.00, 1),
(23, 'Intermediate board lesson', 14, 6, '09:00', '11:00', '02:00', 'Saturday', 1, 40.00, 2),
(24, 'Beginner ski lesson', 15, 2, '09:00', '13:00', '04:00', 'Saturday', 1, 50.00, 1),
(25, 'Intermediate ski lesson', 16, 3, '09:00', '11:00', '02:00', 'Saturday', 1, 35.00, 2),
(26, 'Beginner board lesson', 17, 4, '09:00', '11:00', '02:00', 'Saturday', 1, 35.00, 1),
(27, 'Ski day course', 6, 5, '10:00', '18:00', '08:00', 'Saturday', 1, 110.00, 1),
(28, 'Beginner board lesson', 18, 4, '12:00', '14:00', '02:00', 'Saturday', 1, 35.00, 1),
(29, 'Intermediate ski lesson', 19, 3, '12:00', '14:00', '02:00', 'Saturday', 1, 40.00, 2),
(30, 'Beginner ski lesson', 20, 2, '14:00', '18:00', '04:00', 'Saturday', 1, 50.00, 1),
(31, 'Beginner board lesson', 21, 6, '12:00', '16:00', '04:00', 'Saturday', 1, 50.00, 1),
(32, 'Intermediate board lesson', 8, 4, '15:00', '17:00', '02:00', 'Saturday', 1, 40.00, 2),
(33, 'Intermediate ski lesson', 22, 3, '15:00', '17:00', '02:00', 'Saturday', 1, 40.00, 2),
(34, 'Advanced ski lesson', 23, 6, '17:00', '19:00', '02:00', 'Saturday', 1, 55.00, 3),
(35, 'Board day course', 24, 7, '09:00', '17:00', '08:00', 'Sunday', 1, 110.00, 1),
(36, 'Ski day course', 25, 5, '10:00', '18:00', '08:00', 'Sunday', 1, 110.00, 1),
(37, 'Beginner ski lesson', 12, 1, '11:00', '13:00', '02:00', 'Sunday', 1, 35.00, 1),
(38, 'Beginner ski lesson', 15, 1, '14:00', '16:00', '02:00', 'Sunday', 1, 35.00, 1),
(39, 'Beginner ski lesson', 26, 1, '17:00', '21:00', '04:00', 'Sunday', 1, 50.00, 1),
(40, 'Beginner board lesson', 27, 3, '17:00', '19:00', '02:00', 'Sunday', 1, 35.00, 1),
(41, 'Intermediate ski lesson', 28, 8, '17:00', '19:00', '02:00', 'Sunday', 1, 40.00, 2),
(42, 'Intermediate board lesson', 29, 3, '19:00', '21:00', '02:00', 'Sunday', 1, 40.00, 2),
(43, 'Beginner ski lesson', 30, 8, '20:00', '22:00', '02:00', 'Sunday', 1, 35.00, 1),
(44, 'Intermediate board lesson', 31, 4, '17:00', '19:00', '02:00', 'Sunday', 1, 40.00, 2),
(45, 'Beginner board lesson', 32, 4, '20:00', '22:00', '02:00', 'Sunday', 1, 35.00, 1); 

INSERT INTO Slopes (Slope_ID, Slope_name, Difficulty)
VALUES
(1, 'Slopesicle', 'Green'),
(2, 'Snowy_summit', 'Blue'),
(3, 'Frosty_thrill', 'Red'),
(4, 'Freestyle_snow_park', 'Red');

INSERT INTO Equipment (Equipment_type, Size, Brand, Quantity)
VALUES
('Helmet', 'S', 'Atomic', 20),
('Helmet', 'M', 'Atomic', 20),
('Helmet', 'L', 'Atomic', 20),
('Poles', 'S', 'Scott', 20),
('Poles', 'M', 'Scott', 20),
('Poles', 'L', 'Scott', 20),
('Skis', 'S', 'HEAD', 15),
('Skis', 'M', 'HEAD', 15),
('Skis', 'L', 'HEAD', 15),
('Board', 'S', 'Salomon', 15),
('Board', 'M', 'Salomon', 15),
('Board', 'L', 'Salomon', 15),
('Ski boots', 'S', 'Atomic', 15),
('Ski boots', 'M', 'Atomic', 15),
('Ski boots', 'L', 'Atomic', 15),
('Snowboard boots', 'S', 'Thirtytwo', 15),
('Snowboard boots', 'M', 'Thirtytwo', 15),
('Snowboard boots', 'L', 'Thirtytwo', 15);    