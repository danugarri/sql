/*INSERCCIÓN DE DATOS*/

/***** Tenemos 2 opciones****

********opción 1***********
INSERT INTO nombre tabla(col1,...);
-------------------------------------------------------------------
********opción 2***********
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

INSERT INTO cliente VALUES
("52433771z","Daniel","Garrido","Lugo","dg@gmail.com");


/*******TABLA CUENTA*******/

/** el dato DATETIME usa este formato YYYY-MM-DD HH:MM:SS***/
/***el dato DATE usa formato YYYY-MM-DD***/

/*número,saldo,ultimoMovimineto,fechaCreación*/


INSERT INTO cuenta VALUES (1,12000,'1997-01-12','1990-01-12 10:34:11');

INSERT INTO cuenta VALUES (2,1000,'2021-04-01','2021-01-30 13:12:00');

INSERT INTO cuenta VALUES (3,50000000,'2000-12-13','2021-02-16 20:43:11');

INSERT INTO cuenta VALUES (4,23475,'2016-04-19','2021-03-01 11:45:37');

INSERT INTO cuenta VALUES (5,275,'2018-04-19','2021-02-01 11:45:30');


/**********TABLA CRÉDITO*********/

INSERT INTO crédito
 VALUES (1,'1990-01-12 10:34:11',1000000,12,12,122222222,"03488557h");

INSERT INTO crédito 
VALUES(2,'2021-01-30 13:12:00',200000,36,15,30000,"52433776V");


INSERT INTO crédito 
VALUES(3,'2021-02-16 20:43:11',3000,5,10,1000,"74366449k");

INSERT INTO crédito 
VALUES(4,'2021-03-01 11:45:37',500,12,4,1200,"75944009y");

INSERT INTO crédito 
VALUES(5,'2021-02-01 11:45:30',2200,1,10,120,"52433771z");

/******TABLA TIENE**********/
INSERT INTO tiene(DNI,número) 
VALUES ("03488557h",1);

INSERT INTO tiene(DNI,número) 
VALUES ("74366449k",2);

INSERT INTO tiene(DNI,número) 
VALUES ("75944009y",3);

INSERT INTO tiene(DNI,número) 
VALUES ("52433776V",4);

INSERT INTO tiene(DNI,número) 
VALUES ("52433771z",5);

