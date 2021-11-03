/* Database schema to keep the structure of entire database. */

create database vet_clinic;

create table animals (
id serial,
name varchar(45),
date_of_birth date,
escape_attempts integer,
neutered boolean,
weight_kg decimal(10,4),
user_name varchar (45),
timestamp timestamp,
primary key (id)
);

ALTER TABLE animals ADD species varchar(30);

CREATE TABLE owners (
id SERIAL,
full_name VARCHAR(60) NOT NULL,
age INT NOT NULL,
user_name VARCHAR (45),
timestamp TIMESTAMP,
PRIMARY KEY (id));

CREATE TABLE species (
id SERIAL,
name VARCHAR(45),
user_name VARCHAR (45),
timestamp TIMESTAMP,
PRIMARY KEY (id)
); 

ALTER TABLE owners RENAME COLUMN id TO id_owners;

ALTER TABLE species RENAME COLUMN id TO id_species;

ALTER TABLE animals RENAME COLUMN id TO id_animals;

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals 
ADD COLUMN id_owners INTEGER REFERENCES owners (id_owners),
ADD COLUMN id_species INTEGER REFERENCES species (id_species);

CREATE TABLE vets (
id_vets SERIAL,
name VARCHAR(60),
age INTEGER,
date_of_graduation DATE,
user_name VARCHAR (45),
timestamp TIMESTAMP,
PRIMARY KEY (id_vets)
);

CREATE TABLE specializations(
id_specializations SERIAL,
id_species INT REFERENCES species(id_species),
id_vets INT REFERENCES vets(id_vets),
user_name VARCHAR (45),
timestamp TIMESTAMP,
PRIMARY KEY(id_specializations)
);

CREATE TABLE visits(
id_visits SERIAL,
id_animals INT REFERENCES animals(id_animals),
id_vets INT REFERENCES vets(id_vets),
date_of_visit DATE,
user_name VARCHAR (45),
timestamp TIMESTAMP,
PRIMARY KEY(id_visits)
);