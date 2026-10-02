-- Traer todos los estudiantes con todos los atributos
Select * From estudiantes;
-----------------------------------------------------------------
-- Traer todos los cursos con todos los atributos
Select * From cursos;
-----------------------------------------------------------------
-- Traer solo dos cursos con nombre y nivel
Select nombre, nivel From cursos
Limit 2;
---------------------1--------------------------------------------
-- Obtener la cantidad total de estudiantes registrados en la plataforma.
Select Count(*) As Total_estudiantes
From estudiantes;
-- Variante con espacios en el pseudónimo
Select Count(*) As "Total estudiantes"
From estudiantes;
---------------------2--------------------------------------------
-- Obtener el total de inscripciones y compararlo con el total de 
-- inscripciones que ya cuentan con una calificación asignada.

Select 
    Count(*) As "Total inscripciones",
    Count(calificacion) As "Inscripciones con nota"
From inscripciones;

-- Validación de que hay X cantidad de inscripciones y X cantidad con calificación cargada.
Select * from inscripciones;
--------------------3---------------------------------------------
-- Identificar la menor y la mayor cantidad de horas que dura un curso en el catálogo.
Select 
    Min(horas_duracion) As "Duración mínima",
    Max(horas_duracion) As "Duración máxima"
From cursos;
--------------------4---------------------------------------------
-- Saber cuál es la fecha de nacimiento del estudiante más grande
-- (más antiguo) y del estudiante más joven.

Select 
    Min(fecha_nacimiento) As "Más viejo",
    Max(fecha_nacimiento) As "Más joven"
From estudiantes;

---------------------5-------------------------------------------

--Calcular la suma total de horas de todos los cursos y el
-- promedio general de duración de los cursos (redondeado a 2 decimales).
Select 
    Sum(horas_duracion) As "Total de horas de cursos",
    -- Estructura de la función Round():
    -- Round ("Valor a redondear", "cantidad de redondeo")
    Round(Avg(horas_duracion), 2) As "Promedio de horas"
From cursos;

-------------------------6---------------------------------------
-- Calcular el promedio de calificación y la nota más alta únicamente
-- de las inscripciones correspondientes al curso con ID = 1.

Select 
    Count(calificacion) As "Cantidad de calificados",
    Max(calificacion) As "Nota máxima",
    Round(Avg(calificacion), 2) As "Nota promedio"
From inscripciones
Where curso_id = 1;

-- Verificación: 
Select * from inscripciones
Where curso_id = 1


-------------------------7---------------------------------------
-- Mostrar cuántos cursos ofrece la academia según cada nivel de
-- dificultad (Principiante, Intermedio, Avanzado).

Select 
    nivel As "Nivel de curso",
    Count(*) As "Cantidad de cursos"
From cursos 
Group By nivel;

-------------------8-----------------------------------------------
--Contar cuántas inscripciones se realizaron por cada método de pago,
-- ordenadas de mayor a menor según la cantidad.

Select 
    metodo_pago As "Método de pago",
    Count(*) As "Total de inscripciones"
From inscripciones
Group By metodo_pago
Order By "Total de inscripciones" Desc;
