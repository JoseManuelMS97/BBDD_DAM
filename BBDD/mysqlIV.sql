DROP DATABASE IF EXISTS mysqlIV;

CREATE DATABASE mysqlIV;

USE mysqlIV

CREATE TABLE empresas(
horas numeric,
nombre varchar (20) NOT NULL UNIQUE,
CONSTRAINT PK_empresas PRIMARY KEY (nombre));

CREATE TABLE ordenadores(
ram numeric,
codigo VARCHAR(20),
CONSTRAINT PK_ordenadores PRIMARY KEY (codigo));

CREATE TABLE alumnos(
dni varchar(9),
nombre varchar (20) NOT NULL UNIQUE,
CONSTRAINT PK_alumnos PRIMARY KEY (dni));

CREATE TABLE pedidos(
proveedor varchar(20),
CONSTRAINT PK_pedidos PRIMARY KEY (proveedor));

CREATE TABLE impuestos(
entidad varchar(20),
id varchar (20),
CONSTRAINT PK_impuestos PRIMARY KEY (id));


