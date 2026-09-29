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



Create table cosas2(
    id serial,
    num numeric(3,2)
)

insert into cosas2 (num) values(7.1225)

select * from cosas2;

select * from instructores;

INSERT INTO instructores (nombre, email, fecha_registro, activo) VALUES
('profe prueba', 'profe.prueba@academia.com', '2025-01-10 10:00:00', TRUE)
