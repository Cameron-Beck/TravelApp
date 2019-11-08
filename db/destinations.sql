DROP TABLE bitings;
DROP TABLE zombies;
DROP TABLE victims;

CREATE TABLE zombies
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  type VARCHAR(255)
);

DROP TABLE city;
DROP TABLE country;

CREATE TABLE city (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  visited BOOLEAN,
  country_id INT8 REFERENCES country(id)
);

CREATE TABLE country (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  visited BOOLEAN
)

///fsdfdfsfds
