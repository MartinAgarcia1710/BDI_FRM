-- Crear una función llamada "fn_promedio_estudiante" que reciba el ID de un 
-- estudiante (p_estudiante_id INT) y retorne su promedio de calificaciones 
-- redondeado a un decimal (NUMERIC(3, 1)). Si el estudiante no posee notas 
-- o no está registrado, debe retornar 0.0.

Create Or Replace Function fn_promedio_estudiante(p_estudiante_id Int)
Returns Numeric(3, 1)
Language plpgsql
As $$
Declare 
    v_promedio Numeric(3, 1) := 0.0;
Begin 
    Select Round(Avg(calificacion), 1) Into v_promedio
    From inscripciones 
    Where estudiante_id = p_estudiante_id;

    return Coalesce(v_promedio, 0.0);
End;
$$

-- LLamado a la función
Select fn_promedio_estudiante(2) As promedio_alumno_2;












-- Crear una función llamada "fn_buscar_estudiantes_por_curso" que reciba parte o el 
-- nombre completo de un curso (p_nombre_curso VARCHAR) y retorne una tabla con:
-- id_estudiante, nombre, email, fecha_inscripcion y calificacion de los alumnos 
-- anotados en cursos coincidentes (usando búsqueda insensible a mayúsculas con ILIKE).