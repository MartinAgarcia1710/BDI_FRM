-- Crear una vista llamada "vista_cursos_activos" que devuelva el listado de 
-- cursos disponibles junto con el nombre y correo del instructor a cargo.
-- Debe excluir aquellos cursos cuyo instructor esté inactivo.

Create Or Replace View vista_cursos_activos As 
Select 
    c.id_curso,
    c.nombre As curso,
    c.nivel,
    c.horas_duracion,
    i.nombre As instructor,
    i.email 
From cursos c 
Inner Join instructores i On c.instructor_id = i.id_instructor 
Where i.activo = True;

-- LLamado a la vista.
Select * from vista_cursos_activos;

-- Crear una vista llamada "vista_rendimiento_cursos" que muestre por cada curso:
-- - El identificador, nombre y nivel del curso.
-- - La cantidad total de estudiantes inscriptos (mostrando 0 si no tiene alumnos).
-- - El promedio general de calificación (redondeado a 2 decimales).
-- - La lista de métodos de pago utilizados sin duplicados, separados por coma.
--   En caso de no haber pagos registrados, debe devolver 'Sin pagos registrados'.

Create Or Replace View vista_rendimiento_cursos As 
Select 
    c.id_curso,
    c.nombre As curso,
    c.nivel,
    Count(ins.id_inscripcion) As total_inscriptos,
    Round(Avg(ins.calificacion), 2) As promedio_calificacion,
    Coalesce(
        STRING_AGG(Distinct ins.metodo_pago::Text, ', ' Order By ins.metodo_pago::Text), 
        'Sin pagos registrados'
    ) As metodo_pago_usados
From cursos c 
Left Join inscripciones ins On ins.curso_id = c.id_curso 
Group By c.id_curso, c.nombre, c.nivel; 

-- Llamado a la vista
Select * from vista_rendimiento_cursos;