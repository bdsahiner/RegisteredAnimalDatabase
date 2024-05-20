CREATE TABLE country (
    country_id NUMBER(3) PRIMARY KEY,
    country_name VARCHAR2(20) NOT NULL
);

CREATE TABLE owners (
    tc_no VARCHAR2(11) PRIMARY KEY,
    owner_name VARCHAR2(25) NOT NULL,
    owner_surname VARCHAR2(25) NOT NULL,
    owner_phone VARCHAR2(15) UNIQUE,
    owner_mail VARCHAR2(50),
    owner_gender CHAR(1),
    owner_birthdate DATE,
    country_id NUMBER(3),
    CONSTRAINT owner_country_FK FOREIGN KEY (country_id) 
        REFERENCES country (country_id)
);

CREATE TABLE passports (
    passport_no CHAR(7) PRIMARY KEY,
    passport_type CHAR(1),
    passport_validdate DATE,
    passport_issueddate DATE,
    country_id NUMBER(3),
    tc_no VARCHAR2(11),
    CONSTRAINT passport_country_FK FOREIGN KEY (country_id) 
        REFERENCES country (country_id),
    CONSTRAINT passport_owner_FK FOREIGN KEY (tc_no) 
        REFERENCES owners (tc_no)
);

CREATE TABLE animal (
    animal_id NUMBER(3) PRIMARY KEY,
    animal_name VARCHAR2(25),
    animal_age NUMBER(3),
    animal_type VARCHAR2(15),
    animal_species VARCHAR2(25),
    animal_gender VARCHAR2(10),
    animal_color VARCHAR2(15),
    animal_birthdate DATE,
    tc_no VARCHAR2(11),
    CONSTRAINT animal_owner_FK FOREIGN KEY (tc_no) 
        REFERENCES owners (tc_no)
);

CREATE TABLE chip_info (
    chip_no NUMBER(6) PRIMARY KEY,
    chip_status CHAR(1) NOT NULL,
    chip_date DATE,
    passport_no CHAR(7),
    animal_id NUMBER(3),
    CONSTRAINT chip_passport_FK FOREIGN KEY (passport_no) 
        REFERENCES passports (passport_no),
    CONSTRAINT chip_animal_FK FOREIGN KEY (animal_id) 
        REFERENCES animal (animal_id)
);
