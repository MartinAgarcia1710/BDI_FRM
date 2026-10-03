--Create DataBase gestion_ventas;

Create Table productos(
    idp Serial Primary Key,
    nombre VarChar(150) Not Null,
    precio_costo Numeric(10, 2) Not Null Check(precio_costo >= 0),
    precio_publico Numeric(10, 2) Not Null Check(precio_costo >= 0),
    stock Int Not Null Default 0 Check(stock >= 0),
    estado Boolean Not Null Default True
);

Create Table ventas(
    idv Serial Primary Key,
    fecha TimeStamp Not Null Default Current_TimeStamp,
    total Numeric(12, 2) Not Null Default 0.00 Check (total >= 0),
    estado VarChar(50) Not Null Default 'Pendiente'
);

Create Table detalle_ventas(
    id_venta Int Not Null,
    id_producto Int Not Null,
    cantidad Integer Not Null Check (cantidad > 0),
    precio_unitario Numeric (10,2) Not Null Check(precio_unitario >= 0),

    -- Clave primaria
    Constraint pk_detalle_ventas Primary Key (id_venta, id_producto),

    -- Claves foráneas
    Constraint fk_detalle_ventas Foreign Key (id_venta) References ventas(idv),
    Constraint fk_detalle_productos Foreign Key (id_producto) References productos(idp)
);