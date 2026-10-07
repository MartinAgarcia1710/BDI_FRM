-- Listar el nombre de cada curso junto con el nombre y email del instructor que
-- lo dicta. Solo deben figurar cursos que tengan un instructor asignado.

Select 
    c.nombre As curso,
    i.nombre As instructor,
    i.email As correo
From cursos c 
Inner Join instructores i On c.instructor_id = i.id_instructor;

select * from cursos;

-- Mostrar todos los cursos del catálogo junto con la cantidad de inscripciones
-- que tiene cada uno. Si un curso aún no tiene inscritos, debe figurar igualmente
-- en el listado mostrando 0.

Select 
    c.id_curso,
    c.nombre As curso,
    Count(ins.id_inscripcion) As total_inscriptos
From cursos c 
Left Join inscripciones ins On c.id_curso = ins.id_inscripcion 
Group By c.id_curso, c.nombre;


-- Mostrar todos los instructores de la academia y el nombre de los cursos que
-- tienen a cargo. Si algún instructor no dicta ningún curso todavía, debe
-- aparecer en la lista con el curso en blanco (NULL)

Select 
    i.nombre As instructor,
    i.email As correo,
    c.nombre As curso 
From cursos c 
Right Join instructores i On c.instructor_id = i.id_instructor 
Order By i.nombre; 


-- Obtener una lista completa que combine todos los estudiantes y todos los
-- cursos a través de las inscripciones: debe incluir estudiantes que aún
-- no se inscribieron a nada y cursos que aún no tienen estudiantes inscriptos.

Select 
    e.nombre As "Estudiante tabla estudiantes",
    ins.fecha_inscripcion As "inscripcion tabla inscripciones",
    c.nombre As "curso tabla cursos",
    ins.calificacion "califificacion tabla inscripciones"
From estudiantes e 
Full Join inscripciones ins On e.id_estudiante = ins.estudiante_id
Full Join cursos c On c.id_curso = ins.curso_id

-- Generar una planilla detallada de auditoría académica que muestre: el nombre
-- del estudiante, el curso en el que está inscripto, el instructor responsable,
-- el método de pago y la calificación obtenida, únicamente para inscripciones
-- con estado activo (TRUE).

Select 
    e.nombre As estudiante,
    c.nombre As curso,
    i.nombre As instructor,
    ins.metodo_pago As "método de pago",
    ins.calificacion 
From inscripciones ins
Inner Join estudiantes e  ON e.id_estudiante = ins.estudiante_id
Inner Join cursos c On ins.curso_id = c.id_curso
Inner Join instructores i On i.id_instructor = c.instructor_id
Where ins.estado = True


-- Mostrar el nombre del curso, la cantidad de inscritos y el promedio de calificación
-- obtenida, pero únicamente para aquellos cursos que tengan 2 o más alumnos inscriptos.

Select 
    c.nombre As curso, 
    count(ins.id_inscripcion) As "Total inscriptos",
    Avg(ins.calificacion) As promedio
From cursos c 
Inner Join inscripciones ins On c.id_curso = ins.curso_id 
Group By c.id_curso, c.nombre -- SIEMPRE QUE HAY UN GROUP BY NO SE PUEDE USAR WHERE, SE USA HAVING
Having count(ins.id_inscripcion) >= 2;



-- ----------------------------------------------------------------------------------------
-- Listar el nombre y las horas de duración de todos aquellos cursos cuya duración
-- sea estrictamente superior al promedio general de duración de los cursos de la academia.

Select 
    c.nombre,
    c.horas_duracion As duracion
From cursos c 
Where c.horas_duracion > (Select Avg(horas_duracion) From cursos);

-- Obtener los datos de aquellos estudiantes que se registraron en la plataforma pero nunca
-- se han inscripto en ningún curso.

Select 
    id_estudiante,
    nombre, 
    email, 
    fecha_inscripcion 
From estudiantes 
Where id_estudiante Not in (Select Distinct estudiante_id From inscripciones);






-- Mostrar el nombre y correo de los instructores que tengan al menos un curso que supere
-- las 40 horas de duración.


-- Averiguar cuál es el promedio de inscripciones por estudiante, calculando primero el
-- total de cursos tomados por cada alumno.

