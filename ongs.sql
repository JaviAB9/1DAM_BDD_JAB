DROP DATABASE IF EXISTS ongs;
CREATE DATABASE ongs;
USE ongs;

CREATE TABLE asociacion (
	cif CHAR (9) PRIMARY KEY,
    denominacion VARCHAR (20) NOT NULL,
    direccion VARCHAR (50),
    provincia VARCHAR (15),
    tipo ENUM ('Ecologista', 'Integracion', 'Desarrollo'),
    utilidadpublica ENUM ('SI', 'NO') DEFAULT 'SI'
);

CREATE TABLE socio (
	dni CHAR (9) PRIMARY KEY,
    nombre VARCHAR (30),
    direccion VARCHAR (50),
    provincia VARCHAR (30),
    fecha_alta DATE NOT NULL,
    cuota_mensual DECIMAL (7,5) NOT NULL CHECK (cuota_mensual >= 0),
    aportacion_anual DECIMAL (7,5), CHECK (aportacion_anual >= 0),
    cif CHAR (9),
    FOREIGN KEY (cif) REFERENCES asociacion (cif) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE trabajador (
	dni CHAR (9) PRIMARY KEY,
    nombre VARCHAR (30) NOT NULL,
    fingreso DATE,
    tipo ENUM ('Asalariado', 'Voluntario'),
    irpf INT CHECK (irpf BETWEEN 0 AND 100),
    pagos DECIMAL (9,2) CHECK (pagos >= 0),
    profesion VARCHAR (30),
    horas INT CHECK (horas BETWEEN 0 AND 100),
    edad INT CHECK (edad BETWEEN 18 AND 100)
);

CREATE TABLE proyecto (
	id INT PRIMARY KEY AUTO_INCREMENT,
    pais VARCHAR (20),
    zona VARCHAR (30),
    objetivo VARCHAR (100)
);

CREATE TABLE trabaja (
	dni CHAR (9),
    id_proyecto INT,
    PRIMARY KEY (dni, id_proyecto),
    FOREIGN KEY (dni) REFERENCES trabajador (dni),
    FOREIGN KEY (id_proyecto) REFERENCES proyecto (id)
);


/* CAMBIOS */

ALTER TABLE proyecto ADD COLUMN nro_beneficiario INT NOT NULL CHECK (nro_beneficiario >= 0);

ALTER TABLE proyecto ADD cif CHAR (9) NOT NULL;
ALTER TABLE proyecto ADD FOREIGN KEY (cif) REFERENCES asociacion (cif) ON DELETE RESTRICT ON UPDATE CASCADE;