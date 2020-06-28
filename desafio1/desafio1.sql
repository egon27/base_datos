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
-- Para la parte 2 se normaliza la tabla post quedado la tabla usurio y post

-- tabla usuario
CREATE TABLE usuario(id SERIAL, nombre VARCHAR(25), PRIMARY KEY(id));

-- inserta los usuarios
INSERT INTO usuario(nombre) VALUES ('Pamela');
INSERT INTO usuario(nombre) VALUES ('Carlos');
INSERT INTO usuario(nombre) VALUES ('Pedro');



-- Se elimina la tabla post
DROP TABLE post;

-- tabla post
CREATE TABLE post(
id SERIAL, 
fechacreacion DATE, 
contenido VARCHAR(25), 
descripcion VARCHAR(25), 
titulo VARCHAR(25), 
idusuario INT,
PRIMARY KEY (id),
FOREIGN KEY (idusuario) REFERENCES usuario(id)
);

-- se insertan datos tabla post para trabajar en el nuevo modelo
INSERT INTO post(fechaCreacion,contenido,descripcion,titulo,idusuario) VALUES ('2020-06-25', 'Catalogo libros','Libros poemas','50 poemas',1);
INSERT INTO post(fechaCreacion,contenido,descripcion,titulo,idusuario) VALUES ('2020-06-27', 'Catalogo audios','musica clasica','5th sinfonia',1);
INSERT INTO post(fechaCreacion,contenido,descripcion,titulo,idusuario) VALUES ('2020-06-28', 'Catalogo revistas','populares','Condorito',2);
DELETE FROM post WHERE id=3; 
INSERT INTO post(fechaCreacion,contenido,descripcion,titulo,idusuario) VALUES ('2020-06-28', 'Catalogo vinos','Cabernet','vinos Tinto',3);
INSERT INTO post(fechaCreacion,contenido,descripcion,titulo,idusuario) VALUES ('2020-06-28', 'Catalogo cigarrillos','Lucky Strike','Suave',3);
INSERT INTO post(fechaCreacion,contenido,descripcion,titulo,idusuario) VALUES ('2020-06-28', 'Catologo automoviles','Audi coupe','Deportivo',2);

-- 9. Crear una nueva tabla, llamada comentarios, con los atributos id, fecha y hora de creación,contenido, que se relacione con la tabla posts. (1 punto)

CREATE TABLE comentarios(
id SERIAL, 
fecha TIMESTAMP, 
contenido VARCHAR(25), 
idpost INT,
PRIMARY KEY (id), 
FOREIGN KEY (idpost) REFERENCES post(id)
);

--10. Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos" (0.4 puntos)

INSERT INTO comentarios(fecha,contenido,idpost) VALUES ('2020-06-25 00:00:00','Pamela Comentario 1',1);
INSERT INTO comentarios(fecha,contenido,idpost) VALUES ('2020-06-25 00:00:00','Pamela Comentario 2',2);
INSERT INTO comentarios(fecha,contenido,idpost) VALUES ('2020-06-26 00:00:00','Carlos Comentario 1',6);
INSERT INTO comentarios(fecha,contenido,idpost) VALUES ('2020-06-26 00:00:00','Carlos Comentario 2',6);
INSERT INTO comentarios(fecha,contenido,idpost) VALUES ('2020-06-26 00:00:00','Carlos Comentario 3',6);
INSERT INTO comentarios(fecha,contenido,idpost) VALUES ('2020-06-26 00:00:00','Carlos Comentario 4',6);

-- 11. Crear un nuevo post para "Margarita" (1 punto)

    -- se inserta usuario margarita
    INSERT INTO usuario(nombre) VALUES ('Margarita');
    -- se inserta nuevo post
    INSERT INTO post(fechaCreacion,contenido,descripcion,titulo,idusuario) VALUES ('2020-06-28', 'Catologo flores','Margaritas silvestres','Flores',4);

-- 12. Ingresar 5 comentarios para el post de Margarita. (1 punto)

INSERT INTO comentarios(fecha,contenido,idpost) VALUES ('2020-06-27 00:00:00','Margarita Comentario 1',7);
INSERT INTO comentarios(fecha,contenido,idpost) VALUES ('2020-06-27 00:00:00','Margarita Comentario 2',7);
INSERT INTO comentarios(fecha,contenido,idpost) VALUES ('2020-06-27 00:00:00','Margarita Comentario 3',7);
INSERT INTO comentarios(fecha,contenido,idpost) VALUES ('2020-06-27 00:00:00','Margarita Comentario 4',7);
INSERT INTO comentarios(fecha,contenido,idpost) VALUES ('2020-06-27 00:00:00','Margarita Comentario 5',7);