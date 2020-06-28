CREATE DATABASE editorial;

\c editorial;


CREATE TABLE lector(id SERIAL, apellido_parterno VARCHAR(20), apellido_materno VARCHAR(20), nombre VARCHAR(30),
PRIMARY KEY (id));


CREATE TABLE editorial(id SERIAL, editorial VARCHAR(20), PRIMARY KEY (id));


CREATE TABLE libro(cod_libro INT, titulo VARCHAR(100), id_editorial INT, 
PRIMARY KEY (cod_libro), 
FOREIGN KEY (id_editorial) REFERENCES editorial(id));

CREATE TABLE autor(id_autor SERIAL, autor VARCHAR(30), cod_libro INT,
PRIMARY KEY (id_autor), 
FOREIGN KEY (cod_libro) REFERENCES libro(cod_libro));

CREATE TABLE devolucion(id_devolucion SERIAL, fecha_devolucion DATE, cod_libro INT, id_lector INT,
PRIMARY KEY (id_devolucion),
FOREIGN KEY (cod_libro) REFERENCES libro(cod_libro),
FOREIGN KEY (id_lector) REFERENCES lector(id));


----- Insert registros tabla lector -------

INSERT INTO lector(apellido_parterno , apellido_materno, nombre) VALUES ('Pérez','Gomez', 'Juan');
INSERT INTO lector(apellido_parterno , apellido_materno, nombre) VALUES ('Ortega','Pereira', 'Margarita');
INSERT INTO lector(apellido_parterno , apellido_materno, nombre) VALUES ('Garcia','Contreras', 'Rosa');
INSERT INTO lector(apellido_parterno , apellido_materno, nombre) VALUES ('Lopez','Molina', 'Ana');


----- Insert registros tabla editorial -----

INSERT INTO editorial(editorial) VALUES ('UTHEA');
INSERT INTO editorial(editorial) VALUES ('Reverté');
INSERT INTO editorial(editorial) VALUES ('McGrawHill');
INSERT INTO editorial(editorial) VALUES ('MIR');


----- Insert regitros tabla libro ------

INSERT INTO libro(cod_libro, titulo, id_editorial) VALUES (515, 'Ecuaciones diferenciales para ingenieros y científicos',1);
INSERT INTO libro(cod_libro, titulo, id_editorial) VALUES (540, 'Química',2);
INSERT INTO libro(cod_libro, titulo, id_editorial) VALUES (530, 'Física',3);
INSERT INTO libro(cod_libro, titulo, id_editorial) VALUES (519, 'Estadísticas',3);
INSERT INTO libro(cod_libro, titulo, id_editorial) VALUES (512, 'Álgebra Lineal',4);


----- Insert registros tabla autor -----

INSERT INTO autor(autor, cod_libro) VALUES ('Lambe, C.', 515);
INSERT INTO autor(autor, cod_libro) VALUES ('Christen, Hans Rudolf', 540);
INSERT INTO autor(autor, cod_libro) VALUES ('Serway, Raymond A', 530);
INSERT INTO autor(autor, cod_libro) VALUES ('G Tranter, C. J.', 515);
INSERT INTO autor(autor, cod_libro) VALUES ('Murray Spiegel', 519);
INSERT INTO autor(autor, cod_libro) VALUES ('Voevodin, Valentin V', 512);


----- Insert regitros tabla devolucion -----

INSERT INTO devolucion(fecha_devolucion, cod_libro, id_lector) VALUES ('2019-09-15', 515, 1);
INSERT INTO devolucion(fecha_devolucion, cod_libro, id_lector) VALUES ('2019-08-23', 540, 2);
INSERT INTO devolucion(fecha_devolucion, cod_libro, id_lector) VALUES ('2019-09-24', 530, 3);
INSERT INTO devolucion(fecha_devolucion, cod_libro, id_lector) VALUES ('2019-09-18', 519, 4);
INSERT INTO devolucion(fecha_devolucion, cod_libro, id_lector) VALUES ('2019-09-17', 512, 1);



