-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

create table countries (
    id serial primary key,
    country text not null
);

create table cities (
    id serial primary key,
    city text not null
);

create table locations (
    id serial primary key,
    city_id integer references cities on delete set null,
    country_id integer references countries on delete set null
);

create table airlines (
    id serial primary key,
    airline text not null
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id integer references airlines on delete set null,
  from_location_id integer references locations on delete cascade, 
  to_location_id integer references locations on delete cascade
);

insert into countries (country)
values
('United States'),
('United Kingdom'),
('Mexico'),
('Morocco'),
('Chile'),
('China'),
('France'),
('Japan'),
('UAE'),
('Brazil');

insert into cities (city)
values
('Washington DC'),
('Tokyo'),
('Las Vegas'),
('Mexico City'),
('Paris'),
('Dubai'),
('Charlotte'),
('Beijing'),
('Cedar Rapids'),
('Seattle'),
('New York'),
('Sao Paolo'),
('Los Angeles'),
('London'),
('Casablanca'),
('Chicago'),
('Santiago'),
('New Orleans');

insert into locations (city_id, country_id)
values
(1,1),
(10,1),
(2,8),
(14,2),
(13,1),
(3,1),
(4,3),
(5,7),
(15,4),
(6,9),
(8,6),
(11,1),
(7,1),
(9,1),
(16,1),
(18,1),
(12,10),
(17,5);

insert into airlines (airline)
values
('United'),
('British Airways'),
('Delta'),
('TUI Fly Belgium'),
('Air China'),
('American Airlines'),
('Avianca Brasil');

INSERT INTO tickets
  (first_name, last_name, seat, departure, arrival, airline_id, from_location_id, to_location_id)
VALUES
  ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 2),
  ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 3, 4),
  ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 5, 6),
  ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 2, 7),
  ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 8, 9),
  ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 10, 11),
  ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 12, 13),
  ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 14, 15),
  ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 13, 16),
  ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 17, 18);



