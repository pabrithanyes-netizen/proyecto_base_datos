create schema bpanchana;

create table bpanchana.cliente(
id_cliente serial primary key,
tipo_identificacion VARCHAR(10) NOT NULL CHECK (tipo_identificacion IN ('CEDULA', 'RUC', 'PASAPORTE')),
identificacon varchar(13) not null,
nombre varchar(25),
apellido varchar(25),
correo varchar(250),
direccion varchar(250),
estado boolean,
creado_en timestamp,
actualizado_en timestamp
);

create table bpanchana.empleados(
id_empleados serial primary key,
tipo_identificacion VARCHAR(10) NOT NULL CHECK (tipo_identificacion IN ('CEDULA', 'RUC', 'PASAPORTE')),
identificacon varchar(13) not null,
nombre varchar(25),
apellido varchar(25),
correo varchar(250),
sueldo decimal (10,2),
estado boolean,
creado_en timestamp,
actualizado_en timestamp
);

create table bpanchana.Citas(
id_Citas serial primary key,
id_cliente int,
id_empleados int,
foreign key (id_cliente) references bpanchana.cliente(id_cliente),
foreign key (id_empleados) references bpanchana.empleados(id_empleados),
fecha_cita timestamp,
estado_cita varchar(100) not null default 'CONFIRMADA' check (estado_cita in('CONFIRMADA','ANULADA')),
estado boolean,
creado_en timestamp,
actualizado_en timestamp
);

create table bpanchana.Factura (
id_factura SERIAL PRIMARY KEY,
id_cliente INT not null,
fecha TIMESTAMP not null,
estado VARCHAR(20) DEFAULT 'PENDIENTE' check (estado IN ('PENDIENTE', 'PAGADA', 'ANULADA')),
subtotal DECIMAL(10, 2) not null check (subtotal >= 0),
impuesto DECIMAL(10, 2) DEFAULT 0 check (impuesto >= 0),
total DECIMAL(10, 2) NOT NULL check (total >= 0),
activo BOOLEAN,
creado_en TIMESTAMP,
actualizado_en TIMESTAMP,
foreign key (id_cliente) references bpanchana.Cliente(id_cliente)
);

create table bpanchana.Detalle_Factura (
id_detalle serial primary key,
id_factura int not null,
cantidad int not null check (cantidad > 0),
precio decimal(10, 2) not null check (precio >= 0),
subtotal_linea decimal(10, 2) not null check (subtotal_linea >= 0),
activo boolean default true,
creado_en timestamp,
actualizado_en timestamp,
foreign key (id_factura) references bpanchana.Factura(id_factura)
);
