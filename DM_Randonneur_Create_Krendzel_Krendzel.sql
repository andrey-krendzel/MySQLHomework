CREATE TABLE Club
(
    clubId          INTEGER NOT NULL IDENTITY,
    clubName		VARCHAR(15),
    city			VARCHAR(15),
	email			VARCHAR(30),

    CONSTRAINT PK_Club PRIMARY KEY (clubId)
    
);

CREATE TABLE Brevet
(
  brevetId		INTEGER     NOT NULL,
  distance	INTEGER NOT NULL,
  brevetDate      VARCHAR(15),
location    VARCHAR(15),
  climbing        INTEGER,

  CONSTRAINT PK_Brevet PRIMARY KEY (brevetId)
);

CREATE TABLE Rider
(
    riderId          INTEGER NOT NULL,
    familyName			VARCHAR(10),
    givenName		VARCHAR(10),
	gender			CHAR(1),
	phone		VARCHAR(10),
	email		VARCHAR(15),
	clubId		INTEGER,
	username	VARCHAR(15) NOT NULL,
	password	VARCHAR(24) NOT NULL,
	role		VARCHAR(5),

    CONSTRAINT PK_Rider PRIMARY KEY (riderId),
	CONSTRAINT FK_Rider_Club FOREIGN KEY (clubId) REFERENCES Club(clubId)

);

CREATE TABLE Brevet_Rider
(
    brevetId          INTEGER NOT NULL,
    riderId			INTEGER NOT NULL,
    isCompleted		CHAR(1),
	finishingTime	VARCHAR(5),

    CONSTRAINT PK_Brevet_Rider PRIMARY KEY (brevetId, riderId),
    CONSTRAINT FK_Brevet FOREIGN KEY (brevetId) REFERENCES Brevet(brevetId),
	CONSTRAINT FK_BrevetRider_Rider FOREIGN KEY (riderId) REFERENCES Rider(riderId)
);

/* Inserts */ 

INSERT INTO Club(clubName, city, email) VALUES
('Hells Angels', 'Los Angeles', 'hellsangels@google.com'),
('Black Angels', 'Detroit', 'black@google.com'),
('Purple Angels', 'Madrid', 'madrid@google.com')


/* DROP tables */


DROP TABLE Brevet;
DROP TABLE Rider;
DROP TABLE Brevet_Rider;
DROP TABLE Club;