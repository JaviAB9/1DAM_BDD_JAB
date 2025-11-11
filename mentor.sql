DROP DATABASE IF EXISTS mentor;
CREATE DATABASE mentor;
USE mentor;

CREATE TABLE AULA (
	cod INT PRIMARY KEY AUTO_INCREMENT,					/* AUTO INCREMENT: */
    nombre VARCHAR (50) NOT NULL,						/* NOT NULL: Cuando tiene un valor (50) */
    dirección VARCHAR (100) NOT NULL
);

CREATE TABLE ALUMNOS (
	email VARCHAR (75) PRIMARY KEY,
    dni VARCHAR (9) NOT NULL,
    nombre VARCHAR (50) NOT NULL,
    direccion VARCHAR (100) NOT NULL,
    telefono VARCHAR (12) NOT NULL,
    espanol BOOLEAN NOT NULL,
    cod_aula INT,  										/* Tiene que ser el mismo que arriba aqui seria INT */
    FOREIGN KEY (cod_aula) REFERENCES aula (cod)
);

