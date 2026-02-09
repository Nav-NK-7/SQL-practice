USE my_db;
CREATE TABLE customers(
customer_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50),
salary INT
);
INSERT INTO customers(first_name,salary)
VALUES("Naveen",20000),("msd",40000),("vk",30000),("rohit",60000),("mahesh",30000);
SELECT * FROM customers;
CREATE TABLE orders(
order_id INT PRIMARY KEY AUTO_INCREMENT,
amount INT,
customer_id INT,
FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);
INSERT INTO orders(amount,customer_id)
VALUES(13000,3),(20000,2),(12000,4),(5000,1),(4500,5);
SELECT * FROM orders;

SELECT c.customer_id,c.salary,c.first_name,o.order_id,o.amount FROM customers as c
LEFT JOIN orders as o
ON c.customer_id=o.customer_id
UNION
SELECT c.customer_id,c.salary,c.first_name,o.order_id,o.amount FROM customers as c
RIGHT JOIN orders as o
ON c.customer_id=o.customer_id;

SELECT * FROM customers
ORDER BY customer_id;
ALTER TABLE customers
ADD COLUMN date_of_purchase DATE;
UPDATE customers
SET date_of_purchase='2000-03-01'
WHERE customer_id=2;
SELECT * FROM customers
ORDER BY date_of_purchase;

SELECT first_name,salary,date_of_purchase,
ROW_NUMBER() OVER (ORDER BY date_of_purchase)AS 'row no',
RANK() OVER (ORDER BY date_of_purchase) AS 'rank',
DENSE_RANK() OVER (ORDER BY date_of_purchase)AS 'dense rank'
FROM customers;

SELECT first_name,salary,date_of_purchase,
ROW_NUMBER() OVER (PARTITION BY salary ORDER BY date_of_purchase)
FROM customers;

SELECT customer_id,salary,
LAG(salary) OVER (ORDER BY customer_id)
FROM customers;

SELECT customer_id,salary,
LEAD(salary) OVER (ORDER BY customer_id)
FROM customers;

CREATE TABLE daily_weather(
temperature INT,
temp_date DATE
);
INSERT INTO daily_weather
VALUES(40,CURRENT_DATE()),(70,CURRENT_DATE()),(55,CURRENT_DATE()),(15,CURRENT_DATE()),(35,CURRENT_DATE()),(47,CURRENT_DATE());
SELECT * FROM daily_weather;

SELECT temperature,
CASE
WHEN temperature > 65 THEN 'shirt'
WHEN temperature < 40 THEN 'Jacket'
ELSE 'sweater' END AS clothing
FROM daily_weather;

SELECT first_name,LENGTH(first_name)AS 'Length'
FROM customers;
SELECT first_name,UPPER(first_name)AS 'upper'
FROM customers;
SELECT first_name,LOWER(first_name)AS 'upper'
FROM customers;
SELECT first_name,LEFT(first_name,3)
FROM customers;
SELECT first_name,RIGHT(first_name,3)
FROM customers;
SELECT first_name,SUBSTRING(first_name,2,3)
FROM customers;
SELECT first_name,REPLACE(first_name,'a','z')
FROM customers;
SELECT * FROM customers;
SELECT LOCATE('v','Naveen');


