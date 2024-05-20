CREATE TABLE country (
country_id number(3) PRIMARY KEY,
country_name varchar(20) NOT NULL );

CREATE TABLE owners (
tc_no number(11) PRIMARY KEY,
owner_name varchar(25) NOT NULL,
owner_surname varchar(25) NOT NULL,
owner_phone number(11) UNIQUE,
owner_mail varchar(50),
owner_gender varchar(2),
owner_birthdate DATE,
country_id number(3),
CONSTRAINT owner_country_FK FOREIGN KEY (country_id) 
REFERENCES country (country_id) ENABLE );

CREATE TABLE passports (
passport_no char(7) PRIMARY KEY,
passport_type char(1),
passport_validdate DATE,
passport_issueddate DATE,
country_id number(3),
tc_no number(11),
CONSTRAINT passport_country_FK FOREIGN KEY (country_id) 
REFERENCES country (country_id) ENABLE,
CONSTRAINT passport_owner_FK FOREIGN KEY (tc_no) 
REFERENCES owners (tc_no) ENABLE );

CREATE TABLE animal (
animal_id number(3) PRIMARY KEY,
animal_name varchar(25),
animal_age number(3),
animal_type varchar(15),
animal_species varchar (25),
animal_gender varchar(10),
animal_color varchar(15),
animal_birthdate DATE,
tc_no number(11),
CONSTRAINT animal_owner_FK FOREIGN KEY (tc_no) 
REFERENCES owners (tc_no) ENABLE );

CREATE TABLE chip_info (
chip_no number(6) PRIMARY KEY,
chip_status char(1) NOT NULL,
chip_date DATE,
passport_no char(7),
animal_id number(3),
CONSTRAINT chip_passport_FK FOREIGN KEY (passport_no) 
REFERENCES passports	 (passport_no) ENABLE,
CONSTRAINT chip_animal_FK FOREIGN KEY (animal_id) 
REFERENCES animal	 (animal_id) ENABLE );