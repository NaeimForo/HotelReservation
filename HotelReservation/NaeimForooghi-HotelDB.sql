DROP DATABASE IF EXISTS HotelSoftwareGuild; 

CREATE DATABASE IF NOT EXISTS HotelSoftwareGuild; 

USE HotelSoftwareGuild; 


CREATE TABLE IF NOT EXISTS Amenity (
AmenityId TINYINT PRIMARY KEY AUTO_INCREMENT,
AmenityType VARCHAR (50) NOT NULL 
);

CREATE TABLE IF NOT EXISTS RoomType (
RoomTypeId TINYINT PRIMARY KEY AUTO_INCREMENT,
RoomType VARCHAR (10)
); 


CREATE TABLE IF NOT EXISTS Room (
RoomId SMALLINT PRIMARY KEY, 
ADA_Accessible BOOL NOT NULL DEFAULT 1 , 
StandardOccupancy TINYINT NOT NULL, 
MaximumOccupancy TINYINT NOT NULL, 
BasePrice DECIMAL (5,2) NOT NULL, 
ExtraPerson DECIMAL (4,2) NOT NULL,
RoomTypeId TINYINT NOT NULL ,
CONSTRAINT fk_Room_RoomType
	FOREIGN KEY fk_Room_RoomType(RoomTypeId)
    REFERENCES RoomType(RoomTypeId)
);


CREATE TABLE IF NOT EXISTS RoomAmenity (
RoomId SMALLINT  NOT NULL, 
AmenityId TINYINT NOT NULL,
PRIMARY KEY pk_RoomAmenity (RoomId, AmenityId),
CONSTRAINT fk_RoomAmenity_Room 
	FOREIGN KEY fk_RoomAmenity_Room (RoomId)
    REFERENCES Room(RoomId),
CONSTRAINT fk_RoomAmenity_Amenity
	FOREIGN KEY fk_RoomAmenity_Amenity (AmenityId)
    REFERENCES Amenity(AmenityId)
);


CREATE TABLE IF NOT EXISTS Guest (
GuestId INT PRIMARY KEY AUTO_INCREMENT, 
FirstName VARCHAR(50) NOT NULL, 
LastName VARCHAR (50) NOT NULL, 
Address VARCHAR(255),
City VARCHAR (50), 
State CHAR(2),
ZipCode CHAR (10),
Phone CHAR (15) 
); 

CREATE TABLE IF NOT EXISTS Reservation (
ReservationId INT PRIMARY KEY AUTO_INCREMENT, 
StartDate DATE NOT NULL, 
EndDate DATE NOT NULL, 
GuestId INT NOT NULL,
CONSTRAINT fk_Reservation_Guest 
	FOREIGN KEY fk_Reservation_Guest (GuestId)
    REFERENCES Guest(GuestId)
);

CREATE TABLE IF NOT EXISTS ReservationRoom (
ReservationId INT NOT NULL, 
RoomId SMALLINT NOT NULL, 
Adult TINYINT NOT NULL, 
Childern TINYINT NOT NULL, 
TotalRoomCost DECIMAL (7,2),
CONSTRAINT fk_ReservationRoom_Reservation 
	FOREIGN KEY fk_ReservationRoom_Reservation (ReservationId)
	REFERENCES Reservation(ReservationId),
CONSTRAINT fk_ReservationRoom_Room
	FOREIGN KEY fk_ReservationRoom_Room (RoomId)
    REFERENCES Room(RoomId)
);


 

