-- SE borra database si existe
DROP DATABASE prueba;

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
-- Factura 1
    INSERT INTO factura (fecha,subtotal,iva,preciototal,idcliente) VALUES ('2020-06-17',1158,220.02,1378.02,1);
    INSERT INTO detalle (precioUnitario,cantidad,valortotal,idfactura,idproducto) VALUES (1059,1,1059,1,1);
    INSERT INTO detalle (precioUnitario,cantidad,valortotal,idfactura,idproducto) VALUES (99,1,99,1,6);

 -- Factura 2   
    INSERT INTO factura (fecha,subtotal,iva,preciototal,idcliente) VALUES ('2020-06-18',2195,417.05,2612.05,1);
    INSERT INTO detalle (precioUnitario,cantidad,valortotal,idfactura,idproducto) VALUES (599,2,1198,2,1);
    INSERT INTO detalle (precioUnitario,cantidad,valortotal,idfactura,idproducto) VALUES (799,1,799,2,2);
    INSERT INTO detalle (precioUnitario,cantidad,valortotal,idfactura,idproducto) VALUES (99,1,99,2,6);

-- cliente 2 , 3 facturas /3,  2 y 3 productos

-- Factura 3
    INSERT INTO factura (fecha,subtotal,iva,preciototal,idcliente) VALUES ('2020-06-18',2557,485.83,3042.05,2);
    INSERT INTO detalle (precioUnitario,cantidad,valortotal,idfactura,idproducto) VALUES (1059,1,1059,3,1);
    INSERT INTO detalle (precioUnitario,cantidad,valortotal,idfactura,idproducto) VALUES (599,1,599,3,4);
    INSERT INTO detalle (precioUnitario,cantidad,valortotal,idfactura,idproducto) VALUES (899,1,899,3,7);

-- Factura 4
    INSERT INTO factura (fecha,subtotal,iva,preciototal,idcliente) VALUES ('2020-06-18',898,170.62,1068.62,2);
    INSERT INTO detalle (precioUnitario,cantidad,valortotal,idfactura,idproducto) VALUES (799,1,799,4,5);
    INSERT INTO detalle (precioUnitario,cantidad,valortotal,idfactura,idproducto) VALUES (99,1,99,4,6);

--Factura 5
    INSERT INTO factura (fecha,subtotal,iva,preciototal,idcliente) VALUES ('2020-06-18',5579,1060.01,6639.01,2);
    INSERT INTO detalle (precioUnitario,cantidad,valortotal,idfactura,idproducto) VALUES (1059,1,1198,5,1);
    INSERT INTO detalle (precioUnitario,cantidad,valortotal,idfactura,idproducto) VALUES (1690,2,3380,5,2);
    INSERT INTO detalle (precioUnitario,cantidad,valortotal,idfactura,idproducto) VALUES (1140,1,1140,5,3);



-- cliente 3 , 1 facturas / 1 productos
    --Factura 6
    INSERT INTO factura (fecha,subtotal,iva,preciototal,idcliente) VALUES ('2020-06-18',99,18.81,117.81,3);
    INSERT INTO detalle (precioUnitario,cantidad,valortotal,idfactura,idproducto) VALUES (99,1,99,6,6);

-- cliente 4 , 4 facturas / 2,3,4 y 1 productos
   
    --Factura 7    - 2 productos
    INSERT INTO factura (fecha,subtotal,iva,preciototal,idcliente) VALUES ('2020-06-17',3196,607.24,3803.24,4);
    INSERT INTO detalle (precioUnitario,cantidad,valortotal,idfactura,idproducto) VALUES (899,2,1798,7,1);
    INSERT INTO detalle (precioUnitario,cantidad,valortotal,idfactura,idproducto) VALUES (699,2,1398,7,6);


    --Factura 8    - 3 productos
    INSERT INTO factura (fecha,subtotal,iva,preciototal,idcliente) VALUES ('2020-06-18',2637,501.03,3138.03,4);
    INSERT INTO detalle (precioUnitario,cantidad,valortotal,idfactura,idproducto) VALUES (1140,1,1140,8,3);
    INSERT INTO detalle (precioUnitario,cantidad,valortotal,idfactura,idproducto) VALUES (99,1,99,8,6);
    INSERT INTO detalle (precioUnitario,cantidad,valortotal,idfactura,idproducto) VALUES (699,2,1398,8,8);

    --Factura 9    - 4 productos

    INSERT INTO factura (fecha,subtotal,iva,preciototal,idcliente) VALUES ('2020-06-19',2895,550.05,3445.05,4);
    INSERT INTO detalle (precioUnitario,cantidad,valortotal,idfactura,idproducto) VALUES (599,1,599,9,4);
    INSERT INTO detalle (precioUnitario,cantidad,valortotal,idfactura,idproducto) VALUES (99,1,99,9,6);
    INSERT INTO detalle (precioUnitario,cantidad,valortotal,idfactura,idproducto) VALUES (799,1,799,9,5);
    INSERT INTO detalle (precioUnitario,cantidad,valortotal,idfactura,idproducto) VALUES (699,2,1398,9,8);

    --Factura 10   - 1 producto
    INSERT INTO factura (fecha,subtotal,iva,preciototal,idcliente) VALUES ('2020-06-18',99,18.81,117.81,4);
    INSERT INTO detalle (precioUnitario,cantidad,valortotal,idfactura,idproducto) VALUES (99,1,99,10,6);





-- CONSULTAS

-- ¿Qué cliente realizo la compra más cara?
SELECT a.nombre FROM Cliente a LEFT JOIN Factura b ON a.idcliente=b.idcliente
WHERE  b.preciototal = (SELECT max(preciototal) FROM factura);

-- ¿Qué cliente pago sobre 100 de monto?
SELECT DISTINCT(a.nombre) FROM Cliente a LEFT JOIN Factura b ON a.idcliente=b.idcliente
WHERE  b.preciototal > 100;

-- ¿Cuántos clientes han comprado el producto 6?
SELECT count(a.nombre) AS cantidad FROM Cliente a 
LEFT JOIN Factura b 
ON a.idcliente=b.idcliente LEFT JOIN detalle c 
ON b.idfactura=c.idfactura LEFT JOIN producto d
ON c.idproducto = d.idproducto
WHERE  d.idproducto = 6;



