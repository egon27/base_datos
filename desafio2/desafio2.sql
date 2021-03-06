-- 1. Crear base de datos llamada películas (1 punto)
    CREATE DATABASE peliculas;

    \c peliculas;
-- 2. Revisar los archivos peliculas.csv y reparto.csv para crear las tablas correspondientes,determinando la relación entre ambas tablas. (2 puntos)

CREATE TABLE peliculas(
id SERIAL, 
nombre VARCHAR(60), 
año_estreno SMALLINT, 
director VARCHAR(25),  
PRIMARY KEY (id)
);

CREATE TABLE repartos(    
idpelicula INT, 
nombreactor VARCHAR(30),
FOREIGN KEY (idpelicula) REFERENCES peliculas(id)
);

-- 3. Cargar ambos archivos a su tabla correspondiente (1 punto)

\copy peliculas FROM 'devel/Desarrollo Desafio latam/base_datos/desafio2/peliculas.csv' CSV HEADER ; 
\copy repartos FROM 'devel/Desarrollo Desafio latam/base_datos/desafio2/reparto.csv' CSV HEADER ;

-- 4. Listar todos los actores que aparecen en la película "Titanic", indicando el título de la película,año de estreno, director y todo el reparto. (0.5 puntos)
SELECT a.nombre as titulo, año_estreno, director, b.nombreactor  
FROM peliculas a LEFT JOIN repartos b 
ON a.id=b.idpelicula 
WHERE a.nombre = 'Titanic';

-- 5. Listar los titulos de las películas donde actúe Harrison Ford.(0.5 puntos)

SELECT a.nombre as titulos
FROM peliculas a LEFT JOIN repartos b 
ON a.id=b.idpelicula 
WHERE b.nombreactor = 'Harrison Ford';

-- 6. Listar los 10 directores mas populares, indicando su nombre y cuántas películas aparecen en eltop 100.(1 puntos)

SELECT  director , count(director) as Cantidad FROM peliculas GROUP BY director ORDER BY count(*) DESC LIMIT 10 ;

-- 7. Indicar cuantos actores distintos hay (1 puntos)

SELECT count(distinct(nombreactor)) as CANTIDAD_ACTORES FROM repartos;

-- 8. Indicar las películas estrenadas entre los años 1990 y 1999 (ambos incluidos) ordenadas portítulo de manera ascendente.(1 punto)

SELECT nombre as peliculas, año_estreno 
FROM peliculas WHERE año_estreno BETWEEN 1990 AND 1999 ORDER BY nombre ASC;


-- 9. Listar el reparto de las películas lanzadas el año 2001 (1 punto)

SELECT  b.nombreactor AS Reparto 
FROM peliculas a LEFT JOIN repartos b 
ON a.id=b.idpelicula 
WHERE a.año_estreno = 2001;

-- 10. Listar los actores de la película más nueva (1 punto)

SELECT  b.nombreactor AS Actores 
FROM peliculas a LEFT JOIN repartos b 
ON a.id=b.idpelicula 
WHERE a.año_estreno = (SELECT max(año_estreno) FROM peliculas);