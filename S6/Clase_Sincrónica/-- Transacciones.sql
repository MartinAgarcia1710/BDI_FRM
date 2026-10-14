-- Transacciones

Begin;
    Update inscripciones Set estado = False Where estudiante_id = 1 And curso_id = 1;

    -- Se me cayo todo

    Insert Into inscripciones (estudiante_id, curso_id, metodo_pago, estado)
    Values(1, 2, 'Transferencia', True);

Commit;