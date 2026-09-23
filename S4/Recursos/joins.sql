-- La productora necesita armar la cartelera oficial para la página web.
-- Se solicita mostrar el nombre del festival, la fecha, el nombre del
-- establecimiento donde se realiza y el nombre del país al que pertenece
-- dicho establecimiento. Ordenar cronológicamente por fecha.

Select 
    f.nombre As "Festival",
    fecha,
    e.nombre As "Establecimiento",
    p.nombre As "País"
From festivales f
Inner Join establecimientos e On f.establecimiento_id = e.id_establecimiento
Inner Join paises p On e.pais_id = p.id_pais
Order By f.fecha Asc;


-- El área de relaciones internacionales desea saber qué países del
-- catálogo maestro todavía no tienen ningún artista registrado en
-- la plataforma, para orientar futuras contrataciones.

Select p.nombre As "País sin artistas"
From paises p 
Left Join artistas a On a.pais_id = p.id_pais
Where a.id_artista Is Null

-- Se necesita un reporte gerencial que muestre cuántos festivales
-- se celebran por país de establecimiento, junto con el precio
-- promedio de sus tickets. Para descartar sedes con poca actividad,
-- mostrar únicamente aquellos países que alberguen más de un festival.

Select 
    p.nombre As "País",
    Count(f.id_festival) As cantidad_festivales,
    Round(Avg(f.precio_ticket), 1) As "Ticket promedio"
From festivales f 
Inner Join establecimientos e On f.establecimiento_id = e.id_establecimiento
Inner join paises p On e.pais_id = p.id_pais
Group By p.nombre
Having Count(f.id_festival) > 1
Order By cantidad_festivales


-- La gerencia de operaciones necesita una auditoría global de presencia
-- geográfica: listar todos los países registrados junto con los festivales
-- asociados. Deben figurar los festivales que ya tienen país sede, los 
-- países donde todavía no se organiza ningún festival, y también aquellos
-- festivales en etapa de planificación que aún no cuentan con sede ni país
-- asignado.

Select 
    p.nombre As "País",
    f.nombre As "Festival",
    f.fecha
From paises p 
Left Join establecimientos e On e.pais_id = p.id_pais
Full Join festivales f ON f.establecimiento_id = e.id_establecimiento
