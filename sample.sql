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

SELECT * FROM person;
SELECT * FROM pet;
SELECT * FROM person_pet;

UPDATE pet SET name = "Zed's Dead Pet" WHERE id IN (
  SELECT pet.id
  FROM pet, person_pet, person
  WHERE
  person.id = person_pet.person_id AND
  pet.id = person_pet.pet_id AND
  pet.dead = 1 AND
  person.first_name = "Zed"
);
SELECT * FROM person;
SELECT * FROM pet;

REPLACE INTO pet (id, breed, name, age, dead)
  VALUES (0, "Parrot", "Fluffy", 1000, 0);

ALTER TABLE person ADD COLUMN height;
ALTER TABLE person ADD COLUMN weight;
SELECT * FROM person;
