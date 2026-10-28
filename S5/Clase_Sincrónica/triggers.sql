-- Crear un trigger llamado "trigger_validar_calificacion_update" sobre la tabla "inscripciones"
-- que se dispare antes de actualizar una fila (BEFORE UPDATE FOR EACH ROW).
-- Reglas de negocio a validar:
-- 1. No se puede calificar una inscripción inactiva (estado = FALSE).
-- 2. Si la inscripción ya tenía una calificación registrada (OLD.calificacion IS NOT NULL),
--    no se permite reducir la nota respecto a la que ya tenía (NEW.calificacion >= OLD.calificacion).
-- En caso de incumplir alguna regla, cancelar la operación arrojando una excepción detallada.


-- Paso 1: Creación de función que retorna Trigger.
Create Or Replace Function trg_controlar_calificacion_update()
Returns Trigger 
Language plpgsql 
As $$
Begin 

    If New.estado is False And New.calificacion Is Not Null Then
        Raise Exception 'No se puede asignar calificación a una inscripción inactiva (ID: %).', New.id_inscripcion;
    End If;

    If Old.calificacion Is Not Null And New.calificacion < Old.calificacion Then
        Raise Exception 'Operación rechazada: La nueva calificación (%) no puede ser menor a la nota previa (%)', New.calificacion, Old.calificacion;
    End If;

    Return New;
End;
$$;

-- Paso 2: Creación del trigger
Create Or Replace Trigger trigger_validar_calificacion_update 
Before Update On inscripciones
For Each Row 
Execute Function trg_controlar_calificacion_update();

-- Evaluación de trigger

Update inscripciones Set calificacion = 1.5 Where id_inscripcion = 5;




