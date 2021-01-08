-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE airlines (
  id SERIAL PRIMARY KEY,
  airline_name TEXT NOT NULL
);

CREATE TABLE countries (
  id SERIAL PRIMARY KEY, 
  country_name TEXT NOT NULL
);
CREATE TABLE locations (
  id SERIAL PRIMARY KEY,
  country INTEGER REFERENCES countries NOT NULL,
  region TEXT NOT NULL
);

CREATE TABLE people (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);
CREATE TABLE tickets (
  id SERIAL PRIMARY KEY,
  seat TEXT NOT NULL,
  person INTEGER REFERENCES people NOT NULL
  flight INTEGER REFERENCES flights NOT NULL,
);
CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  airline INTEGER REFERENCES airlines NOT NULL,
  departure_location INTEGER REFERENCES locations,
  departure_time DATETIME NOT NULL;
  arrival_location INTEGER REFERENCES locations,
  arrival_time DATETIME NOT NULL CHECK (departure_time != arrival_time)
);

INSERT INTO people
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Jennifer', 'Finch'),
  ('Waneta', 'Skeleton'),
  ('Thadeus', 'Gathercoal'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Berkie', 'Wycliff'),
  ('Cory', 'Squibbes');

INSERT INTO arlines
  (airline_name)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');

INSERT INTO countries
  (country_name)
VALUES
  ('United States'),
  ('Mexico'),
  ('Chile'),
  ('Japan'),
  ('United Kingdom'),
  ('Morocco'),
  ('China'),
  ('France'),
  ('UAE'),
  ('Brazil');

INSERT INTO locations
  (region, country)
VALUES
  ('Washington DC', 1),
  ('Seattle', 1),
  ('Tokyo', 4),
  ('London', 5),
  ('Los Angeles', 1),
  ('Las Vegas', 1),
  ('Seattle', 1),
  ('Mexico City', 2),
  ('Paris', 8),
  ('Casablanca', 6),
  ('Dubai', 9),
  ('Beijing', 7),
  ('New York', 1),
  ('Charlotte', 1),
  ('Cedar Rapids', 1),
  ('Chicago', 1),
  ('Charlotte', 1),
  ('New Orleans', 1),
  ('Sao Paolo', 10),
  ('Santiago', 3);

INSERT INTO flights
  (airline, departure_location, departure_time, arrival_location, arrival_time)
VALUES
  (1, 1, '2018-04-08 09:00:00', 2, '2018-04-08 12:00:00'),
  (2, 3, '2018-12-19 12:45:00', 4, '2018-12-19 16:15:00'),
  (3, 5, '2018-01-02 07:00:00', 6, '2018-01-02 08:03:00'),
  (3, 7, '2018-04-15 16:50:00', 8, '2018-04-15 21:00:00'),
  (4, 9, '2018-08-01 18:30:00', 10, '2018-08-01 21:50:00'),
  (5, 11, '2018-10-31 01:15:00', 12, '2018-10-31 12:55:00'),
  (1, 13, '2019-02-06 06:00:00', 14, '2019-02-06 07:47:00'),
  (6, 15, '2018-12-22 14:42:00', 16, '2018-12-22 15:56:00'),
  (6, 17, '2019-02-06 16:28:00', 18, '2019-02-06 19:18:00'),
  (7, 19, '2019-01-20 19:30:00', 20, '2019-01-20 22:45:00');

INSERT INTO tickets
  (seat, person, flight)
VALUES
  ('33B', 1, 1),
  ('8A', 2, 2),
  ('12F', 3, 3),
  ('20A', 4, 4),
  ('23D', 5, 5),
  ('18C', 6, 6),
  ('9E', 7, 7),
  ('1A', 8, 8),
  ('32B', 9, 9),
  ('10D', 10, 10);