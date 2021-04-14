/* SINTAXIS de las VISTAS*/

CREATE VIEW nombre_vista
AS SELECT nombre_columna o columnnas
FROM nombre_tabla
WHERE condicion que quieras;

o más sencillo:

CREATE VIEW nombre_vista
AS SELECT *
FROM nombre_tabla;

así se crea una vista de toda la tabla
---------------------------------------------------------
ELIMINAR UNA VISTA:

DROP VIEW nombre_vista;
------------------------------
SHOW CREATE VIEW nombre_vista;

-------------------------------------------

/*****INSERCCIÓN DE DATOS DE UNA VISTA***********

es igual que en las tablas

INSERT INTO nombre_vista
VALUES (valor1,....);

/****BORRADO DE DATOS DE UNA VISTA**********/

DELETE FROM nombre_vista
WHERE nombre='nombre';  *******poner ' ' sino no funciona**********/

/*******ACTUALIZACIÓN DE DATOS DE UNA VISTA*********/

--------es igual que para las tablas-----------

UPDATE nombre_vista
SET nombre_columna=valor_que_quiero
WHERE nombre_col='nombre_si el valor es un nombre';


/* me pide:

Crear una vista llamada ListaClientes y su ejecución

*/


/* aquí creo una vista sencilla, la más básica que me muestra todos los datos de la tabla*/

CREATE VIEW listaClientes 
AS SELECT *
FROM cliente;

/****vista para ver el apellido garcia****/

CREATE VIEW listaClientes
AS SELECT * 
FROM cliente
WHERE apellidos='garcia';

/***modificaciones de vistas****

CREATE OR ALTER VIEW nom_vista
AS SELECT columna_nombre(s)
FROM tabla_nombre
WHERE condicion;
*/

/*
A partir de la vista ListaClientes modificar un registro apellido y su ejecución*/

DELETE FROM listaClientes
WHERE apellidos='garcia';

INSERT INTO listaClientes (apellidos)
VALUES('garcia');

UPDATE listaClientes
SET apellidos='gonzález'
WHERE apellidos='garcia';
