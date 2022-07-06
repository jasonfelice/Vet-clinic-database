/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';
SELECT * from animals WHERE date_of_birth > '2016-1-1' and date_of_birth < '2019-12-21';
SELECT * from animals WHERE neutered = true and escape_attempts < 3;
SELECT date_of_birth from animals WHERE name = 'Agumon' or name ='Pikachu';
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;
SELECT * from animals WHERE neutered = true;
SELECT * from animals WHERE name NOT LIKE 'Gabumon';
SELECT * from animals WHERE weight_kg;
SELECT * from animals WHERE weight_kg >= 10.4 and weight_kg <= 17.3;

BEGIN
UPDATE animals
set species = 'unspecified'
WHERE species is Null
ROLLBACK

BEGIN
UPDATE animals
set species = 'digimon'
WHERE name LIKE '%mon'

UPDATE animals
set species = 'pokemon'
WHERE species is Null
COMMIT

BEGIN
DELETE from animals
ROLLBACK

BEGIN
DELETE from animals
WHERE date_of_birth > '2022-1-1'
SAVEPOINT delete_2022

UPDATE animals set weight_kg = weight_kg * -1;
ROLLBACK to savepoint delete_2022

UPDATE animals
set weight_kg = weight_kg * -1
WHERE weight_kg < 0
COMMIT

SELECT count(*) from animals
SELECT count(*) from animals WHERE escape_attempts = 0
SELECT avg(weight_kg) from animals

SELECT neutered, max(escape_attempts)
from animals
Group By neutered

SELECT species, min(weight_kg), max(weight_kg)
from animals
Group By species

SELECT species, avg(escape_attempts)
from animals
WHERE date_of_birth > '1990-1-1' and date_of_birth < '2000-12-31'
Group By species, date_of_birth;

