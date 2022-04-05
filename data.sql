/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '2020-02-03', 0, true, 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '2018-11-15', 2, true, 8);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '2021-01-07', 1, false, 15.04);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', '2020-02-08', 0, false, 11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', '2021-11-15', 2, true, 5.7);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', '1993-04-02', 3, false, 12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', '2005-06-12', 1, true, 45);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', '2005-06-07', 7, true, 20.4);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', '1998-10-13', 3, true, 17);


INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);


INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');


UPDATE animals SET species_id = species.species_id FROM species WHERE animals.name LIKE '%mon' AND species.name = 'Digimon'
UPDATE animals SET species_id = species.species_id FROM species WHERE animals.name NOT LIKE '%mon' AND species.name = 'Pokemon'

UPDATE animals SET owners_id = owners.owners_id FROM owners WHERE animals.name = 'Agumon' AND owners.full_name = 'Sam Smith';
UPDATE animals SET owners_id = owners.owners_id FROM owners WHERE animals.name IN ('Gabumon', 'Pikachu') AND owners.full_name = 'Jennifer Orwell';
UPDATE animals SET owners_id = owners.owners_id FROM owners WHERE animals.name IN ('Devimon', 'Plantmon') AND owners.full_name = 'Bob';
UPDATE animals SET owners_id = owners.owners_id FROM owners WHERE animals.name IN ('Charmander', 'Squirtle', 'Blossom') AND owners.full_name = 'Melody Pond';
UPDATE animals SET owners_id = owners.owners_id FROM owners WHERE animals.name IN ('Angemon', 'Boarmon') AND owners.full_name = 'Dean Winchester';
