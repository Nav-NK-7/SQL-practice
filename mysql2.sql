USE my_db;
CREATE TABLE jungle(
animal_id INT,
animal_name VARCHAR(50),
country VARCHAR(50));
SELECT * FROM jungle;
ALTER TABLE jungle
ADD CONSTRAINT PRIMARY KEY(animal_id);
DESC jungle;
ALTER TABLE jungle
MODIFY animal_id INT auto_increment;
INSERT INTO jungle (animal_name,country)
VALUES ("bear","usa"),("lion","russia"),("tiger","india");
DELETE FROM jungle;
SET SQL_SAFE_UPDATES=0;
ALTER TABLE jungle
AUTO_INCREMENT=1001;

CREATE TABLE vantara(
case_id INT PRIMARY KEY AUTO_INCREMENT,
case_name VARCHAR(50),
animal_id INT,
FOREIGN KEY(animal_id)REFERENCES jungle(animal_id));
DESC vantara;
ALTER TABLE vantara
DROP FOREIGN KEY vantara_ibfk_1;
ALTER TABLE vantara
ADD CONSTRAINT vantara_fk_1
FOREIGN KEY(animal_id)REFERENCES jungle(animal_id);
ALTER TABLE vantara
AUTO_INCREMENT=1001;
INSERT INTO vantara(case_name,animal_id)
VALUES("fever",1002),("leg pain",1001),("hip",1003);
INSERT INTO jungle(animal_name,country)
VALUES("hipy","chi");
SELECT * FROM vantara;
SELECT * FROM jungle
RIGHT JOIN vantara
ON jungle.animal_id=vantara.animal_id;
UPDATE vantara
SET case_name="bear"
WHERE case_id=1001;
ALTER TABLE vantara
RENAME COLUMN case_name TO animal_name;
SELECT * FROM vantara
UNION
SELECT * FROM jungle;
CREATE TABLE transactions(
trans_id INT PRIMARY KEY AUTO_INCREMENT,
amount DECIMAL(5,2),
first_name VARCHAR(50),
last_name VARCHAR(50));
ALTER TABLE transactions
MODIFY COLUMN last_name VARCHAR(50);
SELECT * FROM transactions;
INSERT INTO transactions(amount,first_name,last_name)
VALUES (20.22,"nav","kum"),(40.23,"aj","kum"),(39.23,"ms","doni"),(22.43,"vk","king"),(82.33,"sachin","ten");
SELECT COUNT(amount) AS counted_value
FROM transactions;
SELECT MAX(amount) AS max_amnt
FROM transactions;
SELECT MIN(amount) AS min_amnt
FROM transactions;
SELECT AVG(amount) AS avg_amnt
FROM transactions;
SELECT SUM(amount) AS TOTAL
FROM transactions;
SELECT CONCAT (first_name," ",last_name) AS full_name
FROM transactions;
SELECT * FROM transactions;
ALTER TABLE employees
ADD COLUMN job_title VARCHAR(50);
SELECT * FROM employees;
UPDATE employees
SET job_title="cooker"
WHERE emp_id=6;
SELECT * FROM employees WHERE hire_date < "2026-01-03" AND job_title="cooker";
SELECT * FROM employees WHERE job_title="teacher"  OR job_title="cooker";
SELECT * FROM employees WHERE NOT job_title="cooker";
SELECT * FROM employees WHERE hire_date BETWEEN "2026-01-03" AND "2026-01-05";
SELECT * FROM employees WHERE  job_title IN("cooker","master","teacher");
SELECT * FROM employees
WHERE first_name LIKE "n%";
SELECT * FROM employees
WHERE last_name LIKE "%r";
SELECT * FROM transactions 
ORDER BY amount ASC
SELECT * FROM transactions LIMIT 1;
SELECT * FROM employees 
ORDER BY first_name DESC LIMIT 1;
SELECT * FROM transactions LIMIT 2,1;
SELECT * FROM transactions
UNION
SELECT animal_name,animal_id FROM employees;
SELECT animal_name,animal_id FROM vantara
UNION 
SELECT animal_name,animal_id FROM jungle;
ALTER TABLE employees
ADD COLUMN supervisor_id INT;
UPDATE employees
SET supervisor_id=5
WHERE emp_id=6;
SELECT a.first_name,a.last_name, 
CONCAT(b.first_name," ",b.last_name)AS "reportsto"
 FROM employees AS a
LEFT JOIN employees AS b
ON a.supervisor_id = b.emp_id;
