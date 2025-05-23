CREATE TABLE trains (
    train_id varchar PRIMARY KEY,
    passenger_id serial,
    origin VARCHAR(100),
    destination VARCHAR(100),
    departure TIMESTAMP,
    arrival TIMESTAMP,
    train_class VARCHAR(20)
);

select * from trains 

INSERT INTO trains (train_id, passenger_id, origin, destination, departure, arrival, train_class) VALUES
('TR001', 1, 'Mumbai', 'Delhi', '2025-06-01 06:00:00', '2025-06-01 18:30:00', 'Sleeper'),
('TR002', 2, 'Bangalore', 'Hyderabad', '2025-06-03 10:15:00', '2025-06-03 22:45:00', 'AC First Class'),
('TR003', 3, 'Chennai', 'Kolkata', '2025-06-05 14:20:00', '2025-06-06 08:10:00', 'AC Two Tier'),
('TR004', 4, 'Delhi', 'Jaipur', '2025-06-07 08:30:00', '2025-06-07 13:45:00', 'Chair Car'),
('TR005', 5, 'Hyderabad', 'Mumbai', '2025-06-09 23:00:00', '2025-06-10 10:00:00', 'AC Three Tier'),
('TR006', 6, 'Kolkata', 'Delhi', '2025-06-11 05:45:00', '2025-06-11 21:30:00', 'Sleeper'),
('TR007', 7, 'Jaipur', 'Ahmedabad', '2025-06-13 12:50:00', '2025-06-13 19:30:00', 'AC Chair Car'),
('TR008', 8, 'Chennai', 'Bangalore', '2025-06-15 16:10:00', '2025-06-15 20:00:00', 'AC First Class'),
('TR009', 9, 'Mumbai', 'Goa', '2025-06-17 07:30:00', '2025-06-17 14:15:00', 'AC Two Tier'),
('TR010', 10, 'Delhi', 'Varanasi', '2025-06-19 21:45:00', '2025-06-20 08:30:00', 'Sleeper');

select * from trains 


CREATE TABLE hotels (
    hotel_id varchar PRIMARY KEY,
    passenger_id INT,
    hotel_name VARCHAR(100),
    city VARCHAR(100),
    check_in TIMESTAMP,
    check_out TIMESTAMP
);


INSERT INTO hotels (hotel_id, passenger_id, hotel_name, city, check_in, check_out) VALUES
('HT001', 1, 'Taj Palace', 'Delhi', '2025-06-01 14:00:00', '2025-06-03 12:00:00'),
('HT002', 2, 'The Oberoi', 'Mumbai', '2025-06-04 15:00:00', '2025-06-07 11:00:00'),
('HT003', 3, 'ITC Grand Chola', 'Chennai', '2025-06-08 13:30:00', '2025-06-10 10:30:00'),
('HT004', 4, 'Hyatt Regency', 'Kolkata', '2025-06-11 16:00:00', '2025-06-13 11:00:00'),
('HT005', 5, 'Leela Palace', 'Bangalore', '2025-06-14 12:00:00', '2025-06-16 10:00:00'),
('HT006', 6, 'Marriott Hotel', 'Hyderabad', '2025-06-17 14:30:00', '2025-06-19 12:00:00'),
('HT007', 7, 'Radisson Blu', 'Jaipur', '2025-06-20 15:00:00', '2025-06-22 10:00:00'),
('HT008', 8, 'Trident Hotel', 'Ahmedabad', '2025-06-23 13:00:00', '2025-06-25 11:30:00'),
('HT009', 9, 'Westin Hotel', 'Pune', '2025-06-26 14:00:00', '2025-06-28 10:00:00'),
('HT010', 10, 'Novotel', 'Goa', '2025-06-29 12:30:00', '2025-07-01 11:00:00');

select * from Hotels


CREATE EXTENSION IF NOT EXISTS dblink;

SELECT h.*,p.*
FROM hotels h
JOIN dblink('dbname=Travel_db1 user=postgres password=admin', 
            'SELECT passenger_id, name,email, phone FROM passengers') 
      AS p(passenger_id SERIAL, name VARCHAR, email VARCHAR, phone VARCHAR)
ON h.passenger_id = p.passenger_id;
