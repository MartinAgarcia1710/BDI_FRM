Create Database bodega_db;

Create Table vinos(
    codigo_vino VarChar(6) Primary Key,
    nombre VarChar(50) Not Null,
    cepa VarChar(50) Not Null,
    cosecha Int Not Null Check (cosecha Between 1900 and Year(current_date)),
    precio Numeric(10,2) Check (precio >= 0)
);

Create Table guias(
    legajo Serial Primary Key,
    nombre VarChar(150) Not Null,
    idioma VarChar(80) Not Null
);

Create Table turistas(
    ID_turista Serial Primary Key,
    nombre VarChar(150) Not Null,
    pais VarChar(100) Not Null
);

Create Table visitas(
    ID_visita Serial Primary key,
    fecha Date Not Null,
    turno VarChar(15) Check(turno In ('Mañana', 'Tarde')),
    legajo Int Not Null References guias (legajo),
    Unique(fecha, turno, legajo)
);

Create Table visita_turista(
    id_visita Int Not Null References visita (ID_visita),
    id_turista Int Not Null References turistas(ID_turista),
    Primary Key (id_visita, id_turista)
);

Create Table desgustaciones(
    id_visita Int Not Null References visita (ID_visita),
    id_turista Int Not Null References turistas(ID_turista),
    vino_codigo VarChar(6) References vino(codigo_vino),
    cantidad_copas Int Not Null Check(copas > 0),
    precio_cobrado Numeric(10,2) Check (precio_cobrado > 0)
    Primary Key (id_visita, id_turista, vino_codigo)
)
