INSERT INTO PRICE VALUES(1,'Precio Normal',100,25)
INSERT INTO PRICE VALUES(2,'Precio Promoción',90,25)

INSERT INTO MOVIE VALUES('MOV_A001','LA SIRENITA',
                         '01/01/2010',400,'INFANTIL',1)

INSERT INTO MOVIE VALUES('MOV_A002','ELEMENTOS',
                         '01/01/2014',200,'INFANTIL',1)

SELECT * FROM PRICE
SELECT * FROM MOVIE

/*1. Aplicar la restricción UNIQUE en la tabla MOVIE,
para evitar que se duplique el nombre de la película*/

ALTER TABLE MOVIE
ADD CONSTRAINT UQ_MOVIETITLE 
UNIQUE (MOVIE_TITLE)

/*2. Aplicar la restricción CHECK en la tabla DETAILRENTAL
para validar que la fecha de vencimiento de renta sea
mayor a la fecha actual- getdate()*/
SELECT GETDATE()

ALTER TABLE DETAILRENTAL
ADD CONSTRAINT CHK_DETAILDUEDATE
CHECK(DETAIL_DEUDATE>GETDATE())

/*3. Aplicar la retricción CHECK en la tabla PRICE
para verificar que el costo de renta es mayor a 0*/

ALTER TABLE PRICE
ADD CONSTRAINT CHK_PRICERENTFEE
CHECK(PRICE_RENTFEE > 0)

/*4. Aplicar la restricción UNIQUE en la tabla PRICE
para evitar que la descripción del precio sea única*/

ALTER TABLE PRICE
ADD CONSTRAINT UQ_PRICEDESCRIPTION
UNIQUE(PRICE_DESCRIPTION)

/*5. Aplicar la restricción CHECK en la tabla RENTAL
para verificar que la fecha de renta sea mayor a la fecha actual*/

ALTER TABLE RENTAL
ADD CONSTRAINT CHK_RENTDATE
CHECK(RENT_DATE > GETDATE())