/* Populate database with sample data. */

insert into animals values (default, 'Agumon', '20200203', 0, true, 10.23, CURRENT_USER, now()); 
insert into animals values (default, 'Gabumon', '20181115', 2, true, 8.00, CURRENT_USER, now());
insert into animals values (default, 'Pikachu', '20210107', 1, false, 15.04, CURRENT_USER, now());
insert into animals values (default, 'Devimon', '20170512', 5, true, 11.00, CURRENT_USER, now());

INSERT INTO ANIMALS VALUES (DEFAULT, 'Charmander','20200208', 0, false, -11.0, CURRENT_USER, now()), (DEFAULT, 'Plantmon', '20221115', 2, false,  -5.7, CURRENT_USER, now()), 
(DEFAULT, 'Squirtle', '19930402', 3, false, -12.13, CURRENT_USER, now()), (DEFAULT, 'Angemon', '20050612', 1, true, -45, CURRENT_USER, now()), (DEFAULT, 'Boarmon', '20050607', 7, true, 20.4, CURRENT_USER, now()),
(DEFAULT, 'Blossom', '19981013', 3, true, 17, CURRENT_USER, now());

INSERT INTO owners VALUES 
(default, 'Sam Smith', 34, CURRENT_USER, now()),
(default, 'Jennifer Orwell', 19, CURRENT_USER, now()),
(default, 'Bob', 45, CURRENT_USER, now()),
(default, 'Melody Pond', 77, CURRENT_USER, now()), 
(default, 'Dean Winchester', 14, CURRENT_USER, now()), 
(default, 'Jodie Whittaker', 38, CURRENT_USER, now());

INSERT INTO species VALUES
(default, 'Pokemon', CURRENT_USER, now()),
(default, 'Digimon', CURRENT_USER, now());

UPDATE animals
  SET id_species = (SELECT sp.id_species FROM species sp where sp.name='Digimon')
WHERE id_species is null
and name like '%mon';  
   

UPDATE animals
  SET id_species = (SELECT sp.id_species FROM species sp where sp.name='Pokemon')
WHERE id_species is null
and name not like '%mon';

UPDATE animals
SET id_owners = (SELECT id_owners from owners WHERE full_name = 'Sam Smith')
WHERE name = 'Agumon';

UPDATE animals
SET id_owners = (SELECT id_owners from owners WHERE full_name = 'Jennifer Orwell')
WHERE name = 'Gabumon' OR name = 'Pikachu';

UPDATE animals
SET id_owners = (SELECT id_owners from owners WHERE full_name = 'Bob')
WHERE name = 'Devimon' OR name = 'Plantmon';

UPDATE animals
SET id_owners = (SELECT id_owners from owners WHERE full_name = 'Melody Pond')
WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

UPDATE animals
SET id_owners = (SELECT id_owners from owners WHERE full_name = 'Dean Winchester')
WHERE name = 'Angemon'  OR name = 'Boarmon';

