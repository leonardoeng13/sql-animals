/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM  animals WHERE name AS "Animal Name" LIKE '%mon';
SELECT name AS "Animal Name" FROM animals WHERE date_of_birth BETWEEN '20160101' and '20191231'; 
SELECT name AS "Animal Name" FROM animals WHERE neutered IS TRUE AND escape_attempts < 3;
SELECT TO_CHAR( date_of_birth, 'MON DD YYYY')AS "Date of Birthday" FROM animals WHERE name IN ('Agumon','Pikachu');
SELECT name AS "Animal Name", escape_attempts AS "Attempts to Scape" FROM animals WHERE weight_kg >= 10.5;
SELECT * FROM  animals WHERE neutered IS TRUE;
SELECT * FROM  animals WHERE name NOT IN ('Gabumon');
SELECT * FROM  animals WHERE weight_kg BETWEEN 10.4 and 17.3;


UPDATE animals 
SET species = 'unspecified'
WHERE species IS NULL;

ROLLBACK;

UPDATE animals SET species = CASE
   WHEN name like '%mon' THEN 'digimon'
   WHEN name not like '%mon' THEN 'pokemon'
END
WHERE species IS NULL;

COMMIT;

DELETE FROM animals;

ROLLBACK; 

SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth >= '20220101';
SAVEPOINT animals_deleted;
UPDATE animals 
SET weight_kg = weight_kg * -1;
ROLLBACK TO animals_deleted;
UPDATE animals 
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;

SELECT CONCAT('Exist', ' ', COUNT(*), ' ', 'Animals here') AS "Animals quantity" FROM animals;

SELECT CONCAT(COUNT(*), ' ', 'Never tried to escape') AS "Escaped Animals" FROM animals WHERE escape_attempts <=0;

SELECT AVG(weight_kg) AS "Average Animal Weight" FROM animals;

SELECT name, species, neutered, escape_attempts as "Escape Attempts" FROM animals ORDER BY escape_attempts DESC LIMIT 1;

SELECT species as "Animal Type",
       MIN(weight_kg) AS "Minimum Weight",
       MAX(weight_kg) AS "Maximum Weight"
FROM animals
GROUP BY species;

SELECT species as "Animal Type",
       ROUND(AVG(escape_attempts)) AS "Average of Escape Attempts"
FROM animals
where date_of_birth between '19900101' and '20001231'
group by species;

SELECT ow.full_name AS "Owner", an.name AS "Animal"
FROM owners ow 
INNER JOIN animals AS an ON (an.id_owners = ow.id_owners)
WHERE ow.full_name = 'Melody Pond';

SELECT an.name AS "Animal Name", sp.name AS "Animal Specie"
FROM species sp
INNER JOIN animals AS an ON (an.id_species = sp.id_species)
WHERE sp.name = 'Pokemon';

SELECT ow.full_name AS "Owner", an.name AS "Animal", CASE WHEN an.id_owners IS NULL THEN 'Ownerless' END AS "Ownerless" 
FROM owners ow 
INNER JOIN animals AS an ON (an.id_owners = ow.id_owners);

SELECT  COUNT(*) AS "Animals quantity", 
        sp.name AS "Specie"
FROM    species sp
        INNER JOIN animals an
            ON an.id_species = sp.id_species 
GROUP   BY sp.name;

SELECT ow.full_name AS "Owner", an.name AS "Animal"
FROM owners ow 
INNER JOIN animals AS an ON (an.id_owners = ow.id_owners)
INNER JOIN species AS sp ON (sp.id_species = an.id_species )
WHERE ow.full_name = 'Jennifer Orwell'
AND sp.name = 'Digimon';

SELECT ow.full_name AS "Owner", an.name AS "Animal"
FROM owners ow 
INNER JOIN animals AS an ON (an.id_owners = ow.id_owners)
INNER JOIN species as sp ON (sp.id_species = an.id_species )
WHERE ow.full_name = 'Dean Winchester'
AND an.escape_attempts = 0;

SELECT  COUNT(*) as "Animals quantity", 
		ow.full_name as "Owner"
FROM    species sp
        INNER JOIN animals AS an ON (an.id_species = sp.id_species)
        INNER JOIN owners AS ow ON (ow.id_owners = an.id_owners)
GROUP   BY ow.full_name
ORDER BY COUNT(*) DESC 
LIMIT 1;



