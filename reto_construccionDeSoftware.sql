-- Reto Construcción de Software
-- Equipo 2

-- CREACION DE LA BASE DE DATOS
-- CREATE DATABASE reto_ConstrucciónDeSoftware;
-- FIN DE CREACION DE LA BASE DE DATOS

-- CREACION DE TABLAS
CREATE TABLE pais(
	id_pais int,
	pais varchar(50),
	PRIMARY KEY(id_pais)
);

CREATE TABLE estado(
	id_estado int,
	estado varchar(50),
	PRIMARY KEY(id_estado)
);

CREATE TABLE sexo(
	id_sexo int,
	sexo varchar(10),
	PRIMARY KEY(id_sexo)
);

CREATE TABLE color(
	id_color int,
	color varchar(8),
	PRIMARY KEY(id_color)
);

CREATE TABLE especialidad(
	id_especialidad int,
	especialidad varchar(50),
	PRIMARY KEY(id_especialidad)
);

CREATE TABLE autor(
	id_autor int,
	nombre varchar(100),
	apellido_paterno varchar(50),
	apellido_materno varchar(50),
	correo_electronico varchar(50),
	contraseña varchar(50),
	fecha_de_nacimiento date,
	fecha_de_ingreso timestamp,
	fecha_de_baja timestamp,
	id_pais int,
	id_estado int,
	id_sexo int,
	id_especialidad int,
	contacto_telefono_trabajo varchar(10),
	contacto_correo_electronico_trabajo varchar(100),
	contacto_otro varchar(256),
	seguidores int,
	comentarios varchar(256),
	PRIMARY KEY(id_autor),
	FOREIGN KEY(id_pais) REFERENCES pais(id_pais),
	FOREIGN KEY(id_estado) REFERENCES estado(id_estado),
	FOREIGN KEY(id_sexo) REFERENCES sexo(id_sexo),
	FOREIGN KEY(id_especialidad) REFERENCES especialidad(id_especialidad),
	UNIQUE(correo_electronico)
);

CREATE TABLE interes(
	id_interes int,
	id_color int,
	interes varchar(50),
	descripcion varchar(256),
	PRIMARY KEY(id_interes),
	FOREIGN KEY(id_color) REFERENCES color(id_color)
);

CREATE TABLE pagina(
	id_pagina int,
	id_autor int,
	id_interes int,
	video varchar(256),
	descripcion varchar(256),
	PRIMARY KEY(id_pagina),
	FOREIGN KEY(id_autor) REFERENCES autor(id_autor),
	FOREIGN KEY(id_interes) REFERENCES interes(id_interes)
);

CREATE TABLE usuario(
	id_usuario int,
	nombre varchar(100),
	apellido_paterno varchar(50),
	apellido_materno varchar(50),
	nickname_usuario varchar(50),
	contraseña varchar(50),
	correo_electronico varchar(50),
	fecha_de_nacimiento date,
	fecha_de_ingreso timestamp,
	id_pais int,
	id_estado int,
	id_sexo int,
	comentarios varchar(256),
	PRIMARY KEY(id_usuario),
	FOREIGN KEY(id_pais) REFERENCES pais(id_pais),
	FOREIGN KEY(id_estado) REFERENCES estado(id_estado),
	FOREIGN KEY(id_sexo) REFERENCES sexo(id_sexo),
	UNIQUE(nickname_usuario),
	UNIQUE(correo_electronico)
);

CREATE TABLE usuario_interes(
	id_usuario int,
	id_interes int,
	FOREIGN KEY(id_usuario) REFERENCES usuario(id_usuario),
	FOREIGN KEY(id_interes) REFERENCES interes(id_interes)
);

CREATE TABLE usuario_marcadores_paginas(
	id_usuario int,
	id_pagina int,
	marcador_comentario varchar(256),
	FOREIGN KEY(id_usuario) REFERENCES usuario(id_usuario),
	FOREIGN KEY(id_pagina) REFERENCES pagina(id_pagina)
);
-- FIN DE CREACION DE TABLAS