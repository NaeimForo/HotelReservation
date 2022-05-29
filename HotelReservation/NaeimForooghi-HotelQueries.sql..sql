USE HotelSoftwareGuild; 

-- Write a query that returns a list of reservations that end in July 2023, including the name of the guest, the room number(s), and the reservation dates.

SELECT
	Room.RoomId,
 	Guest.FirstName,
	Guest.LastName,
	Reservation.StartDate,
    Reservation.EndDate
    
FROM Room 
INNER JOIN ReservationRoom ON Room.RoomId = ReservationRoom.RoomId 
INNER JOIN Reservation ON ReservationRoom.ReservationId = Reservation.ReservationId 
INNER JOIN Guest ON Reservation.GuestId = Guest.GuestId
WHERE Reservation.EndDate BETWEEN '2023-07-01' AND '2023-07-31';


-- Write a query that returns a list of all reservations for rooms with a jacuzzi, displaying the guest's name, the room number, and the dates of the reservation.

SELECT 
	Guest.FirstName, 
    Guest.LastName, 
    Room.RoomId, 
    Reservation.StartDate, 
    Reservation.EndDate,
    Amenity.AmenityType
FROM Reservation 
LEFT JOIN ReservationRoom ON Reservation.ReservationId = ReservationRoom.ReservationId
LEFT JOIN Guest ON Reservation.GuestId = Guest.GuestId  
LEFT JOIN Room  ON ReservationRoom.RoomId = Room.RoomId 
LEFT JOIN RoomAmenity ON Room.RoomId = RoomAmenity.RoomId
LEFT JOIN Amenity ON RoomAmenity.AmenityId = Amenity.AmenityId
WHERE AmenityType = 'Jaccuzi'; 


 -- Write a query that returns all the rooms reserved for a specific guest, including the guest's name, the room(s) reserved, the starting date of the reservation, and how many people were included in the reservation. (Choose a guest's name from the existing data.)
SELECT *
FROM Guest 
WHERE FirstName = 'Mack' AND LastName = 'Simmer';

SELECT
	Room.RoomId,
	Guest.FirstName, 
	Guest.LastName, 
    Reservation.StartDate,
    ReservationRoom.Adult + ReservationRoom.Childern AS TotalGuest    
FROM Reservation 
INNER JOIN ReservationRoom ON ReservationRoom.ReservationId = Reservation.ReservationId
INNER JOIN Guest ON Reservation.GuestId = Guest.GuestId 
INNER JOIN Room ON ReservationRoom.RoomId = Room.RoomId 

WHERE Guest.GuestId = 2;

-- Write a query that returns a list of rooms, reservation ID, and per-room cost for each reservation. The results should include all rooms, whether or not there is a reservation associated with the room.

SELECT 
	Reservation.ReservationId, 
    Room.RoomId,
    ReservationRoom.TotalRoomCost
FROM Reservation  
RIGHT JOIN ReservationRoom ON  ReservationRoom.ReservationId = Reservation.ReservationId
RIGHT JOIN Room ON ReservationRoom.RoomId = Room.RoomId ; 


-- Write a query that returns all the rooms accommodating at least three guests and that are reserved on any date in April 2023.

 SELECT 
	Room.RoomId, 
    Reservation.StartDate, 
    Reservation.EndDate,
	ReservationRoom.Adult + ReservationRoom.Childern AS TotalGuest
FROM Reservation 
JOIN ReservationRoom ON Reservation.ReservationId = ReservationRoom.ReservationId
JOIN Room ON ReservationRoom.RoomId = Room.RoomId 
WHERE Reservation.StartDate BETWEEN '2023-04-01' AND '2023-04-30' 
AND ReservationRoom.Adult + ReservationRoom.Childern >=3; 




-- Write a query that returns a list of all guest names and the number of reservations per guest, sorted starting with the guest with the most reservations and then by the guest's last name.
SELECT 
	
    Guest.FirstName, 
    Guest.LastName,
    COUNT(Reservation.GuestID) AS NumberOFReservation
FROM GUEST 
INNER JOIN Reservation ON Guest.GuestId = Reservation.GuestId 
GROUP BY Guest.FirstName
ORDER BY NumberOfReservation DESC, Guest.LastName; 


-- Write a query that displays the name, address, and phone number of a guest based on their phone number. (Choose a phone number from the existing data.)

SELECT 
	FirstName, 
    LastName, 
    address,
    Phone
FROM Guest 
WHERE Phone LIKE '%(291) 533-0508%';