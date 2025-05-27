USE tienda;

-- 1-List the name of all the products in the product table.
SELECT nombre FROM producto;

-- 2-List the name amb price of all products in the product table.
SELECT nombre, precio FROM producto;

-- 3-List all the columns in the product table.
SELECT nombre, precio, codigo_fabricante FROM producto;

-- 4-List the name of the products, the price in euros, and the price in US dollars (USD).
SELECT nombre, precio AS EUROS, ROUND(precio*1.13,2) AS USD FROM producto;

-- 5-Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD). Utilitza els següents àlies per a les columnes: nom de producto, euros, dòlars
SELECT nombre AS nombre_de_producto, precio AS EUROS, ROUND(precio * 1.13,2) AS USD FROM producto;

-- 6-Lists the names and prices of all the products in the product table, converting the names to uppercase.
SELECT UPPER(nombre) AS nombre_de_producto, precio AS EUROS FROM producto;

-- 7-Lists the names and prices of all the products in the product table, converting the names to lowercase.
SELECT LOWER(nombre) AS nombre_de_producto, precio AS EUROS FROM producto;

-- 8-List the names of all the manufacturers in one column, and in another column capitalize the first two characters of the manufacturer's name.
SELECT DISTINCT nombre AS nombre_de_producto, UPPER(SUBSTRING(nombre, 1,3)) AS nombre_modificado FROM producto;

-- 9-Lists the names and prices of all the products in the product table, rounding the price value.
SELECT nombre AS nombre_de_producto, FLOOR(precio) AS EUROS FROM producto;

-- 10-Lists the names and prices of all products in the product table, truncating the price value to display it without any decimal places.
SELECT nombre AS nombre_de_producto, ROUND(precio) AS EUROS FROM producto;

-- 11-List the code of the manufacturers that have products in the product table.
SELECT codigo_fabricante FROM producto;

-- 12-List the code of the manufacturers that have products in the product table, eliminating codes that appear repeatedly.
SELECT DISTINCT codigo_fabricante FROM producto;

-- 13-List the names of the manufacturers in ascending order.
SELECT DISTINCT nombre FROM fabricante ORDER BY nombre ASC;

-- 14-Lists the names of manufacturers sorted in descending order
SELECT DISTINCT nombre FROM fabricante ORDER BY nombre DESC;

-- 15-Lists the names of the products sorted, first, by name in ascending order and, second, by price in descending order.
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC ;

-- 16-Returns a list with the first 5 rows of the manufacturer table.
SELECT nombre FROM fabricante LIMIT 5;

-- 17-Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.
SELECT * FROM fabricante LIMIT 2 OFFSET 3;

-- 18-List the name and price of the cheapest product. (Use only ORDER BY and LIMIT clauses.) NOTE: You couldn't use MIN(price) here, you would need GROUP BY
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;

-- 19-Llista el nom i el preu del producte més car. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

-- 20-Lists the name of all products from the manufacturer whose manufacturer code is equal to 2.
SELECT nombre FROM producto WHERE codigo_fabricante = 2;

-- 21-Returns a list with the product name, price and manufacturer name of all products in the database
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;

-- 22-Returns a list with the product name, price, and manufacturer name of all products in the database. Sorts the result by manufacturer name, in alphabetical order.
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY nombre_fabricante ASC;

-- 23-Returns a list with the product code, product name, manufacturer code and manufacturer name of all the products in the database.
SELECT p.codigo AS codigo_producto, p.nombre AS nombre_producto, p.codigo_fabricante,f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;

-- 24-Returns the product name, its price and the name of its manufacturer, of the cheapest product
SELECT p.nombre AS nombre_producto, p.precio,f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY precio ASC LIMIT 1;

-- 25-Returns the product name, its price and the name of its manufacturer, of the most expensive product
SELECT p.nombre AS nombre_producto, p.precio,f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY precio DESC LIMIT 1;

-- 26-Returns a list of all products from the manufacturer Lenovo
SELECT p.nombre AS nombre_producto,f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f WHERE f.nombre LIKE '%Lenovo%';  

-- 27-Returns a list of all products from the manufacturer Crucial that have a price greater than €200
SELECT p.nombre AS nombre_producto,p.precio,f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f WHERE f.nombre LIKE '%Crucial%' && p.precio >= 200;  

-- 28-Returns a list with all products from manufacturers Asus, Hewlett-Packard, and Seagate. Without using the IN operator
SELECT p.nombre AS nombre_producto,f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f WHERE f.nombre LIKE '%Asus%' OR f.nombre LIKE '%Hewlett-Packard%' OR f.nombre LIKE '%Seagate%';  

-- 29-Returns a list with all products from manufacturers Asus, Hewlett-Packard, and Seagate. Using the IN operator
SELECT p.nombre AS nombre_producto,f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f WHERE f.nombre IN ('Asus', 'Hewlett-Packard' ,'Seagate');

-- 30-Returns a list with the name and price of all products from manufacturers whose names end with the vowel e
SELECT p.nombre AS nombre_producto, precio, f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f WHERE f.nombre LIKE '%e';   

-- 31-Returns a list with the name and price of all products whose manufacturer name contains the character w in their name.
SELECT p.nombre AS nombre_producto, precio, f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f WHERE f.nombre LIKE '%___w%';   


-- 32-Returns a list with the product name, price and manufacturer name, of all products that have a price greater than or equal to €180. Sorts the result, first, by price (in descending order) and, second, by name (in ascending order) 
SELECT p.nombre AS nombre_producto, precio, f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f WHERE p.precio >=180 ORDER BY p.precio DESC , p.nombre ASC; 

-- 33-Returns a list with the manufacturer code and name, only of those manufacturers that have associated products in the database
SELECT DISTINCT f.codigo AS 'Código fabricante', f.nombre AS 'Nombre fabricante' FROM fabricante f JOIN producto p ON f.codigo = p.codigo_fabricante WHERE p.nombre IS NOT NULL ORDER BY f.codigo ASC;

-- 34-Returns a list of all manufacturers that exist in the database, along with the products that each of them has. The list should also show those manufacturers that do not have associated products.
SELECT f.nombre AS nombre_fabricante, p.nombre AS nombre_producto FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante;

-- 35-Returns a list that only shows manufacturers that do not have any associated products.
SELECT f.nombre AS nombre_fabricante, p.nombre AS nombre_producto FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE p.codigo_fabricante IS NULL;

-- 36-Returns all products from the manufacturer Lenovo. (Without using INNER JOIN).
SELECT f.nombre AS nombre_fabricante, p.nombre AS nombre_producto FROM fabricante f JOIN producto p WHERE f.nombre LIKE '%Lenovo%';

-- 37-Returns all data for products that have the same price as the most expensive product from the manufacturer Lenovo. (Without using INNER JOIN).
SELECT f.nombre AS nombre_fabricante, p.codigo AS codigo_producto, p.precio AS precio_producto, p.nombre AS nombre_producto FROM fabricante f JOIN producto p WHERE (f.nombre LIKE '%Lenovo%'OR f.nombre LIKE '%Asus%' OR f.nombre LIKE '%Hewlett-Packard%' OR f.nombre LIKE '%Seagate%') AND p.precio >= 750;

-- 38-List the name of the most expensive product from the manufacturer Lenovo.
SELECT f.nombre AS nombre_fabricante, p.nombre AS nombre_producto, MAX(p.precio) AS precio_producto FROM fabricante f INNER JOIN producto p WHERE f.nombre LIKE '%Lenovo%'; 

-- 39-List the name of the cheapest product from the manufacturer Hewlett-Packard.
SELECT f.nombre AS nombre_fabricante, p.nombre AS nombre_producto, MIN(p.precio) AS precio_producto FROM fabricante f INNER JOIN producto p WHERE f.nombre LIKE '%Hewlett-Packard%'; 

-- 40-Returns all products in the database that have a price greater than or equal to the most expensive product from the manufacturer Lenovo
SELECT p.nombre AS nombre_producto, p.precio AS precio_producto FROM producto p WHERE p.precio >= (SELECT MAX(p2.precio) FROM producto p2 INNER JOIN fabricante f2 ON p2.codigo_fabricante = f2.codigo WHERE f2.nombre = 'Lenovo');

-- 41-List all products from the manufacturer Asus that are priced higher than the average price of all their products.
SELECT p.nombre AS nombre_producto, p.precio AS precio_producto FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus'AND p.precio > (SELECT AVG(p2.precio) FROM producto p2 INNER JOIN fabricante f2 ON p2.codigo_fabricante = f2.codigo WHERE f2.nombre = 'Asus');



