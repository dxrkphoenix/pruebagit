DROP DATABASE IF EXISTS PRACTICA28;
CREATE DATABASE IF NOT EXISTS PRACTICA28
DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

SHOW DATABASES;
USE PRACTICA28;

CREATE TABLE SERVICIO(
	clave INTEGER PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL
);

CREATE TABLE DEPENDENCIA(
	codigo INTEGER PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    funcion VARCHAR(200) NOT NULL,
    localizacion VARCHAR(100) NOT NULL,
    servicio INTEGER NOT NULL,
CONSTRAINT FK1_DEPENDENCIA_SERVICIO FOREIGN KEY (servicio) REFERENCES SERVICIO(clave) ON UPDATE CASCADE ON DELETE NO ACTION
);

CREATE TABLE CAMARA(
	dependencia INTEGER PRIMARY KEY,
    categoria VARCHAR(100) NOT NULL,
    capacidad INTEGER(100) NOT NULL
);

CREATE TABLE TRIPULACION(
	 codigo INTEGER PRIMARY KEY,
     nombre VARCHAR(200) NOT NULL,
     años INTEGER,
     procedencia VARCHAR(100),
     situacion VARCHAR(50) NOT NULL,
     dependencia INTEGER NOT NULL,
     camara INTEGER NOT NULL,
CONSTRAINT FK2_TRIPULACION_DEPENDECIA FOREIGN KEY (dependencia) REFERENCES DEPENDENCIA(codigo) ON UPDATE CASCADE ON DELETE NO ACTION,
CONSTRAINT FK3_TRIPULACION_CAMARA FOREIGN KEY (camara) REFERENCES CAMARA(dependencia) ON UPDATE CASCADE ON DELETE NO ACTION
);

CREATE TABLE PLANETA(
	codigo INTEGER PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    galaxia VARCHAR(100) NOT NULL,
    coordenadas VARCHAR(100) NOT NULL
);

CREATE TABLE RAZA(
	nombre VARCHAR(50) PRIMARY KEY,
    poblacionTotal INTEGER(200) NOT NULL,
    dimensiones INTEGER NOT NULL
);

CREATE TABLE POBLADO(
	planeta INTEGER NOT NULL,
    raza VARCHAR(50) NOT NULL,
    cantidadIndividual INTEGER(100) NOT NULL,
CONSTRAINT FK4_MULTIPLE PRIMARY KEY (planeta, raza),
CONSTRAINT FK5_POBLADO_RAZA FOREIGN KEY (raza) REFERENCES RAZA(nombre) ON UPDATE CASCADE ON DELETE NO ACTION,
CONSTRAINT FK6_POBLADO_PLANETA FOREIGN KEY (planeta) REFERENCES PLANETA(codigo) ON UPDATE CASCADE ON DELETE NO ACTION
);

CREATE TABLE VISITA(
	tripulacion INTEGER NOT NULL,
    planeta INTEGER NOT NULL,
    tiempo INTEGER NOT NULL,
CONSTRAINT FK7_MULTIPLE PRIMARY KEY (tripulacion, planeta),
CONSTRAINT FK8_VISITA_TRIPULACION FOREIGN KEY (tripulacion) REFERENCES TRIPULACION(codigo) ON UPDATE CASCADE ON DELETE NO ACTION,
CONSTRAINT FK9_VISITA_PLANETA FOREIGN KEY (planeta) REFERENCES PLANETA(codigo) ON UPDATE CASCADE ON DELETE NO ACTION
);

DESCRIBE SERVICIO;
DESCRIBE DEPENDENCIA;
DESCRIBE CAMARA;
DESCRIBE TRIPULACION;
DESCRIBE PLANETA;
DESCRIBE RAZA;
DESCRIBE POBLADO;
DESCRIBE VISITA;