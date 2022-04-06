/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name like = '%mon';
SELECT * FROM animals WHERE extract(YEAR FROM date_of_birth) BETWEEN 2016 AND 2019;
SELECT * FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth AS "Date of Birth" FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE NOT name = 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

BEGIN;

UPDATE animals SET species = 'unspecified' WHERE species IS NULL;

ROLLBACK TRANSACTION;


BEGIN;      

UPDATE animals SET species = 'digimon' WHERE name like '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;

COMMIT;


BEGIN;

DELETE FROM animals;

ROLLBACK TRANSACTION;


BEGIN;

DELETE FROM animals WHERE date_of_birth > '2022-01-01';

SAVEPOINT animals_deleted;

UPDATE animals SET weight_kg = weight_kg * - 1;

ROLLBACK TO animals_deleted;

UPDATE animals SET weight_kg = weight_kg * - 1 WHERE weight_kg < 0;

COMMIT;


SELECT COUNT(id) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts <= 0;
SELECT AVG(weight_kg) FROM animals;

SELECT neutered, SUM(escape_attempts) FROM animals WHERE neutered = true OR neutered = false GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

SELECT species,
    SUM(escape_attempts),
    COUNT(escape_attempts),
    SUM(escape_attempts) / COUNT(escape_attempts) as Average FROM animals WHERE extract(YEAR FROM date_of_birth) BETWEEN 1990 AND 2000 GROUP BY species;


SELECT * FROM animals a INNER JOIN owners o ON a.owner_id = o.id WHERE o.full_name = 'Melody Pond';

SELECT * FROM animals a INNER JOIN species s ON a.species_id = s.id WHERE s.name = 'Pokemon';

SELECT * FROM owners o FULL OUTER JOIN animals a ON o.id = a.owner_id;

SELECT s.name, COUNT(*) FROM species s LEFT JOIN animals a ON s.id =  a.species_id GROUP BY s.name;

SELECT * FROM animals a INNER JOIN owners o ON a.owner_id = o.id WHERE o.full_name = 'Jennifer Orwell' 
  AND a.species_id = (SELECT id from species WHERE name = 'Digimon');

SELECT * FROM animals a INNER JOIN owners o ON a.owner_id = o.id WHERE o.full_name = 'Dean Winchester' 
AND a.escape_attempts <= 0;

SELECT o.full_name, COUNT(*) FROM owners o LEFT JOIN animals a ON o.id =  a.owner_id GROUP BY o.full_name
ORDER BY COUNT DESC LIMIT 1;

SELECT visits.vets_id, vets.name, animals.name, visits.date_of_visit FROM visits LEFT JOIN vets ON vets.vets_id = visits.vets_id
JOIN animals ON animals.id = visits.animals_id WHERE vets.name = 'William Tatcher' ORDER BY date_of_visit DESC LIMIT 1;

SELECT COUNT(visits.vets_id) FROM visits JOIN vets.vets_id = visits.vets_id
JOIN animals ON animals.id = visits.animals_id WHERE vets.name = 'Stephanie Mendez';

SELECT * FROM vets LEFT JOIN specializations ON specializations.vets_id = vets.vets_id

SELECT vets.name, visits.visit_id, animals.name, 
animals.id, visits.date_of_visit, 
vets.vets_id from vets JOIN visits ON visits.vets_id = vets.vets_id 
JOIN animals ON animals.id = visits.animals_id WHERE vets.name = 'Stephanie Mendez' AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

SELECT animals.name AS Name, COUNT(vets.animals_id) from visits JOIN animals ON animals.id = vets.animals_id JOIN vets ON vets.vets_id = vets.vets_id
GROUP BY animals.name;

SELECT visits.vets_id, vets.name, animals.name, visits.date_of_visit from visits LEFT JOIN vets ON vets.vets_id = visits.vets_id
JOIN animals ON animals.id = visits.animals_id WHERE vets.name = 'Maisy Smith' ORDER BY date_of_visit LIMIT 1;

SELECT visits.date_of_visit, visits.visit_id, animals.name, vets.name, vets.age, vets.date_of_graduation FROM visits 
LEFT JOIN animals ON animals.id = visits.animals_id RIGHT JOIN vets ON visits.vets_id = vets.vets_id ORDER BY date_of_visit DESC LIMIT 6

SELECT COUNT(*) AS number_of_visit_no_specialty from visits JOIN vets ON visits.vets_id = vets.vets_id
JOIN animals ON visits.animals_id = animals.id LEFT JOIN specializations ON vets.vets_id = specializations.vets_id AND animals.species_id = specializations.species_id
LEFT JOIN species ON species.species_id = specializations.species_id WHERE specializations.species_id != animals.species_id OR species.name IS NULL


SELECT species.name as specialization , COUNT(visits.animals_id) from visits
JOIN vets ON vets.id = visits.vets_id
JOIN animals ON animals.id = visits.animals_id
JOIN species ON species.id = animals.species_id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name; 
