

CREATE DATABASE my_DB;


USE my_DB;

ALTER DATABASE my_DB READ ONLY=0;
DROP DATABASE my_db;
CREATE TABLE employees(
emp_id INT,
first_name VARCHAR(50),
last_name VARCHAR(50),
hourly_date DECIMAL(5,2),
hire_date DATE
);
SELECT * FROM employees;
RENAME TABLE employees TO workers;
DROP TABLE workers;

ALTER TABLE employees
ADD hourly_pay DECIMAL(5,2) AFTER last_name;
ALTER TABLE employees
RENAME COLUMN hourly_date TO email;

ALTER TABLE employees
MODIFY COLUMN email VARCHAR(50);
ALTER TABLE employees
DROP COLUMN email;
ALTER TABLE employees
ADD COLUMN email VARCHAR(50);
ALTER TABLE employees
MODIFY COLUMN email VARCHAR(50) AFTER hourly_pay;

INSERT INTO employees
VALUES (1,"nav","kumar",55.6,"nk@gmail",'2026-01-02')

INSERT INTO employees(emp_id,first_name,last_name,hourly_pay)
VALUES (2,"ms","d",52.6);
INSERT INTO employees
VALUES (3,"vj","kumar",45.6,"vj@gmail",'2026-01-03'),
       (4,"ij","kumar",35.6,"ij@gmail",'2026-01-04'),
       (5,"putin","kumar",25.6,"pk@gmail",'2026-01-06'),
       (6,"mj","kumar",48.6,"mj@gmail",'2026-01-05');
SELECT * FROM employees;
SELECT * FROM employees
WHERE emp_id=2;
SELECT * FROM employees
WHERE hourly_pay >= 40;
SELECT * FROM employees
WHERE emp_id!=2;
SELECT * FROM employees
WHERE email IS NOT NULL;
UPDATE employees
SET hourly_pay=21.2
WHERE emp_id=3;
SET SQL_SAFE_UPDATES = 0;
DELETE FROM employees
WHERE emp_id=2;
CREATE TABLE test(
my_date DATE,
my_time TIME,
my_datetime DATETIME);
SELECT * FROM test;
INSERT INTO test
VALUES(CURRENT_DATE(),CURRENT_TIME(),NOW());
ALTER TABLE test
ADD COLUMN correct_name VARCHAR(50);
UPDATE test
SET correct_name = "pak"
WHERE my_date="2026-02-02";
DELETE FROM test
WHERE my_time IS NULL;
ALTER TABLE test
MODIFY COLUMN correct_name VARCHAR(50) NOT NULL;

ALTER TABLE test
ADD CONSTRAINT UNIQUE(correct_name);
INSERT INTO test
VALUES	(current_date(),current_time(),now(),'lak'),
		(current_date(),current_time(),now(),'cak'),
		(current_date(),current_time(),now(),'vak'),
		(current_date(),current_time(),now(),'sak');
        
DELETE FROM test
WHERE correct_name='';   
DELETE FROM test
WHERE my_date IS NULL
  AND my_time IS NULL
  AND my_datetime IS NULL
  AND correct_name IS NULL;     
  SELECT * FROM test;
	DESC test;
    DELETE FROM test;
    ROLLBACK;