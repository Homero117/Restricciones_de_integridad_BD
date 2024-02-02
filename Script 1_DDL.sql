/*Crear base de datos*/
USE master
Go

CREATE DATABASE NombreBaseDatos
Go
/*Crear tablas*/
Use NombreBaseDatos
Go

CREATE TABLE NombreTabla
(
NombreCampo TipoDato Tamaño Null/Not Null PRIMARY KEY
)
Go
/*Eliminar base de datos*/
DROP DATABASE NombreBaseDatos
Go
/*Eliminar tablas de base de datos*/
DROP TABLE NombreTabla
Go
/*Eliminar constraint de base de datos*/
ALTER TABLE NombreTabla
DROP CONSTRAINT NombreConstraint
Go
/*Modificar estructura de tabla*/
ALTER TABLE NombreTabla
ALTER COLUMN NombreColumna TipoDato Tamaño Null/Not Null 
Go

ALTER TABLE NombreTabla
ADD NombreColumna TipoDato Tamaño Null/Not Null 
Go

ALTER TABLE NombreTabla
DROP COLUMN NombreColumna
Go

/*AGREGAR CONSTRAINT PK,FK,UQ,CHK,DFL*/
ALTER TABLE NombreTabla
ADD CONSTRAINT NombreConstraint(PK_Nombre)
PRIMARY KEY(NombreCampo)
Go

ALTER TABLE NombreTabla
ADD CONSTRAINT NombreConstraint(FK_Nombre)
FOREIGN KEY (NombreCampoTabla)
REFERENCES NombreTabladeReferencia(NombreCampoReferencia)
Go

ALTER TABLE NombreTabla
ADD CONSTRAINT NombreConstraint(CHK_Nombre)
CHECK(Condición/restricción)
Go

ALTER TABLE NombreTabla
ADD CONSTRAINT NombreConstraint(UQ_Nombre)
UNIQUE(NombreCampo)
Go

ALTER TABLE NombreTabla
ADD CONSTRAINT NombreConstraint(DFL_Nombre)
DEFAULT 'Texto' FOR NombreCampo
Go

/*INSERT: Insertar registros en las tablas*/

INSERT INTO NombreTabla 
     VALUES(Valor1, Valor2,......)
Go

/*UPDATE: para modificar datos de los campos*/

UPDATE NombreTabla
   SET CampoX= ValorX,
       CampoY=ValorY
 WHERE Condición
 Go
 /*SELECT: para consultar registros de la tabla*/

 SELECT * 
  FROM NombreTabla1 AS T1
  INNER JOIN NombreTabla2 AS T2 ON T1.PK=T2.FK
  Go 
/*DELETE: eliminar registros*/
DELETE FROM NombreTabla
 WHERE Condicion
 Go
----EJEMPLO: BASE DE DATOS RENTA VIDEOS -------
Use master
Go

Create database RentaVideos
Go

Use RentaVideos
Go

CREATE TABLE MEMBERSHIP(
MEM_NUM int Primary key, 
MEM_FNAME char(50) not null,
MEM_LNAME char(50) not null,
MEM_STREET char(50) not null,
MEM_CITY char(50) not null,
MEM_STATE char(50) not null,
MEM_ZIP int not null,
MEM_BALANCE char(50) null  
)
GO

CREATE TABLE PRICE(
PRICE_CODE int identity primary key,
PRICE_DESCRIPTION char(50) not null,
PRICE_RENTFEE money not null,
PRICE_DAILYDATEFEE money not null
)
GO 

CREATE TABLE RENTAL(
RENT_NUM int identity Primary key,
RENT_DATE date not null,
MEM_NUM int not null
)
GO

CREATE TABLE MOVIE(
MOVIE_NUM char(15) Primary key,
MOVIE_TITLE char(100) not null,
MOVIE_YEAR date not null,
MOVIE_COST  money not null,
MOVIE_GENRE char(50) not null,
PRICE_CODE int not null
)
GO

CREATE TABLE VIDEO(
VID_NUM int Primary key,
VID_INDATE date not null,
MOVIE_NUM char(15) not null
)
GO

CREATE TABLE DETAILRENTAL(
RENT_NUM int not null,
VID_NUM int not null,
DETAIL_FEE money not null,
DETAIL_DEUDATE date not null,
DETAIL_RETURNDATE date not null,
DETAIL_DAILYLATEFEE money not null,

)
GO

ALTER TABLE RENTAL
ADD CONSTRAINT FK_RENTAL_MEMBERSHIP
FOREIGN KEY (MEM_NUM)
REFERENCES MEMBERSHIP(MEM_NUM)
GO

ALTER TABLE MOVIE
ADD CONSTRAINT FK_MOVIE_PRICE
FOREIGN KEY (PRICE_CODE)
REFERENCES PRICE(PRICE_CODE)
GO

ALTER TABLE VIDEO
ADD CONSTRAINT FK_VIDEO_MOVIE
FOREIGN KEY (MOVIE_NUM)
REFERENCES MOVIE(MOVIE_NUM)
GO

ALTER TABLE DETAILRENTAL
ADD CONSTRAINT FK_DETAILRENTAL_RENTAL
FOREIGN KEY (RENT_NUM)
REFERENCES RENTAL(RENT_NUM)
GO

ALTER TABLE DETAILRENTAL
ADD CONSTRAINT FK_DETAILRENTAL_VIDEO
FOREIGN KEY (VID_NUM)
REFERENCES VIDEO(VID_NUM)
GO