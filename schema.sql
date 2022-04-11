/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    name varchar(100),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL NOT NULL DEFAULT 0,
    PRIMARY KEY(id)
);

CREATE TABLE owners (
    owners_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    full_name VARCHAR (100) NOT NULL,
    age INT,
    PRIMARY KEY(owners_id)
);

CREATE TABLE species (
    species_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    name VARCHAR (100) NOT NULL,
    PRIMARY KEY(species_id)
);

ALTER TABLE animals ADD COLUMN species varchar(100);
ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals 
ADD species_id INT, 
ADD owners_id INT,
ADD CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(species_id) ON DELETE CASCADE,
ADD CONSTRAINT fk_owners FOREIGN KEY (owners_id) REFERENCES owners (owners_id) ON DELETE CASCADE;

CREATE TABLE vets (
    vets_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    name VARCHAR (100) NOT NULL,
    age INT,
    date_of_graduation DATE,
    PRIMARY KEY(vets_id)
);

CREATE TABLE specializations (
   species_id int,
    vets_id int,
    FOREIGN KEY (species_id) REFERENCES species (species_id),
    FOREIGN KEY (vets_id) REFERENCES vets (vets_id)
   );

CREATE TABLE visits (
    animals_id int,
    vets_id int,
    date_of_visit date,
    FOREIGN KEY(animals_id) REFERENCES animals (id),
    FOREIGN KEY(vets_id) REFERENCES vets (vets_id)
   );

ALTER TABLE owners ADD COLUMN email VARCHAR(120);
   
CREATE INDEX visits_animals_id_idx ON visits(animals_id);

CREATE INDEX visits_vets_id_idx ON visits(vets_id);

CREATE INDEX visits_owners_id_idx ON owners(email)