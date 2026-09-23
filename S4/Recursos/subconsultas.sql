-- El equipo de finanzas quiere destacar los eventos de alta gama. Listar 
-- el nombre del festival, la fecha y el precio del ticket de aquellos
-- festivales cuyo valor supere el precio promedio global de todos los
-- festivales de la plataforma.

Select f.nombre, f.fecha, f.precio_ticket
From festivales f 
Where f.precio_ticket > (Select Avg(f2.precio_ticket) From festivales f2)

-- Identificar los nombres de todos los artistas que están convocados
-- para tocar en festivales que se lleven a cabo en recintos con una
-- capacidad superior a 80.000 personas.

Select a.nombre
From artistas a 
Where a.id_artista In (
    Select l.artista_id 
    From lineup l 
    Inner Join festivales f On l.festival_id = f.id_festival
    Inner Join establecimientos e On f.establecimiento_id = e.id_establecimiento 
    Where e.capacidad > 80000
)

-- Por un replanteo en la base de datos, se requiere detectar aquellos
-- artistas registrados que no figuran en ningún festival (ninguna
-- fila en la tabla lineup), utilizando la técnica de NOT EXISTS

Select a.nombre As "Artista sin fecha"
From artistas a 
Where Not Exists (
    Select 1 
    from lineup l 
    Where l.artista_id = a.id_artista
)

-- Se requiere calcular el promedio de bandas o solistas por festival
-- en toda la compañía. Para lograrlo, primero se debe contar la cantidad
-- de artistas de cada festival en una tabla temporal, y luego calcular
-- el promedio general de esos conteos.

