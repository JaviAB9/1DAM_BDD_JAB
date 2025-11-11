DROP DATABASE IF EXISTS mentor;
CREATE DATABASE mentor;
USE mentor;

CREATE TABLE aula (
	cod INT PRIMARY KEY AUTO_INCREMENT,					/* AUTO INCREMENT: */
    nombre VARCHAR (50) NOT NULL,						/* NOT NULL: Cuando tiene un valor (50) */
    dirección VARCHAR (100) NOT NULL
);

CREATE TABLE alumnos (
	email VARCHAR (75) PRIMARY KEY,
    dni VARCHAR (9) NOT NULL,
    nombre VARCHAR (50) NOT NULL,
    direccion VARCHAR (100) NOT NULL,
    telefono VARCHAR (12) NOT NULL,
    espanol BOOLEAN NOT NULL,
    cod_aula INT,  										/* Tiene que ser el mismo que arriba aqui seria INT */
    FOREIGN KEY (cod_aula) REFERENCES aula (cod)
);

CREATE TABLE administrador_aula (
	dni VARCHAR (9) PRIMARY KEY,
    nombre VARCHAR (50) NOT NULL,
    email VARCHAR (75) NOT NULL
);

CREATE TABLE administrador_administra_aula (
	dni_administrador VARCHAR (9),
    cod_aula INT,
    PRIMARY KEY (dni_administrador, cod_aula),
    FOREIGN KEY (dni_administrador) REFERENCES administrador_aula (dni),
    FOREIGN KEY (cod_aula) REFERENCES aula (cod)
);

CREATE TABLE curso (
	nombre VARCHAR (100) PRIMARY KEY,
    libro VARCHAR (50) NULL,									/* NULL: Cuando es opcional*/
    url VARCHAR (100) NOT NULL
);

CREATE TABLE alumno_matricula_curso (
	dni_alumno VARCHAR (100),
    nombre_curso VARCHAR (100),
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NULL,
    PRIMARY KEY (email_alumno, nombre_curso),
    FOREIGN KEY (email_alumno) REFERENCES alumnos (email),
    FOREIGN KEY (nombre_curso) REFERENCES curso (nombre)
);

CREATE TABLE tutor (
	dni VARCHAR (9) PRIMARY KEY,
    nombre VARCHAR (50) NOT NULL,
    email VARCHAR (100) NOT NULL
);

CREATE TABLE tutor_tutoriza_curso (
	dni_tutor VARCHAR (9),
    nombre_curso VARCHAR (100),
    PRIMARY KEY (dni_tutor, nombre_curso),
    FOREIGN KEY (dni_tutor) REFERENCES tutor (dni),
    FOREIGN KEY (nombre_curso) REFERENCES curso (nombre)
);

CREATE TABLE tutor_coordina_tutor (
	dni_tutor VARCHAR (9),
    dni_coordinador VARCHAR (9),
    PRIMARY KEY (dni_tutor, dni_coordinador),
    FOREIGN KEY (dni_tutor) REFERENCES tutor (dni),
    FOREIGN KEY (dni_coordinador) REFERENCES tutor (dni)
);