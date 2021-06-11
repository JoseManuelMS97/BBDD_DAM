DROP DATABASE IF EXISTS p3;

CREATE DATABASE p3;

USE p3

CREATE TABLE conductores(
dni VARCHAR(10),
numlicencia NUMERIC NOT NULL UNIQUE,
edad NUMERIC,
telefono NUMERIC,
CONSTRAINT PK_conductores PRIMARY KEY (dni));

CREATE TABLE camiones(
matricula VARCHAR(10),
marca VARCHAR(20),
peso NUMERIC,
CONSTRAINT PK_camiones PRIMARY KEY (matricula));

CREATE TABLE hijos(
dni VARCHAR(10),
nombre VARCHAR(20),
edad NUMERIC,
dniconductor VARCHAR(10) NOT NULL,
CONSTRAINT PK_hijos PRIMARY KEY (dni));

CREATE TABLE clientes(
cif VARCHAR(10),
nombre VARCHAR(20),
direccion VARCHAR(20),
matricula VARCHAR(10),
CONSTRAINT PK_clientes PRIMARY KEY (cif));

CREATE TABLE usan(
matricula VARCHAR(10),
dniconductor VARCHAR(10),
CONSTRAINT PK_usan PRIMARY KEY (matricula,dniconductor));

ALTER TABLE usan ADD
CONSTRAINT FK_usan FOREIGN KEY (matricula) REFERENCES camiones (matricula);

ALTER TABLE usan ADD
CONSTRAINT FK_usan2 FOREIGN KEY (dniconductor) REFERENCES conductores (dni);

ALTER TABLE clientes ADD
CONSTRAINT FK_clientes FOREIGN KEY (matricula) REFERENCES camiones (matricula);

ALTER TABLE hijos ADD
CONSTRAINT FK_hijos FOREIGN KEY (dniconductor) REFERENCES conductores (dni);

