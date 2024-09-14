-- 1. Liste todos os dados da tabela filme.

SELECT * FROM movie;

-- 2. Liste o nome de todos os atores do sexo masculino de forma ordenada.

SELECT real_name FROM actor 
    WHERE sex = 'M'
    ORDER BY real_name;

-- 3. Liste o nome de todos os atores que começam com a letra A.

SELECT real_name FROM actor
    WHERE real_name LIKE 'A%';

-- 4. Liste o nome dos filmes e suas respectivas categorias.

SELECT title, category_name AS category FROM movie 
    JOIN movie_category USING(movie_id)
    JOIN category USING(category_id);

-- 5. Liste o nome de todos os filmes de comédia de forma ordenada.

SELECT title FROM movie 
    JOIN movie_category USING(movie_id)
    JOIN category USING(category_id)
    WHERE category_name IN ('Comedy', 'Comedia')
    ORDER BY title;

-- 6. Liste o nome dos clientes que já alugaram filmes (os nomes não devem ser repetidos) de forma ordenada.

SELECT DISTINCT name FROM customer 
    WHERE customer_id IN (SELECT customer_id FROM rental)
    ORDER BY name;

-- 7. Quantas locações tem cadastrado no banco de dados?

SELECT COUNT(*) AS number_of_rentals FROM rental;

-- 8. Liste o nome dos clientes e a quantidade de locações realizadas por cada um respectivamente.

SELECT name, COUNT(rental_id) AS rental_count 
    FROM customer
    JOIN rental USING(customer_id)
    GROUP BY customer_id 
    ORDER BY rental_count DESC;

-- 9. Liste o nome do filme e a quantidade de atores de cada filme.

SELECT title, COUNT(actor_id) AS actor_count 
    FROM movie
    JOIN stars_in USING (movie_id)
    GROUP BY title;

-- 10. Liste o nome de todos os filmes (mesmo os filmes que não têm atores cadastrados) e a quantidade de atores de cada filme.

SELECT title, COUNT(actor_id) AS actor_count 
    FROM movie
    LEFT JOIN stars_in USING (movie_id)
    GROUP BY title;
