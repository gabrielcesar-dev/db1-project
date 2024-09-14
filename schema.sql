CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(64) NOT NULL
);

CREATE TABLE movie (
    movie_id SERIAL PRIMARY KEY,
    title VARCHAR(64) NOT NULL
);

CREATE TABLE movie_category (
    movie_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    PRIMARY KEY (movie_id, category_id),
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
    FOREIGN KEY (category_id) REFERENCES category(category_id)
);

CREATE TABLE dvd (
    dvd_id SERIAL PRIMARY KEY,
    movie_id INTEGER NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id)
);

CREATE TABLE actor (
    actor_id SERIAL PRIMARY KEY,
    real_name VARCHAR(64) NOT NULL,
    birth_date DATE,
    sex CHAR(1) CHECK (sex IN ('M', 'F'))
);

CREATE TABLE customer (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(64) NOT NULL
);

CREATE TABLE address (
    address_id SERIAL PRIMARY KEY,
    street VARCHAR(64) NOT NULL,
    city VARCHAR(32) NOT NULL,
    state VARCHAR(32) NOT NULL,
    postal_code CHAR(9) NOT NULL,
    customer_id INTEGER NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE phone (
    phone_id SERIAL PRIMARY KEY,
    phone_number VARCHAR(20) NOT NULL UNIQUE,
    customer_id INTEGER NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE rental (
    rental_id SERIAL PRIMARY KEY,
    rental_date DATE NOT NULL,
    return_date DATE NOT NULL,
    customer_id INTEGER NOT NULL, 
    dvd_id INTEGER NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (dvd_id) REFERENCES dvd(dvd_id)
);

CREATE TABLE stars_in (
    movie_id INTEGER NOT NULL,
    actor_id INTEGER NOT NULL,
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
    FOREIGN KEY (actor_id) REFERENCES actor(actor_id)
);
