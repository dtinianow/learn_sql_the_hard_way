DROP TABLE IF EXISTS person;
DROP TABLE IF EXISTS pet;
DROP TABLE IF EXISTS person_pet;

CREATE TABLE person (
    id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    age INTEGER
);
CREATE TABLE pet (
    id INTEGER PRIMARY KEY,
    name TEXT,
    breed TEXT,
    age INTEGER,
    dead INTEGER
);
CREATE TABLE person_pet (
    person_id INTEGER,
    pet_id INTEGER
);

INSERT INTO person (id, first_name, last_name, age)
    VALUES (0, "Zed", "Shaw", 37);
INSERT INTO person (id, first_name, last_name, age)
    VALUES (1, "David", "Tinianow", 25);
INSERT INTO person (id, first_name, last_name, age)
    VALUES (2, "Bob", "Smith", 50);
INSERT INTO pet (id, name, breed, age, dead)
    VALUES (0, "Fluffy", "Unicorn", 1000, 0);
INSERT INTO pet VALUES (1, "Gigantor", "Robot", 1, 1);
INSERT INTO pet (id, name, age, breed, dead)
    VALUES (2, "Oliver", 10, "Dog", 1);
INSERT INTO pet VALUES (3, "Froggy", "Frog", 15, 1);

INSERT INTO person_pet (person_id, pet_id) VALUES (0, 0);
INSERT INTO person_pet VALUES (0, 1);
INSERT INTO person_pet VALUES (1, 2);
INSERT INTO person_pet VALUES (2, 3);

ALTER TABLE person ADD COLUMN dead INTEGER;
ALTER TABLE person ADD COLUMN phone_number TEXT;
ALTER TABLE person ADD COLUMN salary FLOAT;
ALTER TABLE person ADD COLUMN dob DATETIME;
ALTER TABLE pet ADD COLUMN dob DATETIME;
ALTER TABLE person_pet ADD COLUMN purchased_on DATETIME;
ALTER TABLE pet ADD COLUMN parent INTEGER;

UPDATE person SET dead = 0, phone_number = "302-555-5555", salary = 55000, dob = date("1979-03-01") WHERE first_name = "Zed";
UPDATE person SET dead = 0, phone_number = "610-555-5555", salary = 0, dob = date("1991-04-11") WHERE first_name = "David";
UPDATE person SET dead = 1, phone_number = "N/A", salary = 100000, dob = date("1966-11-19") WHERE first_name = "Bob";
UPDATE pet SET dob = date("2000-01-01"), parent = 0 WHERE name = "Fluffy";
UPDATE pet SET dob = date("2007-02-12"), parent = 0 WHERE name = "Gigantor";
UPDATE pet SET dob = date("1994-07-31"), parent = 1 WHERE name = "Oliver";
UPDATE pet SET dob = date("1991-04-22"), parent = 2 WHERE name = "Froggy";
UPDATE person_pet SET purchased_on = date("2000-01-05") WHERE pet_id = 0;
UPDATE person_pet SET purchased_on = date("2009-06-10") WHERE pet_id = 1;
UPDATE person_pet SET purchased_on = date("1997-05-21") WHERE pet_id = 2;
UPDATE person_pet SET purchased_on = date("2015-12-20") WHERE pet_id = 3;
SELECT * FROM person;
SELECT * FROM pet;
SELECT * FROM person_pet;


SELECT name, parent FROM pet WHERE id IN (
  SELECT pet_id
  FROM person_pet
  WHERE purchased_on > date("2004-12-31")
);
