--always drop the many first
DROP TABLE IF EXISTS artists;
DROP TABLE IF EXISTS albums;

CREATE TABLE artists(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  );

CREATE TABLE albums(
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  genre INT,
  artist_id INT REFERENCES artists(id)
);
