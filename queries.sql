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

SELECT  an.name AS "Pet Patient", age(current_date, an.date_of_birth) AS Age, 
        ow.full_name AS "Owner", ve.name AS "Pet Vet", 
        max(vi.date_of_visit) AS "Last Visit"
FROM animals an
JOIN owners AS ow ON (an.id_owners = ow.id_owners)
JOIN species AS sp ON (sp.id_species = an.id_species)
JOIN visits AS vi ON (vi.id_animals = an.id_animals)
JOIN vets AS ve ON (ve.id_vets = vi.id_vets)
WHERE ve.name = 'William Tatcher'
GROUP BY an.name, an.date_of_birth, ow.full_name, ve.name, vi.date_of_visit
ORDER BY vi.date_of_visit DESC
LIMIT 1;

SELECT count(*) AS "How many different animals did?"
FROM animals an
JOIN owners AS ow ON (an.id_owners = ow.id_owners)
JOIN species AS sp ON (sp.id_species = an.id_species)
JOIN visits AS vi ON (vi.id_animals = an.id_animals)
JOIN vets AS ve ON (ve.id_vets = vi.id_vets)
WHERE ve.name = 'Stephanie Mendez'

SELECT ve.name AS "Vet Name", sp.name AS "Specialist in:"
FROM vets AS ve
LEFT JOIN specializations AS spec ON (spec.id_vets = ve.id_vets)
LEFT JOIN species AS sp ON (sp.id_species = spec.id_species);

SELECT an.name AS "Pet Patient", age(current_date, an.date_of_birth) AS Age, ow.full_name AS "Owner", ve.name AS "Pet Vet", max(vi.date_of_visit) AS "Last Visit"
FROM animals an
JOIN owners AS ow ON (an.id_owners = ow.id_owners)
JOIN species AS sp ON (sp.id_species = an.id_species)
JOIN visits AS vi ON (vi.id_animals = an.id_animals)
JOIN vets AS ve ON (ve.id_vets = vi.id_vets)
WHERE ve.name = 'Stephanie Mendez'
AND vi.date_of_visit between '20200401' AND '20200830'
GROUP BY an.name, an.date_of_birth, ow.full_name, ve.name, vi.date_of_visit


SELECT an.name AS "Pet Name",
	   age(current_date, an.date_of_birth) AS Age,
       Count(DISTINCT id_visits) AS "Total of Visits",
       ow.full_name AS "Owner", ve.name AS "Pet Vet"
FROM animals an
JOIN owners AS ow ON (an.id_owners = ow.id_owners)
JOIN species AS sp ON (sp.id_species = an.id_species)
JOIN visits AS vi ON (vi.id_animals = an.id_animals)
JOIN vets AS ve ON (ve.id_vets = vi.id_vets)
GROUP BY an.name, an.date_of_birth, ow.full_name,ve.name
ORDER BY "Total of Visits" DESC
LIMIT 1;

SELECT an.name AS "Pet Patient", age(current_date, an.date_of_birth) AS Age, ow.full_name AS "Owner", ve.name AS "Pet Vet", max(vi.date_of_visit) AS "First Visit"
FROM animals an
JOIN owners AS ow ON (an.id_owners = ow.id_owners)
JOIN species AS sp ON (sp.id_species = an.id_species)
JOIN visits AS vi ON (vi.id_animals = an.id_animals)
JOIN vets AS ve ON (ve.id_vets = vi.id_vets)
WHERE ve.name = 'Maisy Smith'
GROUP BY an.name, an.date_of_birth, ow.full_name, ve.name, vi.date_of_visit
ORDER BY vi.date_of_visit
LIMIT 1;

SELECT an.name AS "Pet Patient", age(current_date, an.date_of_birth) AS Age, ow.full_name AS "Owner", ve.name AS "Pet Vet", max(vi.date_of_visit) AS "Last Visit"
FROM animals an
JOIN owners AS ow ON (an.id_owners = ow.id_owners)
JOIN species AS sp ON (sp.id_species = an.id_species)
JOIN visits AS vi ON (vi.id_animals = an.id_animals)
JOIN vets AS ve ON (ve.id_vets = vi.id_vets)
GROUP BY an.name, an.date_of_birth, ow.full_name, ve.name, vi.date_of_visit
ORDER BY vi.date_of_visit DESC
LIMIT 1;

SELECT count(*) AS "How many visits each",
		ve.name as "Vet Name",
		sp.name as "Species:",
		an.name AS "Pet Patient"
FROM animals an
JOIN owners AS ow ON (an.id_owners = ow.id_owners)
JOIN species AS sp ON (sp.id_species = an.id_species)
JOIN visits AS vi ON (vi.id_animals = an.id_animals)
JOIN vets AS ve ON (ve.id_vets = vi.id_vets)
LEFT JOIN specializations as spec on (spec.id_vets = ve.id_vets)
WHERE spec.id_vets is null
GROUP BY ve.name, sp.name, an.name

SELECT count(sp.name) AS "How many calls?",
		sp.name as "Specialty Suggestion:",
		ve.name as "Vet Looking for specialty"
FROM animals an
JOIN owners AS ow ON (an.id_owners = ow.id_owners)
JOIN species AS sp ON (sp.id_species = an.id_species)
JOIN visits AS vi ON (vi.id_animals = an.id_animals)
JOIN vets AS ve ON (ve.id_vets = vi.id_vets)
LEFT JOIN specializations as spec on (spec.id_vets = ve.id_vets)
WHERE spec.id_vets is null
GROUP BY sp.name, ve.name
LIMIT 1;