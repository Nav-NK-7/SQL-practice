CREATE DATABASE nk;
USE nk;
ALTER DATABASE nk READ ONLY=1;
ALTER DATABASE nk READ ONLY=0;
DROP DATABASE nk;
CREATE TABLE students(
id INT,
first_name VARCHAR(50),
last_name VARCHAR(50)
);
SELECT * FROM students;
ALTER TABLE students
ADD COLUMN age INT;
ALTER TABLE students
RENAME COLUMN age TO grade;
ALTER TABLE students
MODIFY COLUMN grade VARCHAR(50);
DESC students;
ALTER TABLE students
MODIFY grade VARCHAR(50)
AFTER id;
ALTER TABLE students 
ADD COLUMN age INT;
ALTER TABLE students
DROP COLUMN grade;
INSERT INTO students
VALUES(1,"Michael","jordan"),(2,"lebron","james"),(3,"Kobe","bryant"),(4,"shaq","O'Neal");
SELECT * FROM students;
SELECT * FROM students
WHERE id=2;
SELECT first_name,last_name FROM students
WHERE id=4;
SET SQL_SAFE_UPDATES=0;
UPDATE students
SET age=NULL
WHERE id=2;
SELECT * FROM students
WHERE age >=20;
SELECT * FROM students
WHERE age !=20;
SELECT * FROM students
WHERE age IS NULL;
SELECT first_name FROM students
WHERE age IS NOT NULL;
SET AUTOCOMMIT=1;
COMMIT;
DELETE FROM students
WHERE id=4;
ROLLBACK;
CREATE TABLE neram(
my_date DATE,
my_time TIME,
my_datetime DATETIME
);
INSERT into neram
VALUES(CURRENT_DATE(),CURRENT_TIME(),NOW());
SELECT * FROM neram;
ALTER TABLE students
ADD CONSTRAINT UNIQUE(first_name);
DESC students;
SELECT * FROM students;
UPDATE students
SET first_name="Michael"
WHERE id=2;
UPDATE students
SET age=22
WHERE id=2;
ALTER TABLE students
MODIFY age INT NOT NULL;
DESC students;
INSERT INTO students(id,first_name,last_name,age)
VALUE(4,"naveen","kumar",45);
ALTER TABLE students
ADD CONSTRAINT chk_age CHECK(age>20);
INSERT INTO students(id,first_name,last_name,age)
VALUE(5,"msd","kumar",15);
ALTER TABLE students
DROP CHECK chk_age;
ALTER TABLE students
ADD COLUMN grade INT;
ALTER TABLE students
MODIFY grade INT DEFAULT 2; 
INSERT INTO students(id,first_name,last_name,age)
VALUE(6,"VK","kumar",15);
