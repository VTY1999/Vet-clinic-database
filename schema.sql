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
ADD CONSTRAINT fk_owners FOREIGN KEY (owners_id) REFERENCES owners (owners_id) ON DELETE CASCADE