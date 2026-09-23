-- Los usuarios de la plataforma suelen realizar búsquedas recurrentes
-- filtrando establecimientos por su ciudad. Para evitar que el motor
-- recorra toda la tabla en cada búsqueda, creá un índice llamado 
-- idx_establecimientos_ciudad sobre dicha columna.

Create Index idx_establecimientos_ciudad
On establecimientos (ciudad);


-- Verificá el plan de ejecución real que utiliza PostgreSQL para consultar 
-- los festivales asociados a un establecimiento en particular 
-- (establecimiento_id = 1), observando si el motor realiza un escaneo 
-- secuencial (Seq Scan) o utiliza un índice.

Explain Analyze 
Select * from festivales
Where establecimiento_id = 1;

-- En la tabla de festivales agregamos la columna activo para borrado lógico.
-- Dado que el 95% de las consultas del sistema buscan únicamente eventos
-- vigentes (activo = TRUE), creá un índice parcial sobre la fecha del
-- festival que indexe exclusivamente las filas activas, ignorando las
-- canceladas o dadas de baja.

Create Index idx_festivales_fecha_activos
On festivales (fecha)
Where activo = True;