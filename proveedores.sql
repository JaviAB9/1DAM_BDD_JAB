DROP DATABASE IF EXISTS proveedores;
CREATE DATABASE proveedores;
USE proveedores;

CREATE TABLE proveedores (
	codigo INT PRIMARY KEY AUTO_INCREMENT,
    direccion VARCHAR (200),					/* En vez de String se sustituye por VARCHAR (aqui va la cantidad de caracteres le damos)*/
    ciudad VARCHAR (40),
    provincia VARCHAR (20)
);

CREATE TABLE categoria (
	codigo INT PRIMARY KEY AUTO_INCREMENT,		/* para cuando el codigo te pide un codigo */
    nombre VARCHAR (100) NOT NULL				/* siempre tiene que tener un valor */
);

CREATE TABLE pieza (
	codigo INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR (100) NOT NULL,
    color VARCHAR (20),
    precio DECIMAL (3,2),  							/* Sustituye el float */
    categoria INT,
		FOREIGN KEY (categoria) REFERENCES CATEGORIA (codigo)
);

CREATE TABLE proveedor_suministra_pieza (
	id_proveedor INT,
    id_pieza INT,
    cantidad INT NOT NULL,
    fecha DATE NOT NULL,
		PRIMARY KEY (id_proveedor, id_pieza, fecha),		/* Si hay varias es mejor para ver se hace asi, aunq tambien puede ponero a cada id y ya esta*/
		FOREIGN KEY (id_proveedor) REFERENCES PROVEEDORES (codigo),
        FOREIGN KEY (id_pieza) REFERENCES PIEZA (codigo)
);
    
    
    
    
    
    