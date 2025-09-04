-- Create database for the project.
IF DB_ID('OMTBS') IS NULL
    CREATE DATABASE OMTBS;
GO

USE OMTBS;
GO

-- Create table for user registration and login.
IF OBJECT_ID('UserRegister') IS NOT NULL DROP TABLE UserRegister;
CREATE TABLE UserRegister(
    LoginID INT PRIMARY KEY IDENTITY,
    FullName VARCHAR(50) NOT NULL,
    EmailID VARCHAR(50) NOT NULL,
    [Password] VARCHAR(50) NOT NULL,
    MobileNo NUMERIC(18,0) NOT NULL
);
GO

-- Create table for movies.
IF OBJECT_ID('Movies') IS NOT NULL DROP TABLE Movies;
CREATE TABLE Movies(
    MoviesID INT PRIMARY KEY IDENTITY,
    MovieName VARCHAR(50) NOT NULL,
    Language VARCHAR(50) NOT NULL,
    MPoster NVARCHAR(MAX) NOT NULL,
    Price MONEY NOT NULL,
    [Description] VARCHAR(MAX) NOT NULL
);
GO

-- Insert sample movies (fixed apostrophes)
INSERT INTO Movies(MovieName, Language, MPoster, Price, [Description])
VALUES
('Avatar', 'English', '/Content/Images/avatar.jpg', 300, 'Avatar (also marketed as James Cameron''s Avatar)...'),
('Farzand', 'Marathi', '/Content/Images/farjand.jpg', 350, 'Farzand (English: Son) (Marathi:फर्जंद)...'),
('Iron Man 3', 'English', '/Content/Images/im3.jpg', 450, 'Iron Man 3 is a 2013 American superhero film...'),
('Men In Black', 'English', '/Content/Images/mib.jpg', 300, 'Men in Black (stylized as MIB: Men in Black)...'),
('Tanhaji', 'Marathi', '/Content/Images/tanaji.jfif', 400, 'Tanhaji: The Unsung Warrior is a 2020 Indian film...'),
('Cars', 'English', '/Content/Images/cars.jpg', 300, 'Cars is a 2006 American computer-animated film...'),
('Cars 2', 'English', '/Content/Images/cars2.jpg', 350, 'Cars 2 is a 2011 American computer-animated spy film...'),
('Cars 3', 'English', '/Content/Images/cars3.jpg', 350, 'Cars 3 is a 2017 American computer-animated film...'),
('Do Little', 'English', '/Content/Images/dolit.png', 400, 'Dolittle (also referred to as The Voyage of Doctor Dolittle)...'),
('Max', 'English', '/Content/Images/max.jpg', 500, 'A military dog that helped American Marines...'),
('Titanic', 'English', '/Content/Images/titanic.jpg', 340, 'Titanic is a 1997 American epic romance film...'),
('Max 2', 'English', '/Content/Images/max2.jpg', 300, 'Max 2: White House Hero is a 2017 American adventure film...');
GO

-- Create table for ShowTime (renamed from DateTime)
IF OBJECT_ID('ShowTime') IS NOT NULL DROP TABLE ShowTime;
CREATE TABLE ShowTime (
    ID INT PRIMARY KEY IDENTITY,
    [Date] DATE NOT NULL,
    [Time] VARCHAR(50) NOT NULL,
    Theatres VARCHAR(50) NOT NULL,
    MoviesID INT NOT NULL,
    LoginID INT NOT NULL,
    FOREIGN KEY (MoviesID) REFERENCES Movies(MoviesID),
    FOREIGN KEY (LoginID) REFERENCES UserRegister(LoginID)
);
GO

-- Stored Procedure for inserting ShowTime
DROP PROC IF EXISTS Sample_Proc;
GO
CREATE PROC Sample_Proc
    @Date VARCHAR(20),
    @Time VARCHAR(50),
    @Theatres VARCHAR(50),
    @MoviesID INT,
    @LoginID INT,
    @ID INT OUTPUT
AS
BEGIN
    INSERT INTO ShowTime([Date], [Time], Theatres, MoviesID, LoginID) 
    VALUES(@Date,@Time,@Theatres,@MoviesID,@LoginID);
    SET @ID = SCOPE_IDENTITY();
END;
GO

-- Create table for Seating
IF OBJECT_ID('Seating') IS NOT NULL DROP TABLE Seating;
CREATE TABLE Seating (
    SeatNo INT PRIMARY KEY,
    Status VARCHAR(50) NOT NULL,
    ShowTimeID INT,
    FOREIGN KEY (ShowTimeID) REFERENCES ShowTime(ID)
);
GO

-- Insert seats data
INSERT INTO Seating(SeatNo, Status)
VALUES 
(1,'A'),(2,'A'),(3,'A'),(4,'A'),(5,'A'),(6,'A'),(7,'A'),(8,'A'),(9,'A'),(10,'A'),
(11,'A'),(12,'A'),(13,'A'),(14,'A'),(15,'A'),(16,'A'),(17,'A'),(18,'A'),(19,'A'),(20,'A'),
(21,'A'),(22,'A'),(23,'A'),(24,'A'),(25,'A'),(26,'A'),(27,'A'),(28,'A'),(29,'A'),(30,'A'),
(31,'A'),(32,'A'),(33,'A'),(34,'A'),(35,'A'),(36,'A'),(37,'A'),(38,'A'),(39,'A'),(40,'A'),
(41,'A'),(42,'A'),(43,'A'),(44,'A'),(45,'A'),(46,'A'),(47,'A'),(48,'A'),(49,'A'),(50,'A'),
(51,'A'),(52,'A'),(53,'A'),(54,'A'),(55,'A'),(56,'A');
GO

-- Create table for Payment
IF OBJECT_ID('Payment') IS NOT NULL DROP TABLE Payment;
CREATE TABLE Payment (
    ID INT PRIMARY KEY IDENTITY,
    CardNo BIGINT NOT NULL,
    ExpiryDate VARCHAR(50) NOT NULL,
    CVV VARCHAR(50) NOT NULL,
    CardHolder VARCHAR(50) NOT NULL,
    ShowTimeID INT NOT NULL,
    FOREIGN KEY (ShowTimeID) REFERENCES ShowTime(ID)
);
GO

-- Stored Procedure for Payment
DROP PROC IF EXISTS Sp_Payment;
GO
CREATE PROC Sp_Payment
    @CardNo BIGINT,
    @ExpiryDate VARCHAR(50),
    @CVV VARCHAR(50),
    @CardHolder VARCHAR(50),
    @ShowTimeID INT,
    @id INT OUTPUT
AS
BEGIN
    INSERT INTO Payment(CardNo, ExpiryDate, CVV, CardHolder, ShowTimeID) 
    VALUES(@CardNo,@ExpiryDate,@CVV,@CardHolder,@ShowTimeID);
    SET @id = SCOPE_IDENTITY();
END;
GO

-- Create table for Summary
IF OBJECT_ID('Summary') IS NOT NULL DROP TABLE Summary;
CREATE TABLE Summary (
    ID INT PRIMARY KEY,
    PayID INT NOT NULL,
    FOREIGN KEY (PayID) REFERENCES Payment(ID)
);
GO

-- Stored Procedure for Summary
DROP PROC IF EXISTS SP_Summary;
GO
CREATE PROC SP_Summary
    @ID INT
AS
BEGIN
    SELECT ur.FullName, m.MPoster, m.MovieName, st.Theatres, st.[Time], p.CardHolder, m.Price
    FROM UserRegister ur
    INNER JOIN ShowTime st ON st.LoginID = ur.LoginID
    INNER JOIN Movies m ON st.MoviesID = m.MoviesID
    INNER JOIN Payment p ON p.ShowTimeID = st.ID
    WHERE p.ID = @ID;
END;
GO
