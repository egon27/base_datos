CREATE TABLE departamento(
id SERIAL, 
nombre VARCHAR(30), 
PRIMARY KEY (id)
);

CREATE TABLE trabajador(
id SERIAL, 
nombre VARCHAR(30),
rut VARCHAR(10),
direccion VARCHAR(255),
iddepartamento INT,
PRIMARY KEY (id),
FOREIGN KEY (iddepartamento) REFERENCES departamento(id)
);

CREATE TABLE liquidacion(
id SERIAL, 
rutaArchivoDrive VARCHAR(255),
idtrabajador INT,
PRIMARY KEY (id),
FOREIGN KEY (idtrabajador) REFERENCES trabajador(id)
);



