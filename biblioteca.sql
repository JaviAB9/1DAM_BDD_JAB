DROP DATABASE IF EXISTS biblioteca;
CREATE DATABASE biblioteca;
USE biblioteca;


CREATE TABLE autor (
	cod_autor INT PRIMARY KEY,
    nombre VARCHAR (50) NOT NULL
);    

CREATE TABLE libro (
	isbn VARCHAR (10) PRIMARY KEY,
    titulo VARCHAR (100) NOT NULL, 			/* Cuando es "null" tienes que meterle algo al dato */
    ano DATE NOT NULL,
    autor INT,
    FOREIGN KEY (autor) REFERENCES autor (cod_autor)		/* - DELETE CASCADE: Se elimina el dato principal y tambien los datos secundarios en otras tablas */
);

CREATE TABLE socio (
	cod_socio INT PRIMARY KEY,				/* AUTO_INCREMENT (calcula valores numericos y consecutivos)*/
    nombre VARCHAR (15),
    apellido VARCHAR (20),
    telefono INT (9)
);

CREATE TABLE prestamo (
	cod_prestamo INT PRIMARY KEY AUTO_INCREMENT,
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion DATE,
    libro VARCHAR (10),
    FOREIGN KEY (libro) REFERENCES libro (isbn)
);

ALTER TABLE socio ADD direccion VARCHAR (50);
ALTER TABLE libro MODIFY titulo VARCHAR (150) NOT NULL;
ALTER TABLE socio MODIFY telefono VARCHAR (9) NOT NULL;
ALTER TABLE socio DROP telefono;
ALTER TABLE prestamo ADD socio INT;
ALTER TABLE prestamo ADD FOREIGN KEY (socio) REFERENCES socio (cod_socio) ON UPDATE CASCADE; 	/* El apartado d */


/*DROP TABLE socio;  		BORRA TABLA */
/*TRUNCATE TABLE socio;  	VACIA TABLA */

