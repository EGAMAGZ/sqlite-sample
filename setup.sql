CREATE TABLE movies (
    id INTEGER,
    title TEXT NOT NULL,
    year TEXT,
    PRIMARY KEY(id)
);
CREATE TABLE people (
    id INTEGER,
    name TEXT NOT NULL,
    birth TEXT,
    PRIMARY KEY(id)
);
CREATE TABLE stars (
    movie_id INTEGER NOT NULL,
    person_id INTEGER NOT NULL
);
CREATE TABLE directors (
    movie_id INTEGER NOT NULL,
    person_id INTEGER NOT NULL
);
CREATE TABLE ratings (
    movie_id INTEGER NOT NULL,
    rating REAL NOT NULL,
    votes INTEGER NOT NULL,
    PRIMARY KEY(movie_id)
);


INSERT INTO movies (title, year) VALUES ("Amores Perros", 2000);
INSERT INTO movies (title, year) VALUES ("Y Tu Mamá También", 2001);
INSERT INTO movies (title, year) VALUES ("El Infierno", 2010);
INSERT INTO movies (title, year) VALUES ("Nosotros los Nobles", 2013);
INSERT INTO movies (title, year) VALUES ("Roma", 2018);
INSERT INTO movies (title, year) VALUES ("Nuevo Orden", 2020);
INSERT INTO movies (title, year) VALUES ("Ya no estoy aquí", 2019);
INSERT INTO movies (title, year) VALUES ("La dictadura perfecta", 2014);
INSERT INTO movies (title, year) VALUES ("Instructions Not Included", 2013);
INSERT INTO movies (title, year) VALUES ("La Ley de Herodes", 1999);
INSERT INTO movies (title, year) VALUES ("Noche de Fuego", 2021);
INSERT INTO movies (title, year) VALUES ("Coco", 2017);
INSERT INTO movies (title, year) VALUES ("Matando Cabos", 2004);
INSERT INTO movies (title, year) VALUES ("La Delgada Línea Amarilla", 2015);
INSERT INTO movies (title, year) VALUES ("La Zona", 2007);


INSERT INTO ratings (movie_id, rating, votes) VALUES
    ((SELECT id FROM movies WHERE title = "Amores Perros"), 8.1, 110000);
INSERT INTO ratings (movie_id, rating, votes) VALUES
    ((SELECT id FROM movies WHERE title = "Y Tu Mamá También"), 7.6, 95000);
INSERT INTO ratings (movie_id, rating, votes) VALUES
    ((SELECT id FROM movies WHERE title = "El Infierno"), 8.2, 68000);
INSERT INTO ratings (movie_id, rating, votes) VALUES
    ((SELECT id FROM movies WHERE title = "Nosotros los Nobles"), 7.3, 74000);
INSERT INTO ratings (movie_id, rating, votes) VALUES
    ((SELECT id FROM movies WHERE title = "Roma"), 7.7, 140000);
INSERT INTO ratings (movie_id, rating, votes) VALUES
    ((SELECT id FROM movies WHERE title = "Nuevo Orden"), 6.4, 15000);
INSERT INTO ratings (movie_id, rating, votes) VALUES
    ((SELECT id FROM movies WHERE title = "Ya no estoy aquí"), 7.5, 26000);
INSERT INTO ratings (movie_id, rating, votes) VALUES
    ((SELECT id FROM movies WHERE title = "La dictadura perfecta"), 7.2, 39000);
INSERT INTO ratings (movie_id, rating, votes) VALUES
    ((SELECT id FROM movies WHERE title = "Instructions Not Included"), 7.5, 80000);
INSERT INTO ratings (movie_id, rating, votes) VALUES
    ((SELECT id FROM movies WHERE title = "La Ley de Herodes"), 8.0, 45000);
INSERT INTO ratings (movie_id, rating, votes) VALUES
    ((SELECT id FROM movies WHERE title = "Noche de Fuego"), 7.6, 18000);
INSERT INTO ratings (movie_id, rating, votes) VALUES
    ((SELECT id FROM movies WHERE title = "Coco"), 8.4, 290000);
INSERT INTO ratings (movie_id, rating, votes) VALUES
    ((SELECT id FROM movies WHERE title = "Matando Cabos"), 7.1, 42000);
INSERT INTO ratings (movie_id, rating, votes) VALUES
    ((SELECT id FROM movies WHERE title = "La Delgada Línea Amarilla"), 7.3, 9000);
INSERT INTO ratings (movie_id, rating, votes) VALUES
    ((SELECT id FROM movies WHERE title = "La Zona"), 7.5, 15000);


INSERT INTO people (name, birth) VALUES ("Gael García Bernal", 1978);
INSERT INTO people (name, birth) VALUES ("Diego Luna", 1979);
INSERT INTO people (name, birth) VALUES ("Luis Estrada", 1962); -- director de "El Infierno", "La Ley de Herodes", etc.
INSERT INTO people (name, birth) VALUES ("Damián Alcázar", 1953);
INSERT INTO people (name, birth) VALUES ("Alfonso Cuarón", 1961); -- director de "Y Tu Mamá También", "Roma"
INSERT INTO people (name, birth) VALUES ("Yalitza Aparicio", 1993);
INSERT INTO people (name, birth) VALUES ("Karla Souza", 1985);
INSERT INTO people (name, birth) VALUES ("Eugenio Derbez", 1961);
INSERT INTO people (name, birth) VALUES ("Verónica Castro", 1952);
INSERT INTO people (name, birth) VALUES ("Tenoch Huerta", 1981);
INSERT INTO people (name, birth) VALUES ("Adrián Ladrón", 1980);
INSERT INTO people (name, birth) VALUES ("Memo Villegas", 1984);
INSERT INTO people (name, birth) VALUES ("Ximena Romo", 1990);
INSERT INTO people (name, birth) VALUES ("Joaquín Cosío", 1962);
INSERT INTO people (name, birth) VALUES ("Héctor Bonilla", 1939);
INSERT INTO people (name, birth) VALUES ("Óscar Jaenada", 1975);
INSERT INTO people (name, birth) VALUES ("Fernando Eimbcke", 1970); -- director de "La Zona"
INSERT INTO people (name, birth) VALUES ("Issa López", 1971); -- directora reconocida, podría vincularse a "Noche de Fuego"
INSERT INTO people (name, birth) VALUES ("Michel Franco", 1979); -- director de "Nuevo Orden"
INSERT INTO people (name, birth) VALUES ("Alejandro González Iñárritu", 1963); -- director de "Amores Perros"
INSERT INTO people (name, birth) VALUES ("Gary Alazraki", 1978); -- director de "Nosotros los Nobles"
INSERT INTO people (name, birth) VALUES ("Fernando Frías de la Parra", 1980); -- director de "Ya no estoy aquí"
INSERT INTO people (name, birth) VALUES ("Tatiana Huezo", 1972); -- directora de "Noche de Fuego"
INSERT INTO people (name, birth) VALUES ("Manolo Caro", 1981); -- director de "La Delgada Línea Amarilla"
INSERT INTO people (name, birth) VALUES ("Alejandro Lozano", 1970); -- director de "Matando Cabos"
INSERT INTO people (name, birth) VALUES ("Lee Unkrich", 1967); -- director de "Coco"
INSERT INTO people (name, birth) VALUES ("Anthony Gonzalez", 2004); -- actor de "Coco"


INSERT INTO stars (person_id, movie_id) VALUES (
    (SELECT id FROM people WHERE name = "Gael García Bernal"),
    (SELECT id FROM movies WHERE title = "Amores Perros"));
INSERT INTO stars (person_id, movie_id) VALUES (
    (SELECT id FROM people WHERE name = "Gael García Bernal"),
    (SELECT id FROM movies WHERE title = "Y Tu Mamá También"));
INSERT INTO stars (person_id, movie_id) VALUES (
    (SELECT id FROM people WHERE name = "Diego Luna"),
    (SELECT id FROM movies WHERE title = "Y Tu Mamá También"));
INSERT INTO stars (person_id, movie_id) VALUES (
    (SELECT id FROM people WHERE name = "Damián Alcázar"),
    (SELECT id FROM movies WHERE title = "El Infierno"));
INSERT INTO stars (person_id, movie_id) VALUES (
    (SELECT id FROM people WHERE name = "Damián Alcázar"),
    (SELECT id FROM movies WHERE title = "La Ley de Herodes"));
INSERT INTO stars (person_id, movie_id) VALUES (
    (SELECT id FROM people WHERE name = "Luis Estrada"),
    (SELECT id FROM movies WHERE title = "La dictadura perfecta"));
INSERT INTO stars (person_id, movie_id) VALUES (
    (SELECT id FROM people WHERE name = "Karla Souza"),
    (SELECT id FROM movies WHERE title = "Nosotros los Nobles"));
INSERT INTO stars (person_id, movie_id) VALUES (
    (SELECT id FROM people WHERE name = "Eugenio Derbez"),
    (SELECT id FROM movies WHERE title = "Instructions Not Included"));
INSERT INTO stars (person_id, movie_id) VALUES (
    (SELECT id FROM people WHERE name = "Yalitza Aparicio"),
    (SELECT id FROM movies WHERE title = "Roma"));
INSERT INTO stars (person_id, movie_id) VALUES (
    (SELECT id FROM people WHERE name = "Tenoch Huerta"),
    (SELECT id FROM movies WHERE title = "Ya no estoy aquí"));
INSERT INTO stars (person_id, movie_id) VALUES (
    (SELECT id FROM people WHERE name = "Adrián Ladrón"),
    (SELECT id FROM movies WHERE title = "La Delgada Línea Amarilla"));
INSERT INTO stars (person_id, movie_id) VALUES (
    (SELECT id FROM people WHERE name = "Ximena Romo"),
    (SELECT id FROM movies WHERE title = "La Zona"));
INSERT INTO stars (person_id, movie_id) VALUES (
    (SELECT id FROM people WHERE name = "Joaquín Cosío"),
    (SELECT id FROM movies WHERE title = "Matando Cabos"));
INSERT INTO stars (person_id, movie_id) VALUES (
    (SELECT id FROM people WHERE name = "Óscar Jaenada"),
    (SELECT id FROM movies WHERE title = "Instructions Not Included"));
INSERT INTO stars (person_id, movie_id) VALUES (
    (SELECT id FROM people WHERE name = "Anthony Gonzalez"),
    (SELECT id FROM movies WHERE title = "Coco"));
INSERT INTO stars (person_id, movie_id) VALUES (
    (SELECT id FROM people WHERE name = "Gael García Bernal"),
    (SELECT id FROM movies WHERE title = "Coco"));


INSERT INTO directors (person_id, movie_id) VALUES (
    (SELECT id FROM people WHERE name = "Alejandro González Iñárritu"),
    (SELECT id FROM movies WHERE title = "Amores Perros"));
INSERT INTO directors (person_id, movie_id) VALUES (
    (SELECT id FROM people WHERE name = "Alfonso Cuarón"),
    (SELECT id FROM movies WHERE title = "Y Tu Mamá También"));
INSERT INTO directors (person_id, movie_id) VALUES (
    (SELECT id FROM people WHERE name = "Luis Estrada"),
    (SELECT id FROM movies WHERE title = "El Infierno"));
INSERT INTO directors (person_id, movie_id) VALUES (
    (SELECT id FROM people WHERE name = "Gary Alazraki"),
    (SELECT id FROM movies WHERE title = "Nosotros los Nobles"));
INSERT INTO directors (person_id, movie_id) VALUES (
    (SELECT id FROM people WHERE name = "Alfonso Cuarón"),
    (SELECT id FROM movies WHERE title = "Roma"));
INSERT INTO directors (person_id, movie_id) VALUES (
    (SELECT id FROM people WHERE name = "Michel Franco"),
    (SELECT id FROM movies WHERE title = "Nuevo Orden"));
INSERT INTO directors (person_id, movie_id) VALUES (
    (SELECT id FROM people WHERE name = "Fernando Frías de la Parra"),
    (SELECT id FROM movies WHERE title = "Ya no estoy aquí"));
INSERT INTO directors (person_id, movie_id) VALUES (
    (SELECT id FROM people WHERE name = "Luis Estrada"),
    (SELECT id FROM movies WHERE title = "La dictadura perfecta"));
INSERT INTO directors (person_id, movie_id) VALUES (
    (SELECT id FROM people WHERE name = "Eugenio Derbez"),
    (SELECT id FROM movies WHERE title = "Instructions Not Included"));
INSERT INTO directors (person_id, movie_id) VALUES (
    (SELECT id FROM people WHERE name = "Luis Estrada"),
    (SELECT id FROM movies WHERE title = "La Ley de Herodes"));
INSERT INTO directors (person_id, movie_id) VALUES (
    (SELECT id FROM people WHERE name = "Tatiana Huezo"),
    (SELECT id FROM movies WHERE title = "Noche de Fuego"));
INSERT INTO directors (person_id, movie_id) VALUES (
    (SELECT id FROM people WHERE name = "Fernando Eimbcke"),
    (SELECT id FROM movies WHERE title = "La Zona"));
INSERT INTO directors (person_id, movie_id) VALUES (
    (SELECT id FROM people WHERE name = "Manolo Caro"),
    (SELECT id FROM movies WHERE title = "La Delgada Línea Amarilla"));
INSERT INTO directors (person_id, movie_id) VALUES (
    (SELECT id FROM people WHERE name = "Alejandro Lozano"),
    (SELECT id FROM movies WHERE title = "Matando Cabos"));
INSERT INTO directors (person_id, movie_id) VALUES (
    (SELECT id FROM people WHERE name = "Lee Unkrich"),
    (SELECT id FROM movies WHERE title = "Coco"));
