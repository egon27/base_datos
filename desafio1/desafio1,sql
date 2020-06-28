-- Creacion de la base de datos

CREATE DATABASE post;

\c post;





-- Parte 2


-- tabla usuario
CREATE TABLE usuario(id SERIAL, nombre VARCHAR(25), PRIMARY KEY(id));


-- tabla post
CREATE TABLE post(
id SERIAL, 
usuario VARCHAR(25),
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
