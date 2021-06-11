drop database if exists t17;
create database t17;
use t17

create table empleados (
    dni char(9),
	nombre varchar(30) unique not null,
    domicilio varchar(20),
    telefono char(9),
    sueldo numeric,
    fnac date,
    supervisor char(9),
    nombredepar varchar(20) not null,
    constraint pk_empleados primary key(dni)
);

create table familiares (
	nombre varchar(30),
    dniemple char(9),
    fnac date,
    parentesco varchar(20),
    constraint pk_familiares primary key(nombre,dniemple)
);
create table trabaja (
	nombrep varchar(20),
    dniemp char(9),
    horas numeric,
    constraint pk_trabaja primary key(nombrep,dniemp)
);
create table proyectos (
		nombre varchar(20),
        numero char(9) not null unique,
        constraint pk_proyectos primary key(nombre)
);
create table departamentos (
	nombre varchar(20),
    numero char(9) not null unique,
    empdirige char(9) not null unique,
    fecha date,
	constraint pk_departamentos primary key(nombre)
);

create table controla(
    nombrep varchar(20),
	nombredep varchar(20) not null,
	constraint pk_controla primary key(nombrep)

);

alter table controla
    add constraint fk1_controla 
    foreign key (nombrep) 
    references proyectos(nombre);

alter table controla
    add constraint fk2_controla 
    foreign key (nombredep) 
    references departamentos(nombre);

alter table trabaja
    add constraint fk1_trabaja 
    foreign key (nombrep) 
    references proyectos(nombre);

alter table trabaja
    add constraint fk2_trabja 
    foreign key (dniemp) 
    references  empleados(dni);

alter table empleados
    add constraint fk1_empleados 
    foreign key (supervisor) 
    references empleados(dni);

alter table empleados
    add constraint fk2_empleados 
    foreign key (nombredepar) 
    references departamentos(nombre);

alter table familiares
    add constraint fk_familiares 
    foreign key (dniemple) 
    references empleados(dni)
    on delete cascade on update cascade;

alter table departamentos
	add constraint fk_departamentos
	foreign key (empdirige)
	references empleados(dni);


