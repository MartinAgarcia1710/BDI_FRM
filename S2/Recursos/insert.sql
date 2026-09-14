-- Insertar un país
Insert Into paises (nombre) values ('Argentina');

-- Insertar múltiples países
Insert Into paises (nombre) VALUES
('Reino Unido'),
('Brasil'),
('Estados Unidos'),
('España'),
('Australia'),
('México'),
('Puerto Rico'),
('Paraguay');

-- Insertar un artista
Insert Into artistas (nombre, pais_id) Values ('Divididos', 1);

-- Insertar mùltiples registros.
Insert Into artistas (nombre, pais_id) Values
('Ciro y los Persas', 1),
('Skay', 1),
('Arctic Monkeys', 2),
('Wos', 1),
('Rosalía', 5),
('Iron Maiden', 2),
('Sepultura', 3),
('Megadeth', 4),
('Gorillaz', 2),
('Tame Impala', 6),
('Los Fabulosos Cadillacs', 1),
('Molotov', 7),
('Café Tacvba', 7),
('Las Pelotas', 1),
('Coldplay', 2),
('Dua Lipa', 2),
('Bad Bunny', 8),
('Kchiporros', 9);

-- Insertar establecimientos
Insert Into establecimientos(nombre, direccion, ciudad, capacidad, pais_id)
Values
('Aeródromo Santa María de Punilla', 'Ruta 38 km 24', 'Santa María de Punilla', 45000, 1),
('Hipódromo de San Isidro', 'Av. Bernabé Márquez 700', 'San Isidro', 100000, 1),
('Cidade do Rock', 'Av. Salvador Allende 6500', 'Río de Janeiro', 100000, 3),
('Parc del Fòrum', 'Carrer de la Pau 12', 'Barcelona', 80000, 5),
('Foro Sol', 'Viaducto Río de la Piedad s/n', 'Ciudad de México', 65000, 7),
('Tecnópolis', 'Av. Gral. Paz y Constituyentes', 'Villa Martelli', 50000, 1),
('Worthy Farm', 'Pilton s/n', 'Pilton', 210000, 2),
('Empire Polo Club', '81-800 Ave 51', 'Indio', 125000, 4),
('Parque Olímpico', 'Autopista Ñu Guasu', 'Luque', 40000, 9),
('Estadio Obras Sanitarias', 'Av. del Libertador 7395', 'CABA', 4700, 1);

-- Insertar festivales
Insert Into festivales (nombre, fecha, precio_ticket, establecimiento_id, activo) Values
('Cosquín Rock 2026', '2026-02-14', 75000.00, 1, True),
('Lollapalooza Argentina 2026', '2026-03-20', 120000.00, 2, True),
('Rock in Rio 2026', '2026-09-18', 160000.00, 3, True),
('Primavera Sound Barcelona', '2026-06-04', 180000.00, 4, True),
('Vive Latino 2026', '2026-03-14', 95000.00, 5, True),
('Quilmes Rock 2026', '2026-04-11', 60000.00, 6, True),
('Glastonbury Festival 2026', '2026-06-24', 220000.00, 7, True),
('Coachella Weekend 1', '2026-04-17', 250000.00, 8, True),
('Asuncionico 2026', '2026-03-24', 70000.00, 9, True),
('Pepsi Music Revival', '2026-10-10', 65000.00, 10, True);

-- Insertar lineup
Insert Into lineup (festival_id, artista_id) Values
(1,1),
(1, 2),
(1, 3),
(2, 4), 
(2, 5), 
(2, 6),
(3, 7),
(3, 8),
(3, 9), 
(4, 10), 
(4, 6), 
(4, 11), 
(5, 12), 
(5, 13), 
(5, 14),
(6, 1), 
(6, 15),
(6, 10),
(7, 16),
(7, 4),
(7, 17),
(8, 10),
(8, 18),
(8, 6),
(9, 4),
(9, 6),
(9, 19), 
(10, 12),
(10, 1);