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

SELECT * FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owner_id = 4

SELECT * FROM animals
JOIN species ON animals.species_id = species.id
WHERE species_id = 1

SELECT * FROM animals
JOIN owners ON animals.owner_id = owners.id

SELECT species.name, COUNT(species_id)
FROM animals
JOIN species ON species_id = species.id
GROUP BY species.name

SELECT * from owners
JOIN animals ON owners.id = animals.owner_id
WHERE owners.id = 2

SELECT * from owners
JOIN animals ON owners.id = animals.owner_id
WHERE owners.id = 5 and animals.escape_attempts < 1

SELECT full_name, count(animals) AS owned_animals from animals
JOIN owners ON  animals.owner_id = owners.id
GROUP by owners.full_name
ORDER BY owned_animals DESC
LIMIT 1

SELECT animals.name FROM animals
    JOIN visits ON animals.id = visits.animal_id
    JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.date_of_visit desc
LIMIT 1;

SELECT count(distinct animal_id) FROM visits
         join vets vet on vet.id = visits.vet_id
WHERE vet.name = 'Stephanie Mendez';

SELECT vets.name AS name, splz.name AS specialization from vets
    LEFT JOIN specializations cu on vets.id = cu.vet_id
    LEFT JOIN species splz ON splz.id = cu.species_id;

SELECT animals.name FROM animals
         JOIN visits v on animals.id = v.animal_id
         JOIN vets v2 on v2.id = v.vet_id
WHERE v2.name = 'Stephanie Mendez'
  AND v.date_of_visit >= '2020-04-01'
  AND v.date_of_visit <= '2020-08-30';

SELECT animals.name, count(v.animal_id) AS count FROM animals
    JOIN visits v ON animals.id = v.animal_id
GROUP BY animal_id, animals.name
ORDER BY count DESC
LIMIT 1;

SELECT animals.name FROM animals
    JOIN visits cu ON animals.id = cu.animal_id
    JOIN vets vt ON vt.id = cu.vet_id
WHERE vt.name = 'Maisy Smith'
ORDER BY cu.date_of_visit
LIMIT 1;

SELECT animals.name AS animal_name, v2.name AS vet_name, v.date_of_visit AS visit_date
FROM animals
         JOIN visits v ON animals.id = v.animal_id
         JOIN vets v2 ON v2.id = v.vet_id
ORDER BY v.date_of_visit DESC
LIMIT 1;

SELECT count(v) FROM animals
         JOIN visits v ON animals.id = v.animal_id
         JOIN vets v2 ON v2.id = v.vet_id
         LEFT JOIN specializations s ON v2.id = s.vet_id
WHERE s.vet_id IS NULL;

SELECT s.name, count(s.name) AS count
FROM animals
         JOIN species s ON s.id = animals.species_id
         JOIN visits v ON animals.id = v.animal_id
         JOIN vets v2 ON v2.id = v.vet_id
WHERE v2.name = 'Maisy Smith'
GROUP BY s.name ORDER BY count DESC 
LIMIT 1;