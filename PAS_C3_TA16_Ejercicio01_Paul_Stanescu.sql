# ----------------------------------------------------------
#       TA16 - EJERCICIO 1 - La Tienda de Informática
# ----------------------------------------------------------

# 1.1. Obtener los nombres de los productos de la tienda
SELECT NOMBRE FROM articulos;

# 1.2. Obtener los nombres y los precios de los productos de la tienda
SELECT NOMBRE, Precio FROM articulos;

# 1.3. Obtener el nombre de los productos cuyo precio sea menor o igual a 200 €.
SELECT NOMBRE FROM articulos WHERE PRECIO <= 200;

# 1.4. Obtener todos los datos de los articulos cuyo precio esté entre los 60 € y los 120 € (ambas cantidades incluidas).
SELECT * FROM articulos WHERE PRECIO BETWEEN 60 AND 120;

# 1.5. Obtener el nombre y el precio en pesetas (es decir, el precio en euros multiplicado por 166'386)
SELECT NOMBRE, PRECIO * 166.386 AS PRECIO_PESETAS FROM articulos;

# 1.6. Seleccionar el precio medio de todos los productos.
SELECT AVG(PRECIO) FROM articulos;

# 1.7. Obtener el precio medio de los articulos cuyo cédigo de fabricante sea 2.
SELECT AVG(PRECIO) FROM articulos WHERE FABRICANTE = 2;

# 1.8. Obtener el numero de artfculos cuyo precio sea mayor o igual a 180 €.
SELECT COUNT(*) FROM articulos WHERE PRECIO >= 180;

# 1.9. Obtener el nombre y precio de los articulos cuyo precio sea mayor o igual a 180 €
# y ordenarlos descendentemente por precio, y luego ascendentemente por nombre.
SELECT NOMBRE, PRECIO FROM articulos WHERE PRECIO >= 180 ORDER BY PRECIO DESC, NOMBRE ASC;

# 1.10. Obtener un listado completo de articulos, incluyendo por cada articulo los datos del articulo y de su fabricante.
SELECT * FROM articulos, fabricantes WHERE articulos.FABRICANTE = fabricantes.CODIGO;

# 1.11. Obtener un listado de articulos, incluyendo el nombre del articulo, su precio, y el nombre de su fabricante.
SELECT articulos.NOMBRE, articulos.PRECIO, fabricantes.NOMBRE FROM articulos, fabricantes WHERE articulos.FABRICANTE = fabricantes.CODIGO;

# 1.12. Obtener el precio medio de los productos de cada fabricante, mostrando solo los cédigos de fabricante.
SELECT AVG(PRECIO), FABRICANTE FROM articulos GROUP BY FABRICANTE;

# 1.13. Obtener el precio medio de los productos de cada fabricante, mostrando el nombre del fabricante.
SELECT AVG(articulos.PRECIO), fabricantes.NOMBRE FROM articulos, fabricantes WHERE articulos.FABRICANTE = fabricantes.CODIGO GROUP BY fabricantes.NOMBRE;

# 1.14. Obtener los nombres de los fabricantes que ofrezcan productos cuyo precio medio sea mayor o igual a 150 €.
SELECT AVG(articulos.PRECIO), fabricantes.NOMBRE FROM articulos, fabricantes WHERE articulos.FABRICANTE = fabricantes.CODIGO
GROUP BY fabricantes.NOMBRE HAVING AVG(articulos.PRECIO) >= 150;

# 1.15. Obtener el nombre y precio del articulo mas barato.
SELECT NOMBRE, PRECIO FROM articulos WHERE PRECIO = (SELECT MIN(PRECIO) FROM articulos);

# 1.16. Obtener una lista con el nombre y precio de los articulos mas caros de cada proveedor (incluyendo el nombre del proveedor).
SELECT articulos.NOMBRE, articulos.PRECIO, fabricantes.NOMBRE FROM articulos, fabricantes WHERE articulos.FABRICANTE = fabricantes.CODIGO
AND articulos.PRECIO = (SELECT MAX(articulos.PRECIO) FROM articulos WHERE articulos.FABRICANTE = fabricantes.CODIGO);

# 1.17. Afiadir un nuevo producto: Altavoces de 70 € (del fabricante 2).
INSERT INTO articulos (CODIGO, NOMBRE, PRECIO ,FABRICANTE) VALUES (11, 'Altavoces', 70, 2);

# 1.18. Cambiar el nombre del producto 8 a 'Impresora Laser'.
UPDATE articulos SET NOMBRE = 'Impresora Laser' WHERE CODIGO = 8;

# 1.19. Aplicar un descuento del 10% (multiplicar el precio por 0°9) a todos los productos.
SET SQL_SAFE_UPDATES = 0;
UPDATE articulos SET PRECIO = PRECIO * 0.9;

# 1.20. Aplicar un descuento de 10 € a todos los productos cuyo precio sea mayor o igual a l20€.
UPDATE articulos SET PRECIO = PRECIO - 10 WHERE PRECIO >= 120;
