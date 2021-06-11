drop database if exists T21;
create database T21;
use T21

create table alumnos(
	dni char(9),
	numexpediente numeric not null unique,
	nombre varchar(20),
constraint pk_alumnos primary key(dni));

create table vehiculos(
	matricula char(10),
	marca varchar(20),
	modelo varchar(20),
	dnialumno char(9) not null,
constraint pk_vehiculos primary key(matricula));

alter table vehiculos
	add constraint fk_vehiculos 
	foreign key (dnialumno) 
	references alumnos(dni) ON DELETE CASCADE ON UPDATE CASCADE;