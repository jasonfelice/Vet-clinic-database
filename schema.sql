/* Database schema to keep the structure of entire database. */
create database vet_clinic;

CREATE TABLE animals (
    id INT,
    name varchar(100),
    date_of_birth date,
    escape_attempts INT,
    neutered boolean,
    weight_kg decimal,
    PRIMARY KEY(id)
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