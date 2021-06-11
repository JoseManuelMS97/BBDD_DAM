DROP DATABASE IF EXISTS p4;

CREATE DATABASE p4;

USE p4

CREATE TABLE departamentos(
nombre VARCHAR(20),
numero NUMERIC NOT NULL UNIQUE,
empdirige VARCHAR(20) NOT NULL UNIQUE,
fecha NUMERIC,
CONSTRAINT PK_departamentos PRIMARY KEY (nombre,empdirige));

CREATE TABLE empleados(
dni VARCHAR(10),
nombre VARCHAR(20) NOT NULL,
domicilio NUMERIC,
telefono NUMERIC,
sueldo NUMERIC,
fnac NUMERIC,
supervisor VARCHAR(20),
nombredepar VARCHAR(20),
CONSTRAINT PK_empleados PRIMARY KEY (dni));

CREATE TABLE proyectos(
nombre VARCHAR(20),
numero NUMERIC NOT NULL UNIQUE,
CONSTRAINT PK_proyectos PRIMARY KEY (nombre));

CREATE TABLE familiares(
dniemple VARCHAR(10),
nombre VARCHAR(20),
fnac NUMERIC,
parentesco VARCHAR(20),
CONSTRAINT PK_familiares PRIMARY KEY (nombre,dniemple));

CREATE TABLE controla(
nombrep VARCHAR(10),
nombredep VARCHAR(20) NOT NULL,
CONSTRAINT PK_controla PRIMARY KEY (nombrep,nombredep));

CREATE TABLE trabaja(
nombrep VARCHAR(20),
dniemp VARCHAR(10),
horas NUMERIC,
CONSTRAINT PK_trabaja PRIMARY KEY (nombrep,dniemp));

ALTER TABLE trabaja ADD
CONSTRAINT FK_trabaja FOREIGN KEY (nombrep) REFERENCES proyectos (nombre);

ALTER TABLE trabaja ADD
CONSTRAINT FK_trabaja2 FOREIGN KEY (dniemp) REFERENCES empleados (dni);

ALTER TABLE controla ADD
CONSTRAINT FK_controla FOREIGN KEY (nombrep) REFERENCES proyectos (nombre);

ALTER TABLE controla ADD
CONSTRAINT FK_controla3 FOREIGN KEY (nombredep) REFERENCES departamentos (nombre);

ALTER TABLE empleados ADD
CONSTRAINT FK_empleados FOREIGN KEY (supervisor) REFERENCES empleados (dni);

ALTER TABLE empleados ADD
CONSTRAINT FK_empleados2 FOREIGN KEY (nombredepar) REFERENCES departamentos (nombre);

ALTER TABLE empleados ADD
CONSTRAINT FK_empleados3 FOREIGN KEY (dni) REFERENCES departamentos (empdirige);

ALTER TABLE familiares ADD
CONSTRAINT FK_familiares FOREIGN KEY (dniemple) REFERENCES empleados (dni) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE departamentos ADD
CONSTRAINT FK_departamentos FOREIGN KEY (empdirige) REFERENCES empleados (dni);

