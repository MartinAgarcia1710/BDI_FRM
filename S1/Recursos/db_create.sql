drop Database ticket_live;

Create Table paises(
    id_pais Serial Primary Key,
    nombre VarChar(100) Not Null Unique
);

Create Table establecimientos(
    id_establecimiento Serial Primary Key,
    nombre VarChar(150) Not Null,
    direccion VarChar(300) Not Null,
    ciudad VarChar(100) Not Null,
    capacidad Int Not Null Check(capacidad > 0),
    pais_id Int Not Null References paises(id_pais)
);

Create Table artistas(
    id_artista Serial Primary key,
    nombre VarChar(150) Not Null,
    pais_id Int Not Null References paises(id_pais)
);

Create Table festivales(
    id_festival Serial Primary Key,
    nombre VarChar(150) Not Null,
    fecha Date Not Null,
    precio_ticket Numeric(10, 2) Not Null Check(precio_ticket >= 0),
    establecimiento_id Int Not Null References establecimientos(id_establecimiento)
);

Create Table lineup(
    festival_id Int Not Null References festivales(id_festival) On Delete Cascade,
    artista_id Int Not Null References artistas(id_artista) On Delete Cascade,
    Primary Key(festival_id, artista_id)
);



