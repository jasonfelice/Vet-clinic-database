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

CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    age INT,
    date_of_graduation DATE
)

CREATE TABLE specializations (
    species_id INT,
    vet_id INT,
    PRIMARY KEY (species_id, vet_id),
    CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(id),
    CONSTRAINT fk_vets FOREIGN KEY (vet_id) REFERENCES vets(id)
)

CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    animal_id INT,
    vet_id INT,
    date_of_visit DATE,
    CONSTRAINT fk_animal FOREIGN KEY (animal_id) REFERENCES animals(id),
    CONSTRAINT fk_vets FOREIGN KEY (vet_id) REFERENCES vets(id)
)