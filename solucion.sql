-- Vista para mostrar los nombres, apellidos y correos de los usuarios
CREATE VIEW Vista_Correos AS 
SELECT nombres, apellidos, correo 
FROM users;

-- Consulta para mostrar los datos de la vista creada
SELECT * FROM Vista_Correos;

-- Eliminar la vista creada
DROP VIEW Vista_Correos;

-- Vista para mostrar personas que les gusta el merengue
CREATE VIEW persona_gusta_merengue AS 
SELECT nombres, apellidos, musica 
FROM users 
WHERE musica = "merengue";

-- Consulta para mostrar los datos de la vista de personas que gustan del merengue
SELECT * FROM persona_gusta_merengue;

-- Vista para mostrar personas cuyo nombre incluye "Felipe"
CREATE VIEW persona_llamada_felipe AS 
SELECT nombres, apellidos 
FROM users 
WHERE nombres LIKE "%Felipe%";

-- Consulta para mostrar los datos de la vista de personas llamadas Felipe
SELECT * FROM persona_llamada_felipe;

-- Vista para mostrar personas de 24 años
CREATE VIEW persona_24_años AS 
SELECT nombres, apellidos, edad 
FROM users 
WHERE edad = "24";

-- Consulta para mostrar los datos de la vista de personas de 24 años
SELECT * FROM persona_24_años;

-- Vista para mostrar personas de Ecuador o Venezuela
CREATE VIEW personas_de_Ecuador_o_Venezuela AS 
SELECT nombres, apellidos, pais 
FROM users 
WHERE pais = "ecuador" OR pais = "venezuela";

-- Consulta para mostrar los datos de la vista de personas de Ecuador o Venezuela
SELECT * FROM personas_de_Ecuador_o_Venezuela;

-- Procedimiento almacenado para obtener los nombres y apellidos de todos los usuarios
CREATE PROCEDURE obtener_datos_basicos()
BEGIN
    SELECT nombres, apellidos FROM users;
END //

-- Llamar al procedimiento para obtener los datos básicos
CALL obtener_datos_basicos;

-- Eliminar el procedimiento
DROP PROCEDURE obtener_datos_basicos;

-- Procedimiento almacenado para obtener la edad y el país de todos los usuarios
CREATE PROCEDURE obtener_edad_y_pais() 
BEGIN 
    SELECT edad, pais FROM users; 
END;

-- Llamar al procedimiento para obtener la edad y el país
CALL obtener_edad_y_pais;

-- Procedimiento almacenado para mostrar personas llamadas Felipe
CREATE PROCEDURE persona_llamada_felipe() 
SELECT nombres, apellidos 
FROM users 
WHERE nombres LIKE "%Felipe%";

-- Llamar al procedimiento para mostrar personas llamadas Felipe
CALL persona_llamada_felipe;

-- Procedimiento almacenado para mostrar personas mayores de 50 años a quienes les gusta el vallenato
CREATE PROCEDURE persona_mayor_50_y_gusta_vallenato()  
SELECT nombres, edad, musica 
FROM users 
WHERE musica = "vallenato" AND edad >= 50;

-- Llamar al procedimiento para mostrar personas mayores de 50 años a quienes les gusta el vallenato
CALL persona_mayor_50_y_gusta_vallenato;

-- Eliminar el procedimiento
DROP PROCEDURE persona_mayor_50_y_gusta_vallenato;

-- Procedimiento almacenado para mostrar nombres de usuarios sin repetir
CREATE PROCEDURE nombres_que_no_se_repiten() 
SELECT DISTINCT nombres FROM users;

-- Llamar al procedimiento para mostrar nombres de usuarios sin repetir
CALL nombres_que_no_se_repiten;

-- Procedimiento almacenado para mostrar nombres de usuarios que se repiten
CREATE PROCEDURE nombres_repetidos()
BEGIN
    SELECT nombres, COUNT(*) AS nombres_repetidos
    FROM users
    GROUP BY nombres
    HAVING nombres_repetidos > 1;
END;

-- Llamar al procedimiento para mostrar nombres de usuarios que se repiten
CALL nombres_repetidos;

-- Eliminar el procedimiento
DROP PROCEDURE nombres_repetidos;
