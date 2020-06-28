-- 1. Crear Base de datos posts (1 punto)
CREATE DATABASE posts;

\c posts;

-- 2. Crear tabla post, con los atributos id, nombre de usuario, fecha de creación, contenido,descripción (1 punto)
CREATE TABLE post(
id SERIAL, 
nombreUsuario VARCHAR(30), 
fechaCreacion DATE, 
contenido VARCHAR(25), 
descripcion VARCHAR(100), 
PRIMARY KEY (id)
);

-- 3. Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos" (0.6 puntos)
INSERT INTO post(nombreUsuario, fechaCreacion,contenido,descripcion) VALUES ('Pamela', '2020-06-25', 'Catalogo libros','Libros poemas');
INSERT INTO post(nombreUsuario, fechaCreacion,contenido,descripcion) VALUES ('Pamela', '2020-06-27', 'Catalogo audios','musica clasica');
INSERT INTO post(nombreUsuario, fechaCreacion,contenido,descripcion) VALUES ('Carlos', '2020-06-28', 'Catalogo revistas','populares'); 

-- 4. Modificar la tabla post, agregando la columna título 
ALTER TABLE post ADD titulo VARCHAR(60);

-- 5. Agregar título a las publicaciones ya ingresadas ( (1 punto)

UPDATE post SET titulo='50 poemas' WHERE id=1;
UPDATE post SET titulo='5th sinfonia' WHERE id=2;
UPDATE post SET titulo='Condorito' WHERE id=3;

-- 6.- Insertar 2 posts para el usuario "Pedro" (0.4 puntos)

INSERT INTO post(nombreUsuario, fechaCreacion,contenido,descripcion,titulo) VALUES ('Pedro', '2020-06-28', 'Catalogo vinos','Cabernet','vinos Tinto');
INSERT INTO post(nombreUsuario, fechaCreacion,contenido,descripcion,titulo) VALUES ('Pedro', '2020-06-28', 'Catalogo cigarrillos','Lucky Strike','Suave');

-- 7. Eliminar el post de Carlos (1 punto)
DELETE FROM post WHERE nombreUsuario='Carlos';

-- 8. Ingresar un nuevo post para el usuario "Carlos" (0.6 puntos)
INSERT INTO post(nombreUsuario, fechaCreacion,contenido,descripcion,titulo) VALUES ('Carlos', '2020-06-28', 'Catologo automoviles','Audi coupe','Deportivo');






-- Parte 2


-- tabla usuario
CREATE TABLE usuario(id SERIAL, nombre VARCHAR(25), PRIMARY KEY(id));


-- tabla post
CREATE TABLE post(
id SERIAL, 
fecha_creacion DATE, 
contenido VARCHAR(25), 
descripcion VARCHAR(25), 
titulo VARCHAR(25), 
idusuario INT,
PRIMARY KEY (id),
FOREIGN KEY (idusuario) REFERENCES usuario(id)
);



-- tabla comentario

CREATE TABLE comentarios(
id SERIAL, 
fecha TIMESTAMP, 
contenido VARCHAR(25), 
idpost INT,
PRIMARY KEY (id), 
FOREIGN KEY (idpost) REFERENCES post(id)
);
