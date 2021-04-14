/*********Banca por Internet***********/
/* así dejo comenarios en sql */

SHOW DATABASES;

CREATE DATABASE IF NOT EXISTS banca_internet;

USE banca_internet;

CREATE TABLE Cuenta (
Número INT NOT NULL PRIMARY KEY, Saldo DECIMAL(15,2), UltimoMovimiento DATE, FechaCreación DATETIME);

/****tipos de datos********
números: INT. aqunque hay más opciones
saldo:INT o DECIMAL[(M[,D])] M es el número de dígitos. Si no se especifica se  estabalece por defecto 30. D es el número de decimales. Si no se especifica se estabalece por defecto 0
fechas: DATE YYYY-MM-DD
DATETIME YYYY-MM-DD hh:mm:ss
************************************/

CREATE TABLE Cliente (
DNI VARCHAR(9) NOT NULL PRIMARY KEY,
Nombre VARCHAR(30),
Apellidos VARCHAR(50),
Dirección VARCHAR(50), 
Email VARCHAR(50));

/* SHOW CREATE TABLE cliente; 

con este cOMANDO puedo ver las sentencias que he introducido para crear la tabla

ALTER TABLE cliente DROP DNI;
con esta sentencia puedo eliminar una de las columnas que haya introducido

ALTER TABLE cliente ADD DNI VARCHAR(9) NOT NULL PRIMARY KEY;
con este comando lo volvería a añadir
*/

/*********************************/


CREATE TABLE Crédito (
id_crédito TINYINT NOT NULL PRIMARY KEY,
FechaConcesión DATETIME NOT NULL,
Cantidad BIGINT UNSIGNED, 
Interés FLOAT(15,2), 
Plazo INT,
amortización INT,
dni VARCHAR(9),
CONSTRAINT fk_dni FOREIGN KEY (dni) REFERENCES cliente (DNI));    

/*ahora tengo que añadir las RESTRICCIONES DE INTEGRIDAD REFERENCIAL

ON UPDATE y ON DELETE*/
/* si añado las restricciones a posteriori, primero debo borrar la FOREIGN KEY que tengo creada*/

ALTER TABLE crédito DROP FOREIGN KEY fk_dni;
ALTER TABLE crédito ADD CONSTRAINT fk_dni FOREIGN KEY (dni) REFERENCES cliente(DNI)
ON UPDATE CASCADE ON DELETE RESTRICT;

 /* en esta tabla estoy probando ATRIBUTOS
- por ej: UNSIGNED, hace que no puedas introducir un número negativo
- NOT NULL, obliga a insertar un dato al realizar la población de la tabla */

/*********************************************/
 CREATE TABLE tiene(
DNI VARCHAR(9),
CONSTRAINT fk_DNI_tablatiene FOREIGN KEY (DNI) REFERENCES cliente(DNI) ON UPDATE SET NULL ON DELETE SET NULL,
número INT);

ALTER TABLE tiene ADD CONSTRAINT fk_numero FOREIGN KEY(número) REFERENCES cuenta( número) ON UPDATE CASCADE ON DELETE CASCADE;

/****** con ese código no me deja añadir 2 foreign keys seguidas, tengo que añadir una y luego la otra*/

/*INSERCCIÓN DE DATOS*/

/***** Tenemos 2 opciones****

INSERT INTO nombre tabla(col1,...);

LOAD DATA INFILE 'C:\carpeta1\carpeta2\fichero.csv(si es de excel) o fichero.txt( si es del block de notas)'
INTO TABLE nombre_tabla
FIELDS TERMINATED BY ';'
LINES TERMINATED BY 'r\n'
IGNORE 1 LINES;

Los datos NULL en el fichero se ponen como \n
*/

/****tenemos que usar la opción INSERT****/

/*******TABLA CLIENTE*******/

/*Cuando vas a ingresar datos en todas las columnas de la tabla NO ES NECESARIO ESPECIFICAR LAS COLUMNAS*/

INSERT INTO cliente (DNI,Nombre,apellidos,dirección,email)
VALUES ("03488557h","Juan","García","Madrid","juan@gmail.com");

INSERT INTO cliente VALUES
("74366449k","Pedro","Ortega","Madrid","pe@gmail.com");

INSERT INTO cliente VALUES
("75944009y","Lorena","Sánchez","Cádiz","lore@gmail.com");

INSERT INTO cliente VALUES
("52433776V","Daniela","Molines","Francia","dmolines@gmail.com");

/******TABLA TIENE**********/
INSERT INTO tiene(DNI,número) 
VALUES ("03488557h",1);

INSERT INTO tiene(DNI,número) 
VALUES ("74366449k",2);

INSERT INTO tiene(DNI,número) 
VALUES ("75944009y",3);

INSERT INTO tiene(DNI,número) 
VALUES ("52433776V",4);

/*******TABLA CUENTA*******/

/** el dato DATETIME usa este formato YYYY-MM-DD HH:MM:SS***/
/***el dato DATE usa formato YYYY-MM-DD***/

/*número,saldo,ultimoMovimineto,fechaCreación*/


INSERT INTO cuenta VALUES (1,12000,'1997-01-12','1990-01-12 10:34:11');

INSERT INTO cuenta VALUES (2,1000,'2021-04-01','2021-01-30 13:12:00');

INSERT INTO cuenta VALUES (3,50000000,'2000-12-13','2021-02-16 20:43:11');

INSERT INTO cuenta VALUES (4,23475,'2016-04-19','2021-03-01 11:45:37');


/**********TABLA CRÉDITO*********/

INSERT INTO crédito
 VALUES (1,'1990-01-12 10:34:11',1000000,12,12,122222222,"03488557h");

INSERT INTO crédito 
VALUES(2,'2021-01-30 13:12:00',200000,36,15,30000,"52433776V");


INSERT INTO crédito 
VALUES(3,'2021-02-16 20:43:11',3000,5,10,1000,"74366449k");

INSERT INTO crédito 
VALUES(4,'2021-03-01 11:45:37',500,12,4,1200,"75944009y");


/***********AHORA QUIERE QUE HAGAMOS COOMPROBACIONES DE LAS RESTRICCIONES DE INTEGRIDAD QUE HEMOS HECHO*******/

1 /*Tabla Credito. Clave foránea dni
-borrar un registro en tabla Cliente (DNI) y verificar si se cumple la integridad referencial en Tabla Credito


/* comando:
DELETE FROM nombre_tabal WHERE(nombre_columna=valor columna);
*/

DELETE FROM cliente WHERE (DNI="03488557h");
-modificar un registro en tabla Cliente (DNI) y verificar si se cumple la integridad referencial en Tabla Credito*/

/* comando:

UPDATE cliente SET DNI="03488559t" WHERE DNI="03488557h";

/***2 Tabla Tiene. Clave foránea dni
-borrar un registro en tabla Cliente (DNI) y verificar si se cumple la integridad referencial en Tabla Tiene*/

DELETE FROM  cliente WHERE (DNI="03488557h");

/***-modificar un registro en tabla Cliente (DNI) y verificar si se cumple la integridad referencial en Tabla Tiene*/

UPDATE cliente SET DNI="03488559t" WHERE DNI="03488557h";

 /****** 3 Tabla Tiene. Clave foránea numero
-borrar un registro en tabla Cuenta (numero) y verificar si se cumple la integridad referencial en Tabla Tiene*

DELETE FROM cuenta WHERE(número=1);

-modificar un registro en tabla Cuenta (numero) y verificar si se cumple la integridad referencial en Tabla Tiene*/

UPDATE cuenta SET número=5 WHERE(número=3);
