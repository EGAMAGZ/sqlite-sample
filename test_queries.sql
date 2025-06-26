-- 1. Películas con sus directores
SELECT 
    m.title,
    m.year,
    p.name as director
FROM movies m
JOIN directors d ON m.id = d.movie_id
JOIN people p ON d.person_id = p.id
ORDER BY m.year;

-- 2. Películas con sus actores principales
SELECT 
    m.title,
    m.year,
    p.name as actor
FROM movies m
JOIN stars s ON m.id = s.movie_id
JOIN people p ON s.person_id = p.id
ORDER BY m.title, p.name;

-- 3. Películas con rating y número de votos
SELECT 
    m.title,
    m.year,
    r.rating,
    r.votes
FROM movies m
JOIN ratings r ON m.id = r.movie_id
ORDER BY r.rating DESC;

-- 4. Directores y todas sus películas
SELECT 
    p.name as director,
    p.birth,
    m.title,
    m.year
FROM people p
JOIN directors d ON p.id = d.person_id
JOIN movies m ON d.movie_id = m.id
ORDER BY p.name, m.year;

-- 5. Actores y todas sus películas
SELECT 
    p.name as actor,
    p.birth,
    m.title,
    m.year
FROM people p
JOIN stars s ON p.id = s.person_id
JOIN movies m ON s.movie_id = m.id
ORDER BY p.name, m.year;


-- 6. Personas que son tanto actores como directores
SELECT 
    p.name,
    p.birth,
    COUNT(DISTINCT d.movie_id) as peliculas_dirigidas,
    COUNT(DISTINCT s.movie_id) as peliculas_actuadas
FROM people p
LEFT JOIN directors d ON p.id = d.person_id
LEFT JOIN stars s ON p.id = s.person_id
GROUP BY p.id, p.name, p.birth
HAVING peliculas_dirigidas > 0 AND peliculas_actuadas > 0
ORDER BY p.name;

-- 7. Top 5 películas mejor calificadas con director
SELECT 
    m.title,
    m.year,
    r.rating,
    r.votes,
    p.name as director
FROM movies m
JOIN ratings r ON m.id = r.movie_id
JOIN directors d ON m.id = d.movie_id
JOIN people p ON d.person_id = p.id
ORDER BY r.rating DESC, r.votes DESC
LIMIT 5;

-- 8. Películas de los años 2010s con información completa
SELECT 
    m.title,
    m.year,
    r.rating,
    dir.name as director,
    GROUP_CONCAT(act.name, ', ') as actors
FROM movies m
JOIN ratings r ON m.id = r.movie_id
JOIN directors d ON m.id = d.movie_id
JOIN people dir ON d.person_id = dir.id
LEFT JOIN stars s ON m.id = s.movie_id
LEFT JOIN people act ON s.person_id = act.id
WHERE CAST(m.year AS INTEGER) BETWEEN 2010 AND 2019
GROUP BY m.id, m.title, m.year, r.rating, dir.name
ORDER BY r.rating DESC;

-- 9. Conteo de películas por director
SELECT 
    p.name as director,
    p.birth,
    COUNT(d.movie_id) as total_peliculas,
    AVG(r.rating) as promedio_rating
FROM people p
JOIN directors d ON p.id = d.person_id
JOIN movies m ON d.movie_id = m.id
JOIN ratings r ON m.id = r.movie_id
GROUP BY p.id, p.name, p.birth
ORDER BY total_peliculas DESC, promedio_rating DESC; 