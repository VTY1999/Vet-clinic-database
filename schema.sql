CREATE DATABASE vet_clinic;
CREATE TABLE animals (
   id SERIAL PRIMARY KEY,
   name VARCHAR(255),
   date_of_birth DATE,
   escape_attempts INT,
   neutered BOOLEAN,
   weight_kg DECIMAL
);
ALTER TABLE animals ADD COLUMN species VARCHAR(250);

CREATE TABLE owners(
   id SERIAL PRIMARY KEY NOT NULL,
   full_name VARCHAR(255),
   age INT
);

CREATE TABLE species(
   id SERIAL PRIMARY KEY NOT NULL,
   name VARCHAR(255)
   );


ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INT,
ADD CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id);
ALTER TABLE animals ADD COLUMN owner_id INT,
ADD CONSTRAINT fk_owners FOREIGN KEY(owner_id) REFERENCES owners(id); 

CREATE TABLE vets(
   id SERIAL PRIMARY KEY,
   name VARCHAR(255),
   age INT,
   date_of_graduation DATE
   );

CREATE TABLE specializations (
   species_id int,
    vets_id int,
    CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id),
    CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id)
   );

CREATE TABLE visits (
    animals_id int,
    vets_id int,
    date_of_visit date,
    CONSTRAINT fk_animals FOREIGN KEY(animals_id) REFERENCES animals(id),
    CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id)
   ); 