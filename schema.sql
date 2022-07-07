/* Database schema to keep the structure of entire database. */
create database vet_clinic;

CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name varchar(100),
    date_of_birth date,
    escape_attempts INT,
    neutered boolean,
    weight_kg decimal
);

ALTER TABLE animals add species varchar(45);

CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name varchar(50),
    age INT
)

CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name varchar(25)
)

ALTER TABLE animals DROP COLUMN species
ALTER TABLE animals ADD species_id INT REFERENCES species(id);
ALTER TABLE animals ADD owner_id INT REFERENCES owners(id);

UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';

UPDATE animals SET owner_id = 1 WHERE id = 1
UPDATE animals SET owner_id = 2 WHERE id = 2 or id = 3
UPDATE animals SET owner_id = 3 WHERE id = 4 or id = 6
UPDATE animals SET owner_id = 4 WHERE id = 5 or id = 7 or id = 10
UPDATE animals SET owner_id = 5 WHERE id = 8 or id = 9