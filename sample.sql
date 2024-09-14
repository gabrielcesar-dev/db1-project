INSERT INTO category (category_name) VALUES
('Sci-Fi'),
('Drama'),
('Comedy'),
('Action');


INSERT INTO movie (title) VALUES
('Inception'),
('Cidade de Deus'),
('O Auto da Compadecida'),
('Central do Brasil'),
('Tropa de Elite');

INSERT INTO movie_category (movie_id, category_id)
VALUES
((SELECT movie_id FROM movie WHERE title = 'Inception'), 
 (SELECT category_id FROM category WHERE category_name = 'Sci-Fi')),

((SELECT movie_id FROM movie WHERE title = 'Cidade de Deus'),
 (SELECT category_id FROM category WHERE category_name = 'Drama')),

((SELECT movie_id FROM movie WHERE title = 'O Auto da Compadecida'), 
 (SELECT category_id FROM category WHERE category_name = 'Comedy')),

((SELECT movie_id FROM movie WHERE title = 'Central do Brasil'), 
 (SELECT category_id FROM category WHERE category_name = 'Drama')),

((SELECT movie_id FROM movie WHERE title = 'Tropa de Elite'), 
 (SELECT category_id FROM category WHERE category_name = 'Action'));


INSERT INTO dvd (movie_id)
VALUES
((SELECT movie_id FROM movie WHERE title = 'Inception')),
((SELECT movie_id FROM movie WHERE title = 'Cidade de Deus')),
((SELECT movie_id FROM movie WHERE title = 'O Auto da Compadecida')),
((SELECT movie_id FROM movie WHERE title = 'Central do Brasil')),
((SELECT movie_id FROM movie WHERE title = 'Tropa de Elite'));

INSERT INTO actor (real_name, birth_date, sex) VALUES
('Leonardo DiCaprio', '1974-11-11', 'M'),
('Wagner Moura', '1976-06-27', 'M'),
('Fernanda Montenegro', '1929-10-16', 'F'),
('Selton Mello', '1972-12-30', 'M'),
('Leandro Firmino', '1978-06-23', 'M');

INSERT INTO customer (name) VALUES
('João Silva'),
('Maria Oliveira'),
('Carlos Souza'),
('Ana Costa'),
('Paulo Pereira');

INSERT INTO address (street, city, state, postal_code, customer_id) VALUES
('SQS 102 Bloco A', 'Brasília', 'DF', '00000-000', (SELECT customer_id FROM customer WHERE name = 'João Silva')),
('SQN 404 Bloco B', 'Brasília', 'DF', '00000-000', (SELECT customer_id FROM customer WHERE name = 'Maria Oliveira')),
('SHIS QI 15', 'Brasília', 'DF', '00000-000', (SELECT customer_id FROM customer WHERE name = 'Carlos Souza')),
('CLN 209, Bloco C', 'Brasília', 'DF', '00000-000', (SELECT customer_id FROM customer WHERE name = 'Ana Costa')),
('SIG Quadra 1', 'Brasília', 'DF', '00000-000', (SELECT customer_id FROM customer WHERE name = 'Paulo Pereira'));

INSERT INTO phone (phone_number, customer_id) VALUES
('(61) 98765-4321', (SELECT customer_id FROM customer WHERE name = 'João Silva')),
('(61) 99876-5432', (SELECT customer_id FROM customer WHERE name = 'Maria Oliveira')),
('(61) 91234-5678', (SELECT customer_id FROM customer WHERE name = 'Carlos Souza')),
('(61) 92345-6789', (SELECT customer_id FROM customer WHERE name = 'Ana Costa')),
('(61) 93456-7890', (SELECT customer_id FROM customer WHERE name = 'Paulo Pereira'));


INSERT INTO rental (rental_date, return_date, customer_id, dvd_id)
VALUES
('2024-08-01', '2024-08-05', 
 (SELECT customer_id FROM customer WHERE name = 'João Silva'), 
 (SELECT dvd_id FROM dvd WHERE movie_id = (SELECT movie_id FROM movie WHERE title = 'Inception'))),

('2024-08-02', '2024-08-06', 
 (SELECT customer_id FROM customer WHERE name = 'Maria Oliveira'), 
 (SELECT dvd_id FROM dvd WHERE movie_id = (SELECT movie_id FROM movie WHERE title = 'Cidade de Deus'))),

('2024-08-03', '2024-08-07', 
 (SELECT customer_id FROM customer WHERE name = 'Carlos Souza'), 
 (SELECT dvd_id FROM dvd WHERE movie_id = (SELECT movie_id FROM movie WHERE title = 'O Auto da Compadecida'))),

('2024-08-04', '2024-08-08', 
 (SELECT customer_id FROM customer WHERE name = 'Ana Costa'), 
 (SELECT dvd_id FROM dvd WHERE movie_id = (SELECT movie_id FROM movie WHERE title = 'Central do Brasil'))),

('2024-08-05', '2024-08-09', 
 (SELECT customer_id FROM customer WHERE name = 'Paulo Pereira'), 
 (SELECT dvd_id FROM dvd WHERE movie_id = (SELECT movie_id FROM movie WHERE title = 'Tropa de Elite')));

INSERT INTO stars_in (movie_id, actor_id)
VALUES
((SELECT movie_id FROM movie WHERE title = 'Inception'), 
 (SELECT actor_id FROM actor WHERE real_name = 'Leonardo DiCaprio')),

((SELECT movie_id FROM movie WHERE title = 'Tropa de Elite'), 
 (SELECT actor_id FROM actor WHERE real_name = 'Wagner Moura')),

((SELECT movie_id FROM movie WHERE title = 'Central do Brasil'), 
 (SELECT actor_id FROM actor WHERE real_name = 'Fernanda Montenegro')),

((SELECT movie_id FROM movie WHERE title = 'O Auto da Compadecida'), 
 (SELECT actor_id FROM actor WHERE real_name = 'Selton Mello')),

((SELECT movie_id FROM movie WHERE title = 'Cidade de Deus'), 
 (SELECT actor_id FROM actor WHERE real_name = 'Leandro Firmino'));
