-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music
CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  artist_name TEXT NOT NULL,
);

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL
  release_date DATE NOT NULL,
);

CREATE TABLE producers (
  id SERIAL PRIMARY KEY,
  producer_name TEXT NOT NULL,
);

CREATE TABLE songs (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  artist_id INTEGER REFERENCES artists NOT NULL,
  album_id INTEGER REFERENCES albums NOT NULL,
  producer_id INTEGER REFERENCES producers NOT NULL,

);
INSERT INTO artists 
  (artist_name) 
VALUES 
  ('Hanson'),
  ('Queen'),
  ('Mariah Cary'),
  ('Boyz II Men'),
  ('Lady Gaga'),
  ('Bradley Cooper'),
  ('Nickelback'),
  ('Jay Z'),
  ('Alicia Keys'),
  ('Katy Perry'),
  ('Juicy J'),
  ('Maroon 5'),
  ('Christina Aguilera'),
  ('Avril Lavigne'),
  ('Destiny''s Child');

INSERT INTO producers 
  (producer_name) 
VALUES 
  ('Dust Brothers'),
  ('Stephen Lironi'),
  ('Roy Thomas Baker'),
  ('Walter Afanasieff'),
  ('Bemjamin Rice'),
  ('Rick Parashar'),
  ('Al Shux'),
  ('Max Martin'),
  ('Cirkut'),
  ('Shellback'),
  ('Benny Blanco'),
  ('The Matrix'),
  ('Darkchild');

INSERT INTO albums 
  (title, release_date) 
VALUES 
  ('Middle of Nowhere', '04-15-1997'),
  ('A Night at the Opera', '10-31-1975'),
  ('Daydream', '11-14-1995'),
  ('A Star is Born', '09-27-2018'),
  ('Silver Side Up', '08-21-2001'),
  ('The Blueprint', '10-20-2009'),
  ('Prism', '12-17-2013'),
  ('Hands All Over', '06-21-2011'),
  ('Let Go', '05-14-2002'),
  ('The Writing''s on the Wall', '11-07-1999');

INSERT INTO songs 
  (title, duration_in_seconds, artist_id, album_id, producer_id);
VALUES
  ('MMMBop', 238, 1, 1, 1),
  ('MMMBop', 238, 1, 1, 2),
  ('Bohemian Rhapsody', 355, 2, 2, 3),
  ('One Sweet Day', 282, 3, 3, 4),
  ('One Sweet Day', 282, 4, 3, 4),
  ('Shallow', 216, 5, 4, 5),
  ('Shallow', 216, 6, 4, 5),
  ('How You Remind Me', 223, 7, 5, 6),
  ('New York State of Mind', 276, 8, 6, 7),
  ('New York State of Mind', 276, 9, 6, 7),
  ('Dark Horse', 215, 10, 7, 8),
  ('Dark Horse', 215, 11, 7, 9),
  ('Moves Like Jagger', 201, 12, 8, 10),
  ('Moves Like Jagger', 201, 13, 8, 11),
  ('Complicated', 244, 14, 9, 12),
  ('Say My Name', 240, 15, 10, 13);
