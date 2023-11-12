--DDL
USE master;

IF EXISTS (SELECT name FROM sys.databases WHERE name = 'ticket')
DROP DATABASE ticket;

CREATE DATABASE ticket;

USE ticket;

CREATE TABLE atencionSoporte(
id int IDENTITY(1,1) PRIMARY KEY,
idSolicitud NOT NULL,
FOREIGN KEY (idSolicitud) REFERENCES Solicitudes (id),
idCaso NOT NULL,
FOREIGN KEY (idCaso) REFERENCES Caso (id)
);
CREATE TABLE Solicitudes(
id int IDENTITY(1,1) PRIMARY KEY,
idUsuario NOT NULL,
FOREIGN KEY (idUsuario) REFERENCES Usuario (id),
motivo varchar(250),
fechayhora TIMESTAMP
);
CREATE TABLE Usuario(
id int IDENTITY(1,1) PRIMARY KEY,
nombre varchar(250),
apellido varchar(250),
calificacionAtencion int,
retroalimentacion varchar(250)
);
CREATE TABLE Igeniero(
id int IDENTITY(1,1) PRIMARY KEY,
nombre varchar(250),
apellido varchar(250),
horarioLaboral TIME,
experencia varchar(250)
);
CREATE TABLE Caso(
id int IDENTITY(1,1) PRIMARY KEY,
idIngeninieros NOT NULL,
FOREIGN KEY (idIngeninieros) REFERENCES Ingeniero (id),
categoria varchar(250),
procedimiento varchar(250),
resolucionFinal varchar(250)
);