-- Drop Database gestion_academica;

Create Database gestion_academica;

Create Type nivel_curso_enum As Enum ('Principiante', 'Intermedio', 'Avanzado');
Create Type metodo_pago_enum As Enum ('Tarjeta Credito', 'Paypal', 'Transferencia', 'Crypto');

Create Table instructores (
    id_instructor Serial Primary Key,
    nombre VarChar(120) Not Null,
    email VarChar(150) Unique Not Null,
    biografia Text,
    fecha_registro TimeStamp Not Null,
    activo Boolean Default True Not Null
);

Create Table cursos (
    id_curso Serial Primary key,
    nombre VarChar(120) Not Null,
    nivel nivel_curso_enum Default 'Principiante' Not Null,
    descripcion Text,
    fecha_publicacion Date Default Current_Date Not Null,
    horas_duracion SmallInt Not Null Check (horas_duracion >= 0),
    instructor_id Integer Not Null,
    -- Clave foránea
    Constraint fk_cursos_instructor 
     Foreign Key (instructor_id) 
     References instructores(id_instructor)
);

Create Table estudiantes(
    id_estudiante Serial Primary key,
    nombre VarChar(120) Not Null,
    fecha_nacimiento Date Not Null,
    fecha_inscripcion Date Default Current_Date Not Null,
    email VarChar(150) Unique Not Null,
    activo Boolean Default True Not Null
);

Create Table inscripciones(
    id_inscripcion Serial Primary key,
    estudiante_id Integer Not Null,
    curso_id Integer Not Null,
    calificacion Numeric(3, 1) Check(calificacion Between 1.0 And 10.0),
    fecha_inscripcion Date Default Current_Date Not Null,
    metodo_pago metodo_pago_enum Not Null,
    estado Boolean Default True Not Null,
    Constraint fk_inscripciones_estudiantes 
     Foreign Key (estudiante_id)
     References estudiantes(id_estudiante)
     On Delete Cascade,
    Constraint fk_inscripciones_cursos
     Foreign Key (curso_id)
     References cursos(id_curso)
     On Delete Cascade
);
