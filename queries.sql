/*Queries that provide answers to the questions from all projects.*/

select * from animals where name as "Animal Name" like '%mon';

select name as "Animal Name" from animals where date_of_birth between '20160101' and '20191231'; 

select name as "Animal Name" from animals where neutered is true and escape_attempts < 3;

select to_char( date_of_birth, 'MON DD YYYY')as "Date of Birthday" from animals where name in ('Agumon','Pikachu');

select name as "Animal Name", escape_attempts as "Attempts to Scape" from animals where weight_kg >= 10.5;

select * from animals where neutered is true;

select * from animals where name not in ('Gabumon');

select * from animals where weight_kg between 10.4 and 17.3;


