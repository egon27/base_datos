
-- creacion de base de datos
CREATE DATABASE prueba;

-- conectar a la base de datos
\c prueba;

-- creacion de tabla cliente
CREATE TABLE Clientes(
    idCliente SERIAL, 
    nombre VARCHAR(25), 
    rut VARCHAR(10), 
    direccion VARCHAR(50),
    PRIMARY KEY (idCliente)
    ) ;

-- creacion de tabla factura
CREATE TABLE Facturas(                                                     
    idFactura SERIAL,                                                               
    fecha DATE,                                                                     
    subtotal INT,                                                                   
    iva INT,                                                                        
    preciototal FLOAT,                                                              
    idcliente INT,                                                                  
    PRIMARY KEY (idFactura),                                                        
    FOREIGN KEY (idcliente) REFERENCES Clientes(idcliente)                          
    );

-- se agrega tabla categorias
CREATE TABLE Categorias(
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
    FOREIGN KEY (idCategoria) REFERENCES Categorias(idCategoria)
    );

-- se agrega tabla detalle
CREATE TABLE Detalle(
    iddetalle SERIAL, 
    cantidad INT, 
    valortotal INT, 
    idfactura INT, 
    idproducto INT,
    PRIMARY KEY (iddetalle),
    FOREIGN KEY (idproducto) REFERENCES producto(idproducto),
    FOREIGN KEY (idfactura)  REFERENCES facturas(idfactura)
    );