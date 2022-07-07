/* Populate database with sample data. */

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (1, 'Agumon', '2020-2-03', 0, true, 10.23);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (2, 'Gabumon', '2018-11-15', 2, true, 8);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (3, 'Pikachu', '2017-1-07', 1, false, 15.04);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (4, 'Devimon', '2017-5-12', 5, true, 11);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
  VALUES
      (5, 'Charmander', '2020-2-08', 0, false, 11),
      (6, 'Plantmon', '2021-11-15', 2, true, 5.7),
      (7, 'Squirtle', '1993-4-02', 3, false, 12.13),
      (8, 'Angemon', '2005-6-12', 1, true, 45),
      (9, 'Boarmon', '2005-6-07', 7, true, 20.4),
      (10, 'Blossom', '1998-10-13', 3, true, 17),
      (11, 'Ditto', '2022-5-14', 4, true, 22);

INSERT INTO owners (full_name, age) VALUES (
    ('Sam Smith', 34),
    ('Jennifer Orwell', 19),
    ('Bob', 45),
    ('Melody Pond', 77),
    ('Dean Winchester', 14),
    ('Jodie Whittaker', 38)
);