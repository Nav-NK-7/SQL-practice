SELECT email FROM customer
WHERE first_name='Jared' AND last_name='Ely';

SELECT * FROM film;
SELECT description FROM film
WHERE title='Airport Pollock';

SELECT * FROM address;

SELECT phone FROM address
WHERE address='1913 Hanoi Way';

SELECT customer_id FROM payment
ORDER BY payment_date
LIMIT 10;

SELECT COUNT(*) FROM film
WHERE rating='R'AND
replacement_cost BETWEEN 5 AND 15;

SELECT title,length FROM film
ORDER BY length 
LIMIT 5;

SELECT COUNT(title)FROM film
WHERE length <=50;

SELECT * FROM payment;

SELECT COUNT(amount) FROM payment
WHERE amount > 5;

SELECT COUNT(first_name) FROM actor
WHERE first_name LIKE 'P%';
SELECT * FROM customer;

SELECT COUNT(DISTINCT district)FROM address;
SELECT DISTINCT district FROM address;

SELECT COUNT(*) FROM film
WHERE title LIKE '%Truman%';

SELECT staff_id,COUNT(amount)FROM payment
GROUP BY staff_id;

SELECT rating,AVG(replacement_cost)FROM film
GROUP BY rating;

SELECT customer_id,SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY sum(amount)DESC
LIMIT 5;

SELECT customer_id,COUNT(amount) FROM payment
GROUP BY customer_id
HAVING COUNT(amount)>=40;

SELECT customer_id,SUM(amount) FROM payment
WHERE staff_id=2
GROUP BY customer_id
HAVING SUM(amount)>100;

SELECT customer_id,SUM(amount) FROM payment
WHERE staff_id=2
GROUP BY customer_id
HAVING SUM(amount)>=110;

SELECT * FROM film;
SELECT * FROM address;
SELECT * FROM customer;

SELECT COUNT(*) FROM film
WHERE title LIKE 'J%';

SELECT first_name,last_name,MAX(customer_id) FROM customer
WHERE first_name LIKE 'E%' AND address_id < 500
GROUP BY first_name,last_name
ORDER BY MAX(customer_id) DESC
LIMIT 1;

SELECT* FROM address;
SELECT * FROM customer;

SELECT customer.email ,address.district FROM address
INNER JOIN customer
ON address.address_id = customer.address_id
WHERE address.district='California';

SELECT title,first_name,last_name FROM actor
INNER JOIN film_actor
ON actor.actor_id=film_actor.actor_id
INNER JOIN film
ON film_actor.film_id=film.film_id
WHERE first_name='Nick' AND
last_name='Wahlberg';