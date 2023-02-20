USE jugos_ventas;

SELECT DNI, NOMBRE, DIRECCION_1, DIRECCION_2, BARRIO, CIUDAD, ESTADO,
CP, FECHA_DE_NACIMIENTO, EDAD, SEXO, LIMITE_DE_CREDITO, VOLUMEN_DE_COMPRA,
PRIMERA_COMPRA FROM tabla_de_clientes;

SELECT * FROM tabla_de_clientes;

SELECT DNI, NOMBRE FROM tabla_de_clientes;

SELECT DNI AS IDENTIFICACION, NOMBRE AS CLIENTE FROM tabla_de_clientes;

SELECT * FROM tabla_de_productos;

SELECT * FROM tabla_de_productos WHERE SABOR='Uva';

SELECT * FROM tabla_de_productos WHERE SABOR='Mango';

SELECT * FROM tabla_de_productos WHERE ENVASE='Botella PET';

SELECT * FROM tabla_de_productos WHERE PRECIO_DE_LISTA >=16;

SELECT * FROM tabla_de_productos WHERE PRECIO_DE_LISTA BETWEEN 16 AND 16.02;

SELECT * FROM tabla_de_productos WHERE SABOR='MANGO' AND TAMANO='470 ml';

SELECT * FROM tabla_de_productos WHERE SABOR='MANGO' OR TAMANO='470 ml';

SELECT * FROM tabla_de_productos WHERE NOT(SABOR='MANGO') OR TAMANO='470 ml';

SELECT * FROM tabla_de_productos WHERE SABOR='MANGO' AND NOT(TAMANO='470 ml');
 
SELECT * FROM tabla_de_productos WHERE SABOR IN('MANGO','UVA'); /* SABOR = 'MANGO' OR SABOR = 'UVA';*/

SELECT * FROM tabla_de_clientes WHERE CIUDAD IN ('Ciudad de México', 'Guadalajara')
AND (EDAD BETWEEN 20 AND 25);

SELECT * FROM tabla_de_productos WHERE SABOR LIKE '%manzana' AND ENVASE='Botella PET';

SELECT * FROM tabla_de_clientes  WHERE NOMBRE LIKE '%ez';