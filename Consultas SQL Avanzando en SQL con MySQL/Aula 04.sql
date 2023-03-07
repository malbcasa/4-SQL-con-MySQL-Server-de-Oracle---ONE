SELECT * FROM tabla_de_vendedores;

SELECT * FROM facturas;

SELECT * FROM tabla_de_vendedores A
INNER JOIN
facturas B
on A.MATRICULA = B.MATRICULA;

SELECT A.NOMBRE, B.MATRICULA, COUNT(*) FROM tabla_de_vendedores A
INNER JOIN
facturas B
on A.MATRICULA = B.MATRICULA
GROUP BY A.NOMBRE, B.MATRICULA;

SELECT A.NOMBRE, B.MATRICULA, COUNT(*)
 FROM tabla_de_vendedores A, facturas B
 WHERE A.MATRICULA = B.MATRICULA
 GROUP BY A.NOMBRE, B.MATRICULA;
 
 
SELECT YEAR(FECHA_VENTA), SUM(CANTIDAD * PRECIO) AS FACTURACION
FROM facturas F 
INNER JOIN 
items_facturas IFa 
ON F.NUMERO = IFa.NUMERO
GROUP BY YEAR(FECHA_VENTA);


SELECT COUNT(*) FROM tabla_de_clientes;

SELECT DISTINCT A.DNI, A.NOMBRE, B.DNI FROM tabla_de_clientes A
INNER JOIN
facturas B
ON A.DNI = B.DNI;

SELECT DISTINCT A.DNI, A.NOMBRE, A.CIUDAD, B.DNI FROM tabla_de_clientes A
LEFT JOIN
facturas B
ON A.DNI = B.DNI
WHERE B.DNI IS NULL;

SELECT DISTINCT B.DNI, B.NOMBRE, B.CIUDAD, A.DNI FROM facturas A
RIGHT JOIN
tabla_de_clientes B
ON A.DNI = B.DNI
WHERE A.DNI IS NULL;

SELECT COUNT(*) FROM tabla_de_clientes;
SELECT * FROM tabla_de_vendedores;

SELECT tabla_de_clientes.NOMBRE, tabla_de_clientes.BARRIO, tabla_de_vendedores.NOMBRE
 FROM tabla_de_clientes
 INNER JOIN
 tabla_de_vendedores
 ON tabla_de_clientes.BARRIO = tabla_de_vendedores.BARRIO;

SELECT tabla_de_clientes.NOMBRE, tabla_de_clientes.BARRIO, tabla_de_clientes.CIUDAD, 
 tabla_de_vendedores.NOMBRE
 FROM tabla_de_clientes
 LEFT JOIN
 tabla_de_vendedores
 ON tabla_de_clientes.BARRIO = tabla_de_vendedores.BARRIO;
 
 SELECT tabla_de_clientes.NOMBRE, tabla_de_clientes.BARRIO, tabla_de_clientes.CIUDAD, 
 tabla_de_vendedores.NOMBRE, VACACIONES
 FROM tabla_de_clientes
 RIGHT JOIN
 tabla_de_vendedores
 ON tabla_de_clientes.BARRIO = tabla_de_vendedores.BARRIO;
 
 SELECT tabla_de_clientes.NOMBRE, tabla_de_clientes.BARRIO, tabla_de_clientes.CIUDAD, 
 tabla_de_vendedores.NOMBRE, VACACIONES
 FROM tabla_de_clientes
 FULL JOIN /*error*/
 tabla_de_vendedores
 ON tabla_de_clientes.BARRIO = tabla_de_vendedores.BARRIO;

/*Cross Join*/
SELECT tabla_de_clientes.NOMBRE, tabla_de_clientes.BARRIO, tabla_de_clientes.CIUDAD, 
 tabla_de_vendedores.NOMBRE, VACACIONES
 FROM tabla_de_clientes, tabla_de_vendedores
 WHERE tabla_de_clientes.BARRIO = tabla_de_vendedores.BARRIO;
 
 SELECT DISTINCT BARRIO FROM tabla_de_clientes;
 
 SELECT DISTINCT BARRIO FROM tabla_de_vendedores;
 
 SELECT DISTINCT BARRIO FROM tabla_de_clientes
  UNION
 SELECT DISTINCT BARRIO FROM tabla_de_vendedores;
 
  SELECT DISTINCT BARRIO FROM tabla_de_clientes
  UNION ALL
 SELECT DISTINCT BARRIO FROM tabla_de_vendedores;
 
  SELECT DISTINCT BARRIO, NOMBRE, 'Cliente' AS TIPO FROM tabla_de_clientes
  UNION
 SELECT DISTINCT BARRIO, NOMBRE, 'Vendedor' AS TIPO FROM tabla_de_vendedores;
 
 SELECT DISTINCT BARRIO, NOMBRE, 'Cliente' AS TIPO_CLIENTE FROM tabla_de_clientes
  UNION
 SELECT DISTINCT BARRIO, NOMBRE, 'Vendedor' AS TIPO_VENDEDOR FROM tabla_de_vendedores;
 
 SELECT DISTINCT BARRIO, NOMBRE, 'Cliente' AS TIPO_CLIENTE, DNI FROM tabla_de_clientes
  UNION
 SELECT DISTINCT BARRIO, NOMBRE, 'Vendedor' AS TIPO_VENDEDOR, MATRICULA FROM tabla_de_vendedores;
 
 SELECT tabla_de_clientes.NOMBRE, tabla_de_clientes.CIUDAD, tabla_de_clientes.BARRIO, 
 tabla_de_vendedores.NOMBRE, VACACIONES
 FROM tabla_de_clientes
 LEFT JOIN
 tabla_de_vendedores
 ON tabla_de_clientes.BARRIO = tabla_de_vendedores.BARRIO 
 UNION
 SELECT tabla_de_clientes.NOMBRE, tabla_de_clientes.BARRIO, tabla_de_clientes.CIUDAD, 
 tabla_de_vendedores.NOMBRE, VACACIONES
 FROM tabla_de_clientes
 RIGHT JOIN
 tabla_de_vendedores
 ON tabla_de_clientes.BARRIO = tabla_de_vendedores.BARRIO;

SELECT DISTINCT BARRIO FROM tabla_de_vendedores;
SELECT * FROM tabla_de_clientes WHERE BARRIO IN ('Condesa','Del Valle',
'Contadero','Oblatos');

SELECT * FROM tabla_de_clientes WHERE BARRIO IN (SELECT DISTINCT BARRIO FROM tabla_de_vendedores);

SELECT ENVASE, MAX(PRECIO_DE_LISTA) AS PRECIO_MAXIMO FROM tabla_de_productos 
GROUP BY ENVASE;

SELECT X.ENVASE, X.PRECIO_MAXIMO FROM (SELECT ENVASE, MAX(PRECIO_DE_LISTA) 
AS PRECIO_MAXIMO FROM tabla_de_productos GROUP BY ENVASE) X
WHERE X.PRECIO_MAXIMO >=10;

SELECT ENVASE, MAX(PRECIO_DE_LISTA)
AS PRECIO_MAXIMO FROM tabla_de_productos GROUP BY ENVASE;

SELECT X.ENVASE, X.PRECIO_MAXIMO FROM 
vw_envases_grandes X
WHERE PRECIO_MAXIMO >= 10 ;

SELECT A.NOMBRE_DEL_PRODUCTO, A.ENVASE, A.PRECIO_DE_LISTA,
B.PRECIO_MAXIMO FROM tabla_de_productos A 
INNER JOIN
vw_envases_grandes B
ON A.ENVASE = B.ENVASE;

SELECT A.NOMBRE_DEL_PRODUCTO, A.ENVASE, A.PRECIO_DE_LISTA,
((A.PRECIO_DE_LISTA/B.PRECIO_MAXIMO)-1)*100 AS PORCENTAJE_DE_VARIACION  FROM tabla_de_productos A 
INNER JOIN
vw_envases_grandes B
ON A.ENVASE = B.ENVASE;