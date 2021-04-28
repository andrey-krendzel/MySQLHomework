CREATE TABLE Club
(
    clubId          INTEGER NOT NULL IDENTITY,
    clubName VARCHAR(15),
    city VARCHAR(15),
email VARCHAR(30),

    CONSTRAINT PK_Club PRIMARY KEY (clubId)
   
);

CREATE TABLE Brevet
(
  brevetId INTEGER     NOT NULL IDENTITY,
  distance INTEGER NOT NULL,
  brevetDate      DATE,
  brevetTime TIME,
location    VARCHAR(15),
  climbing        INTEGER,

  CONSTRAINT PK_Brevet PRIMARY KEY (brevetId)
);

CREATE TABLE Rider
(
    riderId          INTEGER NOT NULL IDENTITY,
    familyName VARCHAR(10),
    givenName VARCHAR(10),
gender CHAR(1),
phone VARCHAR(10),
email VARCHAR(30),
clubId INTEGER,
username VARCHAR(15) NOT NULL,
password VARCHAR(24) NOT NULL,
role VARCHAR(5),

    CONSTRAINT PK_Rider PRIMARY KEY (riderId),
CONSTRAINT FK_Rider_Club FOREIGN KEY (clubId) REFERENCES Club(clubId)

);

CREATE TABLE Brevet_Rider
(
    brevetId          INTEGER NOT NULL,
    riderId INTEGER NOT NULL,
    isCompleted CHAR(1),
finishingTime VARCHAR(5),

    CONSTRAINT PK_Brevet_Rider PRIMARY KEY (brevetId, riderId),
    CONSTRAINT FK_Brevet FOREIGN KEY (brevetId) REFERENCES Brevet(brevetId),
CONSTRAINT FK_BrevetRider_Rider FOREIGN KEY (riderId) REFERENCES Rider(riderId)
);

INSERT INTO Club(clubName, city, email) VALUES
('Hells Angels', 'Los Angeles', 'hellsangels@google.com'),
('Black Angels', 'Detroit', 'black@google.com'),
('Purple Angels', 'Madrid', 'madrid@google.com')

INSERT INTO Brevet(distance, brevetDate, brevetTime, location, climbing) VALUES
(200, '2021-04-26', '12:20', 'Barcelona', 100),
(1000, '2021-03-24', '14:40', 'Paris', 200)


INSERT INTO Rider(familyName, givenName, gender, phone, email, clubId, username, password, role) VALUES
('Creed', 'Apollo', 'M', '123456789', 'creed@google.com', 1, 'creed1', 'password', 'user'),
('Bilboa', 'Rocky', 'M', '0987654321', 'rocky@google.com', 2, 'rocky1', 'password', 'user')

INSERT INTO Brevet_Rider(brevetId, riderId, isCompleted, finishingTime) VALUES
(1, 1, 'Y', '10:23'),
(1,3, 'N', '00:00')

SELECT * FROM Brevet_Rider
SELECT * FROM Brevet
SELECT * FROM Rider
SELECT * FROM Club



DROP TABLE Brevet_Rider;
DROP TABLE Brevet;
DROP TABLE Rider;
DROP TABLE Club;

-- There are already clustered indexes for all the tables, so I will create non-clustered ones

