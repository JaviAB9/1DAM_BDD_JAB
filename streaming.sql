/* JAVIER AYARZA BUENO 1º DAM*/

DROP DATABASE IF EXISTS streaming;
CREATE DATABASE streaming;
USE streaming;


-- TABLA USUARIO --
CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR (255) NOT NULL,
    pasword VARCHAR (255) NOT NULL,
    nombre VARCHAR (255) NOT NULL,
    apellido1 VARCHAR (255) NOT NULL,
    apellido2 VARCHAR (255) NULL,
    id_usuario_referido INT (255),
    FOREIGN KEY (id_usuario_referido) REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE CASCADE
);

-- TABLA VIDEO --
CREATE TABLE video (
	id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR (255) NOT NULL,
    duracion INT (255), CHECK (duracion >= 0),
    tipo ENUM ('Episodio', 'Pelicula')
);

-- TABLA SERIE --
CREATE TABLE serie (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR (255) NOT NULL
);

-- TABLA EPISODIO --
CREATE TABLE episodio (
	id INT PRIMARY KEY AUTO_INCREMENT,
    temporada INT (255) NOT NULL,
    numero INT (255) NOT NULL,
    id_video INT,
    FOREIGN KEY (id_video) REFERENCES serie (id) ON DELETE SET NULL ON UPDATE CASCADE
);

-- TABLA PELICULA --
CREATE TABLE pelicula (
	id INT PRIMARY KEY,
    puntuacion_imdb DECIMAL (5,2) 
);

-- TABLA GENERO --
CREATE TABLE genero (
	id INT PRIMARY KEY AUTO_INCREMENT, 
    nombre VARCHAR (255) NOT NULL
);

-- TABLA QUE COMBINA VIDEO Y GENERO --
CREATE TABLE video_pertenece_genero (
	id_video INT,
    id_genero INT,
	PRIMARY KEY (id_video, id_genero),
    FOREIGN KEY (id_video) REFERENCES video (id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (id_genero) REFERENCES genero (id) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE usuario_ve_video (
	id_usuario INT,
    id_video INT,
    fecha_hora DATE NOT NULL,
    PRIMARY KEY (id_usuario, id_video, fecha_hora),
    FOREIGN KEY (id_usuario) REFERENCES usuario ( id ),
    FOREIGN KEY (id_video) REFERENCES video ( id )
);


/* CAMBIOS */

-- 1 --
ALTER TABLE video ADD COLUMN calidad_video ENUM ('SD', 'HD', 'FullHD', '4K');
-- 2 --

-- 3 --
ALTER TABLE usuario ADD pasword CHAR (8);
-- 4 -- 









