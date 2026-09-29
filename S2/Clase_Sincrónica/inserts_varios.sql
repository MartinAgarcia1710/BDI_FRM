-- 1. INSTRUCTORES (4 instructores)
INSERT INTO instructores (nombre, email, biografia, fecha_registro, activo) VALUES
('Alan Turing', 'alan.turing@academia.com', 'Pionero en ciencias de la computación y criptografía.', '2025-01-10 10:00:00', TRUE),
('Ada Lovelace', 'ada.lovelace@academia.com', 'Primera programadora de la historia, experta en algoritmos.', '2025-02-15 11:30:00', TRUE),
('Grace Hopper', 'grace.hopper@academia.com', 'Pionera en desarrollo de compiladores y lenguajes legibles.', '2025-03-01 09:15:00', TRUE),
('Charles Babbage', 'charles.babbage@academia.com', 'Diseñador de la máquina analítica.', '2025-04-12 16:45:00', FALSE);

-- 2. CURSOS (6 cursos)
INSERT INTO cursos (nombre, nivel, descripcion, fecha_publicacion, horas_duracion, instructor_id) VALUES
('Introducción a SQL y Modelado Relacional', 'Principiante', 'Aprende bases de datos desde cero con PostgreSQL.', '2025-02-01', 20, 1),
('Algoritmos y Estructuras de Datos', 'Intermedio', 'Estructuras clásicas, grafos y complejidad algorítmica.', '2025-03-10', 45, 2),
('Arquitectura de Compiladores', 'Avanzado', 'Análisis léxico, sintáctico y generación de código intermedio.', '2025-04-05', 60, 3),
('PostgreSQL para Desarrolladores', 'Intermedio', 'Consultas avanzadas, transacciones e índices.', '2025-04-20', 30, 1),
('Fundamentos de Computación', 'Principiante', 'Conceptos básicos de hardware, lógica binaria y software.', '2025-01-20', 15, 2),
('Seguridad Informática y Cifrado', 'Avanzado', 'Técnicas de criptografía moderna y seguridad en redes.', '2025-05-01', 50, 1);

-- 3. ESTUDIANTES
INSERT INTO estudiantes (nombre, fecha_nacimiento, fecha_inscripcion, email, activo) VALUES
('Carlos Méndez', '1998-05-14', '2025-02-10', 'carlos.mendez@mail.com', TRUE),
('Lucía Fernández', '2001-11-23', '2025-02-15', 'lucia.f@mail.com', TRUE),
('Martín Gómez', '1995-03-30', '2025-03-01', 'martin.gomez@mail.com', TRUE),
('Valeria Ramos', '2003-07-09', '2025-03-12', 'valeria.ramos@mail.com', FALSE),
('Santiago Cruz', '1999-12-01', '2025-03-25', 'santiago.cruz@mail.com', TRUE),
('Mariana Díaz', '2002-08-18', '2025-04-02', 'mariana.diaz@mail.com', TRUE);

-- 4. INSCRIPCIONES
INSERT INTO inscripciones (estudiante_id, curso_id, calificacion, fecha_inscripcion, metodo_pago, estado) VALUES
(1, 1, 8.5, '2025-02-12', 'Tarjeta Credito', TRUE),
(2, 1, 9.0, '2025-02-16', 'Paypal', TRUE),
(3, 1, 6.5, '2025-03-02', 'Transferencia', TRUE),
(1, 2, NULL, '2025-03-15', 'Tarjeta Credito', TRUE),
(4, 5, 7.0, '2025-03-20', 'Crypto', FALSE),         
(5, 4, 10.0, '2025-04-01', 'Tarjeta Credito', TRUE),
(6, 2, 8.0, '2025-04-05', 'Transferencia', TRUE),
(2, 4, NULL, '2025-04-10', 'Paypal', TRUE);         

select * from instructores;
