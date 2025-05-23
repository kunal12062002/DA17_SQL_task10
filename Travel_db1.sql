CREATE TABLE passengers (
    passenger_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15)
);

INSERT INTO passengers (name, email, phone) VALUES
('Kunal Sharma', 'kunal.sharma@email.com', '9876543210'),
('Priya Desai', 'priya.desai@email.com', '9812345678'),
('Amit Joshi', 'amit.joshi@email.com', '9908765432'),
('Neha Verma', 'neha.verma@email.com', '9823456789'),
('Rahul Patel', 'rahul.patel@email.com', '9845678901'),
('Sonia Mehta', 'sonia.mehta@email.com', '9801234567'),
('Vikram Singh', 'vikram.singh@email.com', '9856789012'),
('Anjali Rao', 'anjali.rao@email.com', '9878901234'),
('Rohan Kapoor', 'rohan.kapoor@email.com', '9816789054'),
('Meera Nair', 'meera.nair@email.com', '9834598702');

select * from passengers

CREATE TABLE flights (
    flight_id varchar PRIMARY KEY,
    passenger_id INT REFERENCES passengers(passenger_id),
    origin VARCHAR(100),
    destination VARCHAR(100),
    departure TIMESTAMP,
    arrival TIMESTAMP,
    seat_class VARCHAR(20)
);

INSERT INTO flights (flight_id, passenger_id, origin, destination, departure, arrival, seat_class) VALUES
('FL001', 1, 'Mumbai', 'Delhi', '2025-06-01 08:30:00', '2025-06-01 10:45:00', 'Economy'),
('FL002', 2, 'Bangalore', 'Chennai', '2025-06-03 15:00:00', '2025-06-03 16:30:00', 'Business'),
('FL003', 3, 'Delhi', 'Kolkata', '2025-06-05 09:15:00', '2025-06-05 11:45:00', 'Economy'),
('FL004', 4, 'Hyderabad', 'Mumbai', '2025-06-07 18:20:00', '2025-06-07 20:30:00', 'Premium Economy'),
('FL005', 5, 'Chennai', 'Bangalore', '2025-06-09 06:45:00', '2025-06-09 08:10:00', 'Economy'),
('FL006', 6, 'Mumbai', 'Hyderabad', '2025-06-11 13:30:00', '2025-06-11 15:00:00', 'Business'),
('FL007', 7, 'Kolkata', 'Delhi', '2025-06-13 07:00:00', '2025-06-13 09:20:00', 'Premium Economy'),
('FL008', 8, 'Delhi', 'Mumbai', '2025-06-15 19:30:00', '2025-06-15 21:45:00', 'Economy'),
('FL009', 9, 'Bangalore', 'Hyderabad', '2025-06-17 10:00:00', '2025-06-17 11:30:00', 'Business'),
('FL010', 10, 'Chennai', 'Kolkata', '2025-06-19 16:50:00', '2025-06-19 19:10:00', 'Economy');

select * from flights


CREATE EXTENSION IF NOT EXISTS dblink;

SELECT p.*,h.*
FROM passengers p
JOIN dblink('dbname=Travel_db2 user=postgres password=admin', 
            'SELECT passenger_id, hotel_name, city, check_in, check_out FROM hotels') 
      AS h(passenger_id INT, hotel_name VARCHAR, city VARCHAR, check_in TIMESTAMP, check_out TIMESTAMP)
ON p.passenger_id = h.passenger_id;

