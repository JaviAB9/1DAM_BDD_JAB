DROP DATABASE IF EXISTS ;
CREATE DATABASE ;
USE ;

CREATE TABLE CLIENTE (
	dni INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR (25),
    apellido VARCHAR (25),
    direccion VARCHAR (150),
    fecha_nac DATE
);

CREATE TABLE producto (
	codigo INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR (25),
    precio_unidad DECIMAL (4,3)
);

CREATE TABLE proveedor (
	nif INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR (25),
    direccion VARCHAR (75)
);