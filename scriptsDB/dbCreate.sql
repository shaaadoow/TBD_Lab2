-- Se crea la base de datos:

CREATE DATABASE voluntariado;

-- Se selecciona la base de datos recien creada

\c voluntariado;

CREATE EXTENSION postgis;


-- En caso existan las tablas se dropean

DROP TABLE IF EXISTS habilidad CASCADE;
DROP TABLE IF EXISTS emergencia CASCADE;
DROP TABLE IF EXISTS eme_habilidad CASCADE;
DROP TABLE IF EXISTS institucion CASCADE;
DROP TABLE IF EXISTS voluntario CASCADE;
DROP TABLE IF EXISTS estado_tarea CASCADE;
DROP TABLE IF EXISTS tarea CASCADE;
DROP TABLE IF EXISTS coordinador CASCADE;
DROP TABLE IF EXISTS equipamiento CASCADE;
DROP TABLE IF EXISTS vol_habilidad CASCADE;
DROP TABLE IF EXISTS tarea_habilidad CASCADE;
DROP TABLE IF EXISTS ranking CASCADE;

-- Se crean las tablas:

CREATE TABLE  habilidad (
    id     serial PRIMARY KEY,
    nombre    varchar(40),
    descripcion varchar(120),
	created_at timestamp default now(),
    updated_at timestamp default now()
);

CREATE INDEX idx_habilidad_nombre ON habilidad(nombre);


CREATE TABLE  emergencia (
    id     serial PRIMARY KEY,
    nombre    varchar(60),
    ubicacion   varchar(60),
    fecha       date,
    descripcion varchar(120),
	created_at timestamp default now(),
    updated_at timestamp default now()
);

ALTER TABLE emergencia ADD COLUMN coordenadas geometry(point);


CREATE INDEX idx_emergencia_nombre ON emergencia(nombre);

CREATE TABLE  eme_habilidad (
    id     serial PRIMARY KEY,
    id_emergencia integer references emergencia(id) ON DELETE CASCADE,
    id_habilidad integer references habilidad(id) ON DELETE CASCADE,
	created_at timestamp default now(),
    updated_at timestamp default now()
);

CREATE INDEX idx_id_emergencia ON eme_habilidad(id_emergencia);


CREATE TABLE IF NOT EXISTS institucion(
	id serial not null,
	razon_social varchar(20),
	created_at timestamp default now(),
    updated_at timestamp default now(),
	primary key(id)
);
CREATE INDEX idx_institucion_razon ON institucion(razon_social);

CREATE TABLE IF NOT EXISTS coordinador(
	id serial not null  ,
	nombre varchar(20),
	apellido varchar(20),
	estado_salud varchar(40),
	password varchar(60),
	correo_electronico  varchar(30),
	id_institucion int,
	created_at timestamp default now(),
    updated_at timestamp default now(),
	primary key(id),
	FOREIGN KEY (id_institucion) REFERENCES institucion(id) ON DELETE CASCADE
);
CREATE INDEX idx_coordinador_nombre ON coordinador(nombre);

CREATE TABLE IF NOT EXISTS estado_tarea(
	id serial not null,
	estado varchar(40),
	primary key(id),
	created_at timestamp default now(),
    updated_at timestamp default now()
);
CREATE INDEX idx_estado_tarea_estado ON estado_tarea(estado);

CREATE TABLE IF NOT EXISTS tarea(
	id serial not null,
	nombre varchar(40),
	descripcion varchar(120),
	id_estado_tarea int,
	id_emergencia int,
	primary key(id),
	FOREIGN KEY (id_estado_tarea) REFERENCES estado_tarea(id) ON DELETE CASCADE,
	FOREIGN KEY (id_emergencia) REFERENCES emergencia(id) ON DELETE CASCADE,
	created_at timestamp default now(),
    updated_at timestamp default now()
);
CREATE INDEX idx_tarea_nombre ON tarea(nombre);

ALTER TABLE tarea ADD COLUMN coordenadas geometry(point);

CREATE TABLE IF NOT EXISTS voluntario(
	id serial NOT NULL,
	PRIMARY KEY(id),
	estado_salud VARCHAR(200),
	nombre VARCHAR(40),
	apellido VARCHAR(40),
	correo_electronico 	VARCHAR(60),
	password VARCHAR(30),
	created_at timestamp default now(),
    updated_at timestamp default now()

);
CREATE INDEX idx_voluntario_correo ON voluntario(correo_electronico);

CREATE TABLE IF NOT EXISTS equipamiento(
	id serial NOT NULL,
	PRIMARY KEY(id),
	nombre VARCHAR(40),
	descripcion VARCHAR(120),
	id_voluntario integer,
	FOREIGN KEY(id_voluntario) REFERENCES voluntario(id) ON DELETE CASCADE,
	created_at timestamp default now(),
    updated_at timestamp default now()
);
CREATE INDEX idx_equipamiento_nombre ON equipamiento(nombre);

CREATE TABLE  vol_habilidad (
    id     serial NOT NULL, PRIMARY KEY(id),
    id_voluntario integer,
    FOREIGN KEY(id_voluntario) REFERENCES voluntario(id) ON DELETE CASCADE,
    id_habilidad integer,
    FOREIGN KEY(id_habilidad) REFERENCES habilidad(id) ON DELETE CASCADE,
	created_at timestamp default now(),
    updated_at timestamp default now()
);

--CREATE INDEX idx_id_voluntario ON habilidad(id_voluntario);

CREATE TABLE  tarea_habilidad (
    id     serial NOT NULL, PRIMARY KEY(id),
    id_tarea integer,
    FOREIGN KEY(id_tarea) REFERENCES tarea(id) ON DELETE CASCADE,
    id_eme_habilidad integer,
    FOREIGN KEY(id_eme_habilidad) REFERENCES eme_habilidad(id) ON DELETE CASCADE,
	created_at timestamp default now(),
    updated_at timestamp default now()
);

--CREATE INDEX idx_id_tarea ON habilidad(id_tarea);

CREATE TABLE  ranking (
    id     serial NOT NULL, PRIMARY KEY(id),
    puntos integer,
    id_tarea integer,
    FOREIGN KEY(id_tarea) REFERENCES tarea(id) ON DELETE CASCADE,
    id_voluntario integer,
    FOREIGN KEY(id_voluntario) REFERENCES voluntario(id) ON DELETE CASCADE,
    created_at timestamp default now(),
    updated_at timestamp default now()
);

CREATE TABLE  voluntario_tarea (
    id     serial NOT NULL, PRIMARY KEY(id),
    id_tarea integer,
    FOREIGN KEY(id_tarea) REFERENCES tarea(id) ON DELETE CASCADE,
    id_voluntario integer,
    FOREIGN KEY(id_voluntario) REFERENCES voluntario(id) ON DELETE CASCADE,
    created_at timestamp default now(),
    updated_at timestamp default now()
);
