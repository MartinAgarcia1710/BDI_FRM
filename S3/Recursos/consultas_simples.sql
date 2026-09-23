-- El área de marketing necesita identificar los festivales más accesibles
-- económicamente. Se pide listar el nombre, la fecha y el precio del ticket
-- de aquellos festivales cuyo valor esté entre $60.000 y $150.000. El listado 
-- debe mostrarse ordenado de menor a mayor por precio y limitado a los 3 primeros
-- resultados.

Select nombre, fecha, precio_ticket 
From festivales
Where precio_ticket Between 60000.00 And 150000.00
Order By precio_ticket Asc 
Limit 3;

-- La gerencia solicita un informe rápido del catálogo de establecimientos para evaluar 
-- capacidades. Se requiere calcular: la cantidad total de establecimientos registrados,
-- la capacidad promedio de los recintos, y la capacidad máxima disponible. Las columnas
-- del resultado deben tener nombres legibles y claros.

Select 
    Count(*) As "Total establecimientos",
    Round(Avg(capacidad)) As "capacidad promedio",
    Max(capacidad) As mayor_capacidad
From establecimientos;


-- Para la cartelera web, se requiere listar el nombre del festival,
-- el año en que se realiza y una etiqueta de categorización de precio: 
-- si el ticket cuesta más de $150.000 se clasificará como 'Premium',
-- si cuesta entre $80.000 y $150.000 como 'Estándar', y si es menor, 
-- como 'Económico'.

Select 
    nombre, 
    Extract(Year From fecha) As "Año de edición",
    precio_ticket,
    Case 
        When precio_ticket > 150000.00 Then 'Premium'
        When precio_ticket >= 80000.00 Then 'Estándar'
        Else 'Económico'
    End As "Categoría"
From festivales
Order By precio_ticket Desc
