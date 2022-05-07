-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

create table moons (
    id serial primary key,
    name text
);

create table galaxies (
    id serial primary key,
    name text not null
);

create table orbitee_objects (
    id serial primary key,
    name text not null
);


CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around_id integer references orbitee_objects on delete set null,
  galaxy_id integer references galaxies on delete set null,
  moons text[] not null
);

insert into galaxies (name)
VALUES
    ('Milky Way');

insert into orbitee_objects (name)
VALUES
    ('The Sun'),
    ('Gliese 876'),
    ('Proxima Centauri');

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around_id, galaxy_id, moons)
VALUES
  ('Earth', 1.00, 1, 1, '{"The Moon"}'),
  ('Mars', 1.88, 1, 1, '{"Phobos", "Deimos"}'),
  ('Venus', 0.62, 1, 1, '{}'),
  ('Neptune', 164.8, 1, 1, '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  ('Proxima Centauri b', 0.03, 3, 1, '{}'),
  ('Gliese 876 b', 0.23, 2, 1, '{}');


-- insert into moons (name)
-- VALUES
--     ('The Moon'),
--     ("Phobos"),
--     ("Deimos"),
--     ("Naiad"),
--     ("Thalassa"),
--     ("Despina"),
--     ("Galatea"),
--     ("Larissa"),
--     ("S/2004 N 1"),
--     ("Proteus"),
--     ("Triton"),
--     ("Nereid"),
--     ("Halimede"),
--     ("Sao"),
--     ("Laomedeia"),
--     ("Psamathe"),
--     ("Neso");



