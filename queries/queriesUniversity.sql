USE universidad ;

-- 1-Returns a list with the first name, middle name, and firstname of all students. The list must be sorted alphabetically from lowest to highest by first name, middle name, and first name.
SELECT DISTINCT p.nombre, p.apellido1, p.apellido2 FROM persona p WHERE tipo = 'alumno' ORDER BY p.apellido1, p.apellido2, p.nombre;

-- 2-Find out the name and both surnames of students who have not registered their telephone number in the database.
SELECT DISTINCT p.nombre, p.apellido1, p.apellido2, p.telefono FROM persona p WHERE tipo = 'alumno' AND telefono IS NULL ORDER BY p.apellido1, p.apellido2, p.nombre;

-- 3-Returns the list of students who were born in 1999.
SELECT DISTINCT p.nombre, p.apellido1, p.apellido2, p.fecha_nacimiento FROM persona p WHERE YEAR(p.fecha_nacimiento) = 1999 AND tipo = 'alumno' ORDER BY p.apellido1, p.apellido2, p.nombre;

-- 4-Returns the list of teachers who have not registered their telephone number in the database and whose NIF ends in K.
SELECT DISTINCT p.nombre, p.apellido1, p.apellido2, p.nif FROM persona p WHERE p.nif LIKE '%k' AND tipo = 'profesor' ORDER BY p.apellido1, p.apellido2, p.nombre;

-- 5-Returns the list of subjects taught in the first semester, in the third year of the degree that has the identifier 7.
SELECT a.nombre, a.curso, a.cuatrimestre, g.id FROM asignatura a   INNER JOIN grado g ON id_grado = g.id WHERE g.id LIKE '%7%' AND a.cuatrimestre LIKE '%1%' && a.curso LIKE '%3%';

-- 6-Returns a list of professors along with the name of the department they are linked to. The list should return four columns, first name, second name, first name, and department name. The result will be sorted alphabetically from lowest to highest by last name and first name.
SELECT pe.nombre AS profesor_nombre, pe.apellido1 AS profesor_apellido1, pe.apellido2 AS profesor_apellido2, d.nombre AS departamento_nombre FROM profesor p  INNER JOIN persona pe ON p.id_profesor = pe.id INNER JOIN departamento d ON p.id_departamento =  d.id  WHERE tipo = 'profesor' ORDER BY pe.apellido1, pe.apellido2, pe.nombre,d.nombre; 

-- 7-Returns a list with the name of the subjects, start year and end year of the school year of the student with NIF 26902806M.
SELECT a.nombre AS asignatura_nombre, pe.nombre AS persona_nombre, pe.apellido1 AS persona_apellido1, cu.anyo_inicio AS inicio_curso ,cu.anyo_fin AS fin_curso, pe.nif AS alumno_nif FROM alumno_se_matricula_asignatura ama INNER JOIN asignatura a ON ama.id_asignatura = a.id INNER JOIN persona pe ON id_alumno = pe.id INNER JOIN curso_escolar cu ON id_curso_escolar = cu.id WHERE pe.nif = '26902806M' AND pe.tipo = 'alumno' ORDER BY pe.apellido1, pe.apellido2, pe.nombre, a.nombre ; 

-- 8-Returns a list with the names of all the departments that have professors who teach a subject in the Degree in Computer Engineering (2015 Syllabus)
SELECT d.nombre AS departamento_nombre, a.nombre AS asignatura_nombre , gr.nombre AS grado_año FROM asignatura a INNER JOIN profesor p ON a.id_profesor = p.id_profesor INNER JOIN departamento d ON p.id_departamento = d.id INNER JOIN grado gr ON a.id_grado = gr.id WHERE gr.nombre LIKE '%2015%' ORDER BY d.nombre, a.nombre, gr.nombre;

-- 9-Returns a list of all students who have enrolled in a subject during the 2018/2019 school year.
SELECT pe.nombre AS nombre_alumno, pe.apellido1 AS apellido_alumno, pe.apellido2 AS segundo_apellido_alumno, a.nombre AS asignatura, ce.anyo_inicio AS inicio_curso, ce.anyo_fin AS final_curso FROM alumno_se_matricula_asignatura ama INNER JOIN persona pe ON ama.id_alumno = pe.id INNER JOIN asignatura a ON ama.id_asignatura = a.id INNER JOIN curso_escolar ce ON ama.id_curso_escolar = ce.id WHERE ce.anyo_inicio = 2018 AND ce.anyo_fin = 2019 AND pe.tipo = 'alumno' ORDER BY pe.apellido1, pe.apellido2, pe.nombre, a.nombre; 

-- Solve the following 6 queries using LEFT JOIN and RIGHT JOIN clauses.

-- 1-Returns a list with the names of all professors and the departments they are associated with. The list should also show those professors who do not have any associated departments. The list should return four columns, department name, first last name, second last name and professor's name. The result will be sorted alphabetically from lowest to highest by department name, last names and first name.
SELECT d.nombre AS departamento, pe.apellido1 AS apellido_profesor, pe.apellido2 AS segundo_apellido_profesor , pe.nombre AS nombre_profesor FROM profesor p LEFT JOIN persona pe ON p.id_profesor = pe.id LEFT JOIN departamento d ON p.id_departamento = d.id WHERE pe.tipo = 'profesor' ORDER BY d.nombre ASC, pe.nombre ASC, pe.apellido1 ASC , pe.apellido2 ASC  ;

-- 2-Returns a list of teachers who are not associated with a department.
SELECT pe.apellido1 AS apellido_profesor, pe.apellido2 AS segundo_apellido_profesor, pe.nombre AS nombre_profesor FROM profesor p LEFT JOIN persona pe ON p.id_profesor = pe.id LEFT JOIN departamento d ON p.id_departamento = d.id WHERE pe.tipo = 'profesor' AND d.id IS NULL ORDER BY pe.apellido1 ASC, pe.apellido2 ASC, pe.nombre ASC;

-- 3-Returns a list of departments that do not have associated professors
SELECT d.nombre AS departamento FROM departamento d LEFT JOIN profesor p ON d.id = p.id_departamento WHERE p.id_profesor IS NULL ORDER BY d.nombre;

-- 4-Returns a list of teachers who do not teach any subjects.
SELECT pe.nombre AS nombre_profesor, pe.apellido1 AS apellido_profesor FROM profesor p LEFT JOIN asignatura a ON p.id_profesor = a.id_profesor LEFT JOIN persona pe ON p.id_profesor = pe.id  WHERE a.id IS NULL ORDER BY pe.apellido1, pe.apellido2, pe.nombre;

-- 5-Returns a list of subjects that do not have an assigned teacher.
SELECT a.nombre AS asignatura FROM asignatura a LEFT JOIN profesor p on a.id_profesor = p.id_profesor WHERE a.id_profesor IS NULL ORDER BY a.nombre;

-- 6-Returns a list of all departments that have not taught subjects in any school year.
SELECT DISTINCT d.nombre AS departamentos FROM departamento d LEFT JOIN profesor p ON d.id = p.id_departamento LEFT JOIN asignatura a ON p.id_profesor = a.id_profesor WHERE a.id IS NULL ORDER BY d.nombre;

-- -Consultes resum:

-- 1-Returns the total number of students.
SELECT DISTINCT  p.apellido1 AS apellido_alumno, p.apellido2 AS segundo_apellido_alumno ,p.nombre AS nombre_alumno FROM persona p WHERE p.tipo = 'alumno' ORDER BY  p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC; 

-- 2-Calculates how many students were born in 1999.
SELECT DISTINCT  p.apellido1 AS apellido_alumno, p.apellido2 AS segundo_apellido_alumno ,p.nombre AS nombre_alumno, p.fecha_nacimiento  FROM persona p WHERE p.tipo = 'alumno' AND YEAR(p.fecha_nacimiento) = 1999 ORDER BY  p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC; 

-- 3-Calculate how many professors there are in each department. The result should only show two columns, one with the name of the department and another with the number of professors in that department. The result should only include departments that have associate professors and should be sorted from highest to lowest by the number of professors.
SELECT d.nombre AS departamento_nombre , COUNT(p.id) AS numero_profesores FROM profesor pr INNER JOIN persona p ON pr.id_profesor = p.id INNER JOIN departamento d ON pr.id_departamento = d.id WHERE p.tipo= 'profesor' GROUP BY d.nombre HAVING COUNT(p.id) > 0 ORDER BY numero_profesores DESC;

-- 4-Returns a list of all departments and the number of professors in each of them. Note that there may be departments that do not have associated professors. These departments must also appear in the list.
SELECT d.nombre AS departamento_nombre, COUNT(p.id) AS numero_profesores FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento LEFT JOIN persona p ON pr.id_profesor = p.id AND p.tipo = 'profesor'GROUP BY d.nombre ORDER BY numero_profesores DESC;

-- 5-Returns a list with the names of all the degrees in the database and the number of subjects each has. Note that there may be degrees that do not have associated subjects. These degrees must also appear in the list. The result must be ordered from highest to lowest by the number of subjects.
SELECT gr.nombre AS grado_nombre, COUNT(a.id) AS numero_asignaturas FROM grado gr LEFT JOIN asignatura a ON a.id_grado = gr.id GROUP BY gr.nombre ORDER BY numero_asignaturas DESC;

-- 6-Returns a list with the name of all the degrees existing in the database and the number of subjects each one has, of the degrees that have more than 40 associated subje
SELECT gr.nombre AS grado_nombre, COUNT(a.id) AS numero_creditos_asignaturas FROM grado gr LEFT JOIN asignatura a ON a.id_grado = gr.id GROUP BY gr.nombre HAVING  COUNT(a.id) > 40  ORDER BY numero_asignaturas DESC;

-- 7-Returns a list showing the name of the degrees and the sum of the total number of credits for each type of subject. The result should have three columns: name of the degree, type of subject, and the sum of the credits for all subjects of that type.
SELECT gr.nombre AS nombre_grado, a.tipo AS tipo_asignatura, SUM(a.creditos) AS total_creditos_asignaturas  FROM grado gr LEFT JOIN asignatura a ON a.id_grado = gr.id GROUP BY gr.nombre , a.tipo ORDER BY nombre_grado, tipo_asignatura;

-- 8-Returns a list showing how many students have enrolled in a subject in each of the school years. The result should show two columns, one column with the year the school year started and another with the number of students enrolled.
SELECT ce.anyo_inicio AS año_inicio_curso_escolar,COUNT(DISTINCT am.id_alumno) AS numero_estudiantes FROM curso_escolar ce LEFT JOIN alumno_se_matricula_asignatura am ON am.id_curso_escolar = ce.id GROUP BY ce.anyo_inicio ORDER BY ce.anyo_inicio;

-- 9-Returns a list with the number of subjects taught by each teacher. The list must take into account those teachers who do not teach any subjects. The result will show five columns: id, name, first name, second name and number of subjects. The result will be sorted from highest to lowest by the number of subjects
SELECT pe.id AS id_profesor, pe.nombre, pe.apellido1, pe.apellido2, COALESCE(COUNT(a.id), 0) AS numero_asignaturas FROM persona pe LEFT JOIN profesor p ON pe.id = p.id_profesor LEFT JOIN asignatura a ON a.id_profesor = p.id_profesor WHERE pe.tipo = 'profesor' GROUP BY pe.id, pe.nombre, pe.apellido1, pe.apellido2 ORDER BY numero_asignaturas DESC;

-- 10-Returns all the data for the youngest student.
SELECT pe.nombre, pe.apellido1, pe.apellido2, pe.ciudad, pe.direccion, pe.telefono, pe.fecha_nacimiento, pe.sexo FROM persona pe WHERE tipo = 'alumno' ORDER BY  pe.fecha_nacimiento DESC Limit 1;

-- 11-Returns a list of professors who have an associated department and who do not teach any subjects.
SELECT pe.nombre, pe.apellido1, pe.apellido2, d.nombre AS departamento FROM persona pe INNER JOIN profesor p ON pe.id = p.id_profesor INNER JOIN 
    departamento d ON p.id_departamento = d.id WHERE pe.tipo = 'profesor'AND p.id_profesor NOT IN ( SELECT DISTINCT id_profesor FROM asignatura WHERE id_profesor IS NOT NULL)ORDER BY pe.nombre, pe.apellido1, pe.apellido2;