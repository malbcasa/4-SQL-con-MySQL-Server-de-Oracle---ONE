USE jugos_ventas;

SELECT DISTINCT ENVASE, TAMANO, SABOR FROM tabla_de_productos WHERE SABOR='naranja';

SELECT * FROM tabla_de_productos;

SELECT * FROM tabla_de_productos LIMIT 5;

SELECT * FROM tabla_de_productos LIMIT 5,4;

SELECT * FROM facturas WHERE FECHA_VENTA='2017-01-01' LIMIT 10;

SELECT * FROM tabla_de_productos ORDER BY precio_de_lista DESC;

SELECT * FROM tabla_de_productos ORDER BY nombre_del_producto DESC;

SELECT * FROM tabla_de_productos ORDER BY envase DESC, nombre_del_producto ASC;

SELECT codigo_del_producto FROM tabla_de_productos WHERE nombre_del_producto='REFRESCANTE' AND tamano='1 Litro' AND sabor='Frutilla/Limón';
SELECT * FROM items_facturas WHERE codigo_del_producto='1101035' ORDER BY cantidad DESC;

SELECT ESTADO, LIMITE_DE_CREDITO FROM tabla_de_clientes;
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS LIMITE_TOTAL FROM tabla_de_clientes GROUP BY ESTADO;

SELECT ENVASE, PRECIO_DE_LISTA FROM tabla_de_productos;
SELECT ENVASE, MAX(PRECIO_DE_LISTA) AS MAYOR_PRECIO FROM tabla_de_productos GROUP BY ENVASE;
SELECT ENVASE, COUNT(PRECIO_DE_LISTA) FROM tabla_de_productos GROUP BY ENVASE;

SELECT barrio, SUM(limite_de_credito) AS limite FROM tabla_de_clientes GROUP BY barrio;

SELECT ciudad, barrio, SUM(limite_de_credito) AS limite FROM tabla_de_clientes WHERE ciudad='Ciudad de México' GROUP BY barrio;
SELECT estado, barrio, MAX(limite_de_credito) AS limite, edad
 FROM tabla_de_clientes 
 WHERE edad >= 20 
 GROUP BY estado, barrio, edad
 ORDER BY edad;
 
 SELECT MAX(cantidad) AS MAX FROM items_facturas  WHERE codigo_del_producto='1101035';
 SELECT COUNT(*) FROM items_facturas WHERE codigo_del_producto = '1101035' AND cantidad = 99;
 
 SELECT estado, SUM(limite_de_credito) AS Limite_Total FROM tabla_de_clientes GROUP BY estado HAVING Limite_Total > 300000;
 
 SELECT ENVASE, MAX(PRECIO_DE_LISTA) AS PRECIO_MAXIMO, MIN(PRECIO_DE_LISTA) AS PRECIO_MINIMO, SUM(PRECIO_DE_LISTA) AS SUM_PRECIO
 FROM tabla_de_productos
  GROUP BY ENVASE HAVING SUM(PRECIO_DE_LISTA) >= 80 AND MIN(PRECIO_DE_LISTA) >= 5;
  
  SELECT DNI, COUNT(*) FROM facturas WHERE YEAR(FECHA_VENTA) = 2016 GROUP BY DNI HAVING COUNT(*) > 2000;
  
  SELECT * FROM tabla_de_productos;
  SELECT Nombre_del_producto, precio_de_lista,
  CASE
	WHEN precio_de_lista >=12 THEN 'Costoso'
    WHEN precio_de_lista >= 5 AND precio_de_lista < 12 THEN 'Asequible'
    ELSE 'Barato'
 END AS PRECIO
 FROM tabla_de_productos;
 
 SELECT @@sql_mode;
 
 SELECT ENVASE, ANY_VALUE(SABOR),
  CASE
	WHEN precio_de_lista >=12 THEN 'Costoso'
    WHEN precio_de_lista >= 5 AND precio_de_lista < 12 THEN 'Asequible'
    ELSE 'Barato'
 END AS PRECIO, MIN(precio_de_lista) AS PRECIO_MINIMO 
 FROM tabla_de_productos WHERE tamano = '700 ml' 
  GROUP BY envase,
  CASE
	WHEN precio_de_lista >=12 THEN 'Costoso'
    WHEN precio_de_lista >= 5 AND precio_de_lista < 12 THEN 'Asequible'
    ELSE 'Barato'
 END
 ORDER BY envase;
 
 SELECT NOMBRE,
 CASE
	WHEN YEAR(FECHA_DE_NACIMIENTO) < 1990 THEN 'Viejos'
    WHEN YEAR(FECHA_DE_NACIMIENTO) > 1990 AND YEAR(FECHA_DE_NACIMIENTO) < 1995 THEN 'Jóvenes'
    ELSE 'Niños'
    END AS ANO_NACIMIENTO
    FROM tabla_de_clientes;