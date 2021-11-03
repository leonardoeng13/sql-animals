/* Populate database with sample data. */

insert into animals values (default, 'Agumon', '20200203', 0, true, 10.23, CURRENT_USER, now()); 
insert into animals values (default, 'Gabumon', '20181115', 2, true, 8.00, CURRENT_USER, now());
insert into animals values (default, 'Pikachu', '20210107', 1, false, 15.04, CURRENT_USER, now());
insert into animals values (default, 'Devimon', '20170512', 5, true, 11.00, CURRENT_USER, now());

INSERT INTO ANIMALS VALUES (DEFAULT, 'Charmander','20200208', 0, false, -11.0, CURRENT_USER, now()), 
(DEFAULT, 'Plantmon', '20221115', 2, false,  -5.7, CURRENT_USER, now()), 
(DEFAULT, 'Squirtle', '19930402', 3, false, -12.13, CURRENT_USER, now()), 
(DEFAULT, 'Angemon', '20050612', 1, true, -45, CURRENT_USER, now()), 
(DEFAULT, 'Boarmon', '20050607', 7, true, 20.4, CURRENT_USER, now()),
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

INSERT INTO vets VALUES
(default, 'William Tatcher', 45,'20000423', CURRENT_USER, now()),
(default, 'Maisy Smith', 26, '20190117', CURRENT_USER, now()),
(default, 'Stephanie Mendez', 64, '19810504', CURRENT_USER, now()),
(default, 'Jack Harkness', 38, '20080608', CURRENT_USER, now());

INSERT INTO specializations VALUES
(default, (SELECT id_species FROM species WHERE name = 'Pokemon'), (SELECT id_vets FROM vets WHERE name = 'William Tatcher'), CURRENT_USER, now()),
(default, (SELECT id_species FROM species WHERE name = 'Pokemon'), (SELECT id_vets FROM vets WHERE name = 'Stephanie Mendez'),  CURRENT_USER, now()),
(default, (SELECT id_species FROM species WHERE name = 'Digimon'), (SELECT id_vets FROM vets WHERE name = 'Stephanie Mendez'),  CURRENT_USER, now()),
(default, (SELECT id_species FROM species WHERE name = 'Digimon'), (SELECT id_vets FROM vets WHERE name = 'Jack Harkness'), CURRENT_USER, now());

INSERT INTO visits VALUES 
(default, (SELECT id_species FROM animals WHERE name = 'Agumon'), (SELECT id_vets FROM vets WHERE name = 'William Tatcher'), '20200524', CURRENT_USER, now()),
(default, (SELECT id_species FROM animals WHERE name = 'Agumon'), (SELECT id_vets FROM vets WHERE name = 'Stephanie Mendez'), '20200722', CURRENT_USER, now()),
(default, (SELECT id_species FROM animals WHERE name = 'Gabumon'), (SELECT id_vets FROM vets WHERE name = 'Jack Harkness'), '20210202', CURRENT_USER, now()),
(default, (SELECT id_species FROM animals WHERE name = 'Pikachu'), (SELECT id_vets FROM vets WHERE name = 'Maisy Smith'), '20200105', CURRENT_USER, now()),
(default, (SELECT id_species FROM animals WHERE name = 'Pikachu'), (SELECT id_vets FROM vets WHERE name = 'Maisy Smith'), '20200508', CURRENT_USER, now()),
(default, (SELECT id_species FROM animals WHERE name = 'Pikachu'), (SELECT id_vets FROM vets WHERE name = 'Maisy Smith'), '20200514', CURRENT_USER, now()),
(default, (SELECT id_species FROM animals WHERE name = 'Devimon'), (SELECT id_vets FROM vets WHERE name = 'Stephanie Mendez'), '20210504', CURRENT_USER, now()),
(default, (SELECT id_species FROM animals WHERE name = 'Charmander'), (SELECT id_vets FROM vets WHERE name = 'Jack Harkness'), '20210224', CURRENT_USER, now()),
(default, (SELECT id_species FROM animals WHERE name = 'Plantmon'), (SELECT id_vets FROM vets WHERE name = 'Maisy Smith'), '20191221', CURRENT_USER, now()),
(default, (SELECT id_species FROM animals WHERE name = 'Plantmon'), (SELECT id_vets FROM vets WHERE name = 'William Tatcher'), '20200810', CURRENT_USER, now()),
(default, (SELECT id_species FROM animals WHERE name = 'Plantmon'), (SELECT id_vets FROM vets WHERE name = 'Maisy Smith'), '20210407', CURRENT_USER, now()),
(default, (SELECT id_species FROM animals WHERE name = 'Squirtle'), (SELECT id_vets FROM vets WHERE name = 'Stephanie Mendez'), '20190929', CURRENT_USER, now()),
(default, (SELECT id_species FROM animals WHERE name = 'Angemon'), (SELECT id_vets FROM vets WHERE name = 'Jack Harkness'), '20201003', CURRENT_USER, now()),
(default, (SELECT id_species FROM animals WHERE name = 'Angemon'), (SELECT id_vets FROM vets WHERE name = 'Jack Harkness'), '20201104', CURRENT_USER, now()),
(default, (SELECT id_species FROM animals WHERE name = 'Boarmon'), (SELECT id_vets FROM vets WHERE name = 'Maisy Smith'), '20190104', CURRENT_USER, now()),
(default, (SELECT id_species FROM animals WHERE name = 'Boarmon'), (SELECT id_vets FROM vets WHERE name = 'Maisy Smith'), '20190515', CURRENT_USER, now()),
(default, (SELECT id_species FROM animals WHERE name = 'Boarmon'), (SELECT id_vets FROM vets WHERE name = 'Maisy Smith'), '20200227', CURRENT_USER, now()),
(default, (SELECT id_species FROM animals WHERE name = 'Boarmon'), (SELECT id_vets FROM vets WHERE name = 'Maisy Smith'), '20200803', CURRENT_USER, now()),
(default, (SELECT id_species FROM animals WHERE name = 'Blossom'), (SELECT id_vets FROM vets WHERE name = 'Stephanie Mendez'), '20200524', CURRENT_USER, now()),
(default, (SELECT id_species FROM animals WHERE name = 'Blossom'), (SELECT id_vets FROM vets WHERE name = 'William Tatcher'), '20210111', CURRENT_USER, now());