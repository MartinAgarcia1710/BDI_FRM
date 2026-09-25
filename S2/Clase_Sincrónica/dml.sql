-- Insertado simple
Insert Into instructores (nombre, email, biografia, fecha_registro)
Values('Carlos Tevez', 'apache12@gmail.com', 'Delantero', '2026-10-5');

-- Insertado multiple
Insert Into instructores (nombre, email, biografia, fecha_registro)
Values
('Florencia Vazquez', 'florenci@yahoo.com', 'Instructora de tejido', '2026-1-1')
('Maria Garcia', 'maria@gamil.com', 'Programador Python, SQL', '2025-5-9'),

select * from instructores;

-- Actualización y borrado lógico
Update instructores
Set activo = False
Where id_instructor = 2

-- Borrado físico
1
Delete From instructores
Where id_instructor = 3