CREATE TABLE curso(
id SERIAL, 
nombre VARCHAR(30), 
PRIMARY KEY (id)
);

CREATE TABLE alumno(
id SERIAL, 
nombre VARCHAR(30),
rut VARCHAR(10),
idcurso INT,
PRIMARY KEY (id),
FOREIGN KEY (idcurso) REFERENCES curso(id)
);

CREATE TABLE profesor(
id SERIAL, 
nombre VARCHAR(30),
departamento VARCHAR(55), 
PRIMARY KEY (id)
);

CREATE TABLE prueba(
id SERIAL, 
puntaje FLOAT,
idalumno INT,
idprofesor INT,
PRIMARY KEY (id),
FOREIGN KEY (idalumno) REFERENCES alumno(id),
FOREIGN KEY (idprofesor) REFERENCES profesor(id)
);

