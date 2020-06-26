
-- creacion de base de datos
CREATE DATABASE prueba;

-- conectar a la base de datos
\c prueba;

-- creacion de tabla cliente
CREATE TABLE Cliente(
    idCliente SERIAL, 
    nombre VARCHAR(25), 
    rut VARCHAR(10), 
    direccion VARCHAR(50),
    PRIMARY KEY (idCliente)
    ) ;

-- creacion de tabla factura
CREATE TABLE Factura(
    idFactura SERIAL,
    fecha DATE,
    subtotal FLOAT,
    iva FLOAT,
    preciototal FLOAT,
    idcliente INT,
    PRIMARY KEY (idFactura),
    FOREIGN KEY (idcliente) REFERENCES Cliente(idcliente)                          
    );

-- se agrega tabla categorias
CREATE TABLE Categoria(
    idCategoria SERIAL, 
    nombre VARCHAR(25), 
    descripcion VARCHAR(50),
    PRIMARY KEY (idcategoria)
    );

-- se agrega tabla producto
CREATE TABLE Producto(
    idproducto SERIAL, 
    nombre VARCHAR(25), 
    descripcion VARCHAR(50), 
    valorunitario INT, 
    idcategoria INT,
    PRIMARY KEY (idproducto),
    FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria)
    );

-- se agrega tabla detalle
CREATE TABLE Detalle(
    iddetalle SERIAL, 
    precioUnitario INT,
    cantidad INT, 
    valortotal INT, 
    idfactura INT, 
    idproducto INT,
    PRIMARY KEY (iddetalle),
    FOREIGN KEY (idproducto) REFERENCES producto(idproducto),
    FOREIGN KEY (idfactura)  REFERENCES factura(idfactura)
    );

    INSERT INTO Cliente (nombre, rut,direccion) VALUES ('Esteban Gonzalez','143404773','argomedo 379');
    INSERT INTO Cliente (nombre, rut,direccion) VALUES ('Juanito Perez','13288889','Santa lucia 20');
    INSERT INTO Cliente (nombre, rut,direccion) VALUES ('Amalia Castillo','154358976','Alameda 45');
    INSERT INTO Cliente (nombre, rut,direccion) VALUES ('Maria Fernandez','128954432','Matucana 100');
    INSERT INTO Cliente (nombre, rut,direccion) VALUES ('Jorge Gatica','176563432','Portugal 433');
    


    INSERT INTO categoria (nombre,descripcion) VALUES ('automiviles','automoviles de media gamma');
    INSERT INTO categoria (nombre,descripcion) VALUES ('bicicletas','biciletas de ciudad');
    INSERT INTO categoria (nombre,descripcion) VALUES ('motocicletas','motocicletas de carretera');

    INSERT INTO producto (nombre,descripcion,valorunitario,idCategoria) VALUES ('BMW 316','Sedan',1059,1);
    INSERT INTO producto (nombre,descripcion,valorunitario,idCategoria) VALUES ('Audi A5','Hatchback',1690,1);
    INSERT INTO producto (nombre,descripcion,valorunitario,idCategoria) VALUES ('MAZDA 6','Sedan',1140,1);
    INSERT INTO producto (nombre,descripcion,valorunitario,idCategoria) VALUES ('Oxfort x100','Mountainbike',599,2);
    INSERT INTO producto (nombre,descripcion,valorunitario,idCategoria) VALUES ('Trek Marlin 5','Mountainbike',799,2);
    INSERT INTO producto (nombre,descripcion,valorunitario,idCategoria) VALUES ('Juanito Mena','Ciudad',99,2);
    INSERT INTO producto (nombre,descripcion,valorunitario,idCategoria) VALUES ('Honda cdr250','carretera',899,3);
    INSERT INTO producto (nombre,descripcion,valorunitario,idCategoria) VALUES ('Yamaha vrf250','todoterreno',699,3);


-- cliente 1 , 2 facturas / 2 y 3 productos
    INSERT INTO factura (fecha,subtotal,iva,preciototal,idcliente) VALUES ('2020-06-17',1158,,,1);
    INSERT INTO detalle (precioUnitario,cantidad,valortotal,idfactura,idproducto) VALUES (1059,1,1059,1,1);
    INSERT INTO detalle (precioUnitario,cantidad,valortotal,idfactura,idproducto) VALUES (99,1,99,1,6);
    
    INSERT INTO factura (fecha,subtotal,iva,preciototal,idcliente) VALUES ('2020-06-17',,,,1);
    INSERT INTO detalle (precioUnitario,cantidad,valortotal,idfactura,idproducto) VALUES (1059,1,1059,1,1);
    INSERT INTO detalle (precioUnitario,cantidad,valortotal,idfactura,idproducto) VALUES (99,1,99,1,6);
    
-- cliente 2 , 3 facturas /3,  2 y 3 productos
    

-- cliente 3 , 1 facturas / 1 productos
    

-- cliente 4 , 4 facturas / 2,3,4 y 1 productos
    

-- CONSULTAS

-- ¿Qué cliente realizo la compra más cara?
SELECT a.nombre FROM Cliente a LEFT JOIN Factura b ON a.idcliente=b.idcliente
WHERE  b.preciototal = MAX(b.preciototal);

-- ¿Qué cliente pago sobre 100 de monto?
SELECT a.nombre FROM Cliente a LEFT JOIN Factura b ON a.idcliente=b.idcliente
WHERE  b.preciototal > 100;

-- ¿Cuántos clientes han comprado el producto 6?
SELECT count(a.nombre) AS cantidad FROM Cliente a 
LEFT JOIN Factura b 
ON a.idcliente=b.idcliente LEFT JOIN detalle c 
ON b.idfactura=c.idfactura LEFT JOIN producto d
ON c.idproducto = d.idproducto
WHERE  d.idproducto = 6;



