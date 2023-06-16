use GD1C2023
go

-------- TABLAS DE DIMENSIONES --------

create table CARPINCHO_LOVERS.dimension_dia_semana(
    dimension_dia_semana_id decimal(18, 0) not null identity(1, 1),
    nombre nvarchar(50) not null
)

create table CARPINCHO_LOVERS.dimension_provincia_localidad(
    dimension_provincia_localidad_id decimal(18, 0) not null identity(1, 1),
    nombre_provincia nvarchar(255) not null,
    nombre_localidad nvarchar(255) not null
)

create table CARPINCHO_LOVERS.dimension_rango_horario(
    dimension_rango_horario_id decimal(18, 0) not null identity(1, 1),
    horario_descripcion nvarchar(50) not null,
    horario_desde decimal(18, 0) not null,
    horario_hasta decimal(18, 0) not null
)

create table CARPINCHO_LOVERS.dimension_rango_etario(
    dimension_rango_etario_id decimal(18, 0) not null identity(1, 1),
    edad_descripcion nvarchar(50) not null,
    edad_desde decimal(3, 0) not null,
    edad_hasta decimal(3, 0) not null
)

create table CARPINCHO_LOVERS.dimension_tiempo(
    dimension_tiempo_id decimal(18, 0) not null identity(1, 1),
    anio decimal(4, 0) not null,
    mes decimal(2, 0) not null
)

create table CARPINCHO_LOVERS.dimension_estado_reclamo(
    dimension_estado_reclamo_id decimal(18, 0) not null identity(1, 1),
    estado_reclamo_descripcion nvarchar(50) not null
)

create table CARPINCHO_LOVERS.dimension_estado_pedido(
    dimension_estado_pedido_id decimal(18, 0) not null identity(1, 1),
    estado_pedido_descripcion nvarchar(50) not null
)

create table CARPINCHO_LOVERS.dimension_estado_envio_mensajeria(
    dimension_estado_envio_mensajeria_id decimal(18, 0) not null identity(1, 1),
    estado_mensajeria_descripcion nvarchar(50) not null
)

create table CARPINCHO_LOVERS.dimension_tipo_reclamo(
    dimension_tipo_reclamo_id decimal(18, 0) not null identity(1, 1),
    reclamo_tipo_descripcion nvarchar(50) not null
)

create table CARPINCHO_LOVERS.dimension_local(
    dimension_local_id decimal(18, 0) not null identity(1, 1),
    local_nombre nvarchar(100) not null
)

create table CARPINCHO_LOVERS.dimension_categoria_local(
    dimension_tipo_local_categoria_id decimal(18, 0) not null identity(1, 1),
    categoria_nombre nvarchar(100) not null,
    tipo_local_descripcion nvarchar(50) not null
)

create table CARPINCHO_LOVERS.dimension_tipo_movilidad(
    dimension_tipo_movilidad_id decimal(18,0) not null identity(1, 1),
    movilidad_tipo_descripcion nvarchar(50) not null
)

create table CARPINCHO_LOVERS.dimension_tipo_medio_de_pago(
    dimension_tipo_medio_de_pago_id decimal(18,0) not null identity(1, 1),
    tipo_medio_de_pago_descripcion nvarchar(50)
)

create table CARPINCHO_LOVERS.dimension_tipo_paquete(
    dimension_tipo_paquete_id decimal(18,0) not null identity(1, 1),
    tipo_paquete_descripcion nvarchar(255) not null
)


-------- TABLAS DE HECHOS --------

create table CARPINCHO_LOVERS.hechos_mensajeria(
    dimension_dia_semana_id decimal(18,0) not null,
    dimension_tiempo_id decimal(18,0) not null,
    dimension_estado_envio_mensajeria_id decimal(18,0) not null,
    dimension_tipo_movilidad_id decimal(18,0) not null,
    dimension_provincia_localidad_id decimal(18,0) not null,
    dimension_tipo_medio_de_pago_id decimal(18,0) not null,
    dimension_tipo_paquete_id decimal(18,0) not null,
    dimension_rango_horario_id decimal(18,0) not null,
    dimension_rango_etario_id decimal(18,0) not null,
    promedio_valor_asegurado decimal(18,2) not null,
    desvio_promedio_tiempo_entrega decimal(18,2) not null
)

create table CARPINCHO_LOVERS.hechos_reclamos(
    dimension_dia_semana_id decimal(18, 0) not null,
    dimension_tiempo_id decimal(18, 0) not null,
    dimension_local_id decimal(18, 0) not null,
    dimension_estado_reclamo_id decimal(18, 0) not null,
    dimension_rango_horario_id decimal(18, 0) not null,
    dimension_rango_etario_id decimal(18, 0) not null,
    dimension_tipo_reclamo_id decimal(18, 0) not null,
    cantidad_reclamos decimal(18, 0) not null,
    tiempo_promedio_resolucion decimal(18, 2) not null,
    monto_cupones decimal(18, 2) not null
)

create table CARPINCHO_LOVERS.hechos_pedidos(
    dimension_dia_semana_id decimal(18, 0) not null,
    dimension_rango_horario_id decimal(18, 0) not null,
    dimension_provincia_localidad_id decimal(18, 0) not null,
    dimension_tipo_local_categoria_id decimal(18, 0) not null,
    dimension_tiempo_id decimal(18, 0) not null,
    dimension_tipo_movilidad_id decimal(18, 0) not null,
    dimension_local_id decimal(18, 0) not null,
    dimension_estado_pedido_id decimal(18, 0) not null,
    dimension_rango_etario_usuario decimal(18, 0) not null,
    dimension_rango_etario_repartidor decimal(18, 0) not null,
    desvio_promedio_tiempo_entrega decimal(18, 2) not null,
    promedio_calificacion decimal(18, 2) not null,
    cantidad_pedidos decimal(18, 0) not null,
    monto_total_pedidos decimal(18, 2) not null,
    monto_promedio_envios decimal(18, 2) not null,
    monto_total_cupones decimal(18, 2) not null
)
go

-------- PKs --------
-- Dimensiones
alter table CARPINCHO_LOVERS.dimension_dia_semana add constraint pk_dimension_dia_semana primary key (dimension_dia_semana_id)
alter table CARPINCHO_LOVERS.dimension_provincia_localidad add constraint pk_dimension_provincia_localidad primary key (dimension_provincia_localidad_id)
alter table CARPINCHO_LOVERS.dimension_rango_horario add constraint pk_dimension_rango_horario primary key (dimension_rango_horario_id)
alter table CARPINCHO_LOVERS.dimension_rango_etario add constraint pk_dimension_rango_etario primary key (dimension_rango_etario_id)
alter table CARPINCHO_LOVERS.dimension_tiempo add constraint pk_dimension_tiempo primary key (dimension_tiempo_id)
alter table CARPINCHO_LOVERS.dimension_estado_reclamo add constraint pk_dimension_estado_reclamo primary key (dimension_estado_reclamo_id)
alter table CARPINCHO_LOVERS.dimension_estado_pedido add constraint pk_dimension_estado_pedido primary key (dimension_estado_pedido_id)
alter table CARPINCHO_LOVERS.dimension_estado_envio_mensajeria add constraint pk_dimension_estado_envio_mensajeria primary key (dimension_estado_envio_mensajeria_id)
alter table CARPINCHO_LOVERS.dimension_tipo_reclamo add constraint pk_dimension_tipo_reclamo primary key (dimension_tipo_reclamo_id)
alter table CARPINCHO_LOVERS.dimension_local add constraint pk_dimension_local primary key (dimension_local_id)
alter table CARPINCHO_LOVERS.dimension_categoria_local add constraint pk_dimension_categoria_local primary key (dimension_tipo_local_categoria_id)
alter table CARPINCHO_LOVERS.dimension_tipo_movilidad add constraint pk_dimension_tipo_movilidad primary key (dimension_tipo_movilidad_id)
alter table CARPINCHO_LOVERS.dimension_tipo_medio_de_pago add constraint pk_dimension_tipo_medio_de_pago primary key (dimension_tipo_medio_de_pago_id)
alter table CARPINCHO_LOVERS.dimension_tipo_paquete add constraint pk_dimension_tipo_paquete primary key (dimension_tipo_paquete_id)

-- Hechos
alter table CARPINCHO_LOVERS.hechos_mensajeria add constraint pk_hechos_mensajeria primary key (dimension_dia_semana_id, dimension_tiempo_id, dimension_estado_envio_mensajeria_id, 
                dimension_tipo_movilidad_id, dimension_provincia_localidad_id, dimension_tipo_medio_de_pago_id, dimension_tipo_paquete_id, dimension_rango_horario_id, dimension_rango_etario_id)

alter table CARPINCHO_LOVERS.hechos_pedidos add constraint pk_hechos_pedidos primary key (dimension_dia_semana_id, dimension_rango_horario_id, dimension_provincia_localidad_id, 
                dimension_tipo_local_categoria_id, dimension_tiempo_id, dimension_tipo_movilidad_id, dimension_local_id, dimension_estado_pedido_id, dimension_rango_etario_usuario,
                dimension_rango_etario_repartidor)

alter table CARPINCHO_LOVERS.hechos_reclamos add constraint pk_hechos_reclamos primary key (dimension_dia_semana_id, dimension_tiempo_id, dimension_local_id, dimension_estado_reclamo_id, 
                dimension_rango_horario_id, dimension_rango_etario_id, dimension_tipo_reclamo_id)

-------- FKs --------
-- Hechos
alter table CARPINCHO_LOVERS.hechos_mensajeria add constraint fk_hecho_mensajeria_dimension_dia_semana foreign key (dimension_dia_semana_id)
        references CARPINCHO_LOVERS.dimension_dia_semana (dimension_dia_semana_id)
alter table CARPINCHO_LOVERS.hechos_mensajeria add constraint fk_hecho_mensajeria_dimension_tiempo foreign key (dimension_tiempo_id)
        references CARPINCHO_LOVERS.dimension_tiempo (dimension_tiempo_id)
alter table CARPINCHO_LOVERS.hechos_mensajeria add constraint fk_hecho_mensajeria_dimension_estado_envio_mensajeria foreign key (dimension_estado_envio_mensajeria_id)
        references CARPINCHO_LOVERS.dimension_estado_envio_mensajeria (dimension_estado_envio_mensajeria_id)
alter table CARPINCHO_LOVERS.hechos_mensajeria add constraint fk_hecho_mensajeria_dimension_tipo_movilidad foreign key (dimension_tipo_movilidad_id)
        references CARPINCHO_LOVERS.dimension_tipo_movilidad (dimension_tipo_movilidad_id)
alter table CARPINCHO_LOVERS.hechos_mensajeria add constraint fk_hecho_mensajeria_dimension_provincia_localidad foreign key (dimension_provincia_localidad_id)
        references CARPINCHO_LOVERS.dimension_provincia_localidad (dimension_provincia_localidad_id)
alter table CARPINCHO_LOVERS.hechos_mensajeria add constraint fk_hecho_mensajeria_dimension_tipo_medio_de_pago foreign key (dimension_tipo_medio_de_pago_id)
        references CARPINCHO_LOVERS.dimension_tipo_medio_de_pago (dimension_tipo_medio_de_pago_id)
alter table CARPINCHO_LOVERS.hechos_mensajeria add constraint fk_hecho_mensajeria_dimension_tipo_paquete foreign key (dimension_tipo_paquete_id)
        references CARPINCHO_LOVERS.dimension_tipo_paquete (dimension_tipo_paquete_id)
alter table CARPINCHO_LOVERS.hechos_mensajeria add constraint fk_hecho_mensajeria_dimension_rango_horario foreign key (dimension_rango_horario_id)
        references CARPINCHO_LOVERS.dimension_rango_horario (dimension_rango_horario_id)
alter table CARPINCHO_LOVERS.hechos_mensajeria add constraint fk_hecho_mensajeria_dimension_rango_etario foreign key (dimension_rango_etario_id)
        references CARPINCHO_LOVERS.dimension_rango_etario (dimension_rango_etario_id)

alter table CARPINCHO_LOVERS.hechos_pedidos add constraint fk_hecho_pedido_dimension_dia_semana foreign key (dimension_dia_semana_id)
        references CARPINCHO_LOVERS.dimension_dia_semana (dimension_dia_semana_id)
alter table CARPINCHO_LOVERS.hechos_pedidos add constraint fk_hecho_pedido_dimension_rango_horario foreign key (dimension_rango_horario_id)
        references CARPINCHO_LOVERS.dimension_rango_horario (dimension_rango_horario_id)
alter table CARPINCHO_LOVERS.hechos_pedidos add constraint fk_hecho_pedido_dimension_provincia_localidad foreign key (dimension_provincia_localidad_id)
        references CARPINCHO_LOVERS.dimension_provincia_localidad (dimension_provincia_localidad_id)
alter table CARPINCHO_LOVERS.hechos_pedidos add constraint fk_hecho_pedido_dimension_categoria_local foreign key (dimension_tipo_local_categoria_id)
        references CARPINCHO_LOVERS.dimension_categoria_local (dimension_tipo_local_categoria_id)
alter table CARPINCHO_LOVERS.hechos_pedidos add constraint fk_hecho_pedido_dimension_tiempo foreign key (dimension_tiempo_id)
        references CARPINCHO_LOVERS.dimension_tiempo (dimension_tiempo_id)
alter table CARPINCHO_LOVERS.hechos_pedidos add constraint fk_hecho_pedido_dimension_tipo_movilidad foreign key (dimension_tipo_movilidad_id)
        references CARPINCHO_LOVERS.dimension_tipo_movilidad (dimension_tipo_movilidad_id)
alter table CARPINCHO_LOVERS.hechos_pedidos add constraint fk_hecho_pedido_dimension_local foreign key (dimension_local_id)
        references CARPINCHO_LOVERS.dimension_local (dimension_local_id)
alter table CARPINCHO_LOVERS.hechos_pedidos add constraint fk_hecho_pedido_dimension_estado_pedido foreign key (dimension_estado_pedido_id)
        references CARPINCHO_LOVERS.dimension_estado_pedido (dimension_estado_pedido_id)
alter table CARPINCHO_LOVERS.hechos_pedidos add constraint fk_hecho_pedido_dimension_rango_etario_usuario foreign key (dimension_rango_etario_usuario)
        references CARPINCHO_LOVERS.dimension_rango_etario (dimension_rango_etario_id)
alter table CARPINCHO_LOVERS.hechos_pedidos add constraint fk_hecho_pedido_dimension_rango_etario_repartidor foreign key (dimension_rango_etario_repartidor)
        references CARPINCHO_LOVERS.dimension_rango_etario (dimension_rango_etario_id)

alter table CARPINCHO_LOVERS.hechos_reclamos add constraint fk_hecho_reclamo_dimension_dia_semana foreign key (dimension_dia_semana_id)
        references CARPINCHO_LOVERS.dimension_dia_semana (dimension_dia_semana_id)
alter table CARPINCHO_LOVERS.hechos_reclamos add constraint fk_hecho_reclamo_dimension_tiempo foreign key (dimension_tiempo_id)
        references CARPINCHO_LOVERS.dimension_tiempo (dimension_tiempo_id)
alter table CARPINCHO_LOVERS.hechos_reclamos add constraint fk_hecho_reclamo_dimension_local foreign key (dimension_local_id)
        references CARPINCHO_LOVERS.dimension_local (dimension_local_id)
alter table CARPINCHO_LOVERS.hechos_reclamos add constraint fk_hecho_reclamo_dimension_estado_reclamo foreign key (dimension_estado_reclamo_id)
        references CARPINCHO_LOVERS.dimension_estado_reclamo (dimension_estado_reclamo_id)
alter table CARPINCHO_LOVERS.hechos_reclamos add constraint fk_hecho_reclamo_dimension_rango_horario foreign key (dimension_rango_horario_id)
        references CARPINCHO_LOVERS.dimension_rango_horario (dimension_rango_horario_id)
alter table CARPINCHO_LOVERS.hechos_reclamos add constraint fk_hecho_reclamo_dimension_rango_etario foreign key (dimension_rango_etario_id)
        references CARPINCHO_LOVERS.dimension_rango_etario (dimension_rango_etario_id)
alter table CARPINCHO_LOVERS.hechos_reclamos add constraint fk_hecho_reclamo_dimension_tipo_reclamo foreign key (dimension_tipo_reclamo_id)
        references CARPINCHO_LOVERS.dimension_tipo_reclamo (dimension_tipo_reclamo_id)
go

-------- Funciones --------

create function CARPINCHO_LOVERS.buscar_rango_etario_id(@fecha_nacimiento date) returns decimal(18, 0) 
as
begin
    return(
        select dimension_rango_etario_id
        from CARPINCHO_LOVERS.dimension_rango_etario
        where (year(getdate()) - year(@fecha_nacimiento)) between edad_desde and edad_hasta
    )
end
go

create function CARPINCHO_LOVERS.buscar_rango_horario_id(@horario decimal(18, 0)) returns decimal(18, 0) as
begin
    return(
        select dimension_rango_horario_id
        from CARPINCHO_LOVERS.dimension_rango_horario
        where @horario >= horario_desde and @horario < horario_hasta
    )
end
go

create function CARPINCHO_LOVERS.buscar_tiempo_id(@anio decimal(4, 0), @mes decimal(2, 0)) returns decimal(18, 0) as
begin
    return(
        select dimension_tiempo_id
        from CARPINCHO_LOVERS.dimension_tiempo
        where @anio = anio and @mes = mes
    )
end
go

create function CARPINCHO_LOVERS.buscar_categoria_id(@categoria nvarchar(100), @tipo nvarchar(50)) returns decimal(18, 0) as
begin
    return(
        select dimension_tipo_local_categoria_id
        from CARPINCHO_LOVERS.dimension_categoria_local
        where @categoria = categoria_nombre and @tipo = tipo_local_descripcion
    )
end
go

create function CARPINCHO_LOVERS.buscar_dia_id(@dia nvarchar(50)) returns decimal(18, 0) as
begin
    return(
        select dimension_dia_semana_id
        from CARPINCHO_LOVERS.dimension_dia_semana
        where @dia = nombre
    )
end
go

create function CARPINCHO_LOVERS.buscar_tipo_movilidad_id(@horario decimal(18, 0)) returns decimal(18, 0) as
begin
    return(
        select dimension_rango_horario_id
        from CARPINCHO_LOVERS.dimension_rango_horario
        where @horario >= horario_desde and @horario < horario_hasta
    )
end
go

-------- Procedures --------
create proc CARPINCHO_LOVERS.migrar_dimension_dia_semana as
begin
    insert CARPINCHO_LOVERS.dimension_dia_semana(dimension_dia_semana_id, nombre)
    (
        select dia_id, dia_nombre from CARPINCHO_LOVERS.dia
    )
end
go

create proc CARPINCHO_LOVERS.migrar_dimension_provincia_localidad as
begin
    insert CARPINCHO_LOVERS.dimension_provincia_localidad(dimension_provincia_localidad_id, nombre_localidad, nombre_provincia)
    (
        select localidad_id, localidad_nombre, provincia_nombre
        from localidad join provincia on localidad_provincia_id = provincia_id
    )
end
go

create proc CARPINCHO_LOVERS.migrar_dimension_local as
begin
    insert CARPINCHO_LOVERS.dimension_local(dimension_local_id, local_nombre)
    (
        select local_id, local_nombre
        from CARPINCHO_LOVERS.local
    )
end
go

create proc CARPINCHO_LOVERS.migrar_dimension_categoria_local as
begin
    insert CARPINCHO_LOVERS.dimension_categoria_local(dimension_tipo_local_categoria_id, categoria_nombre, tipo_local_descripcion)
    (
        select categoria_id, categoria_nombre, tipo_local_descripcion
        from CARPINCHO_LOVERS.categoria join CARPINCHO_LOVERS.tipo_local on categoria_tipo = tipo_local_id
    )
end
go

create proc CARPINCHO_LOVERS.migrar_dimension_tipo_paquete as
begin
    insert CARPINCHO_LOVERS.dimension_tipo_paquete(dimension_tipo_paquete_id, tipo_paquete_descripcion)
    (
        select tipo_paquete_id, tipo_paquete_descripcion from CARPINCHO_LOVERS.tipo_paquete
    )
end
go

create proc CARPINCHO_LOVERS.migrar_dimension_estado_envio_mensajeria as
begin
    insert CARPINCHO_LOVERS.dimension_estado_envio_mensajeria(dimension_estado_envio_mensajeria_id, estado_mensajeria_descripcion)
    (
        select estado_mensajeria_id, estado_mensajeria_descripcion from CARPINCHO_LOVERS.estado_envio_mensajeria
    )
end
go

create proc CARPINCHO_LOVERS.migrar_dimension_estado_pedido as
begin
    insert CARPINCHO_LOVERS.dimension_estado_pedido(dimension_estado_pedido_id, estado_pedido_descripcion)
    (
        select estado_pedido_id, estado_pedido_descripcion from CARPINCHO_LOVERS.estado_pedido
    )
end
go

create proc CARPINCHO_LOVERS.migrar_dimension_estado_reclamo as
begin
    insert CARPINCHO_LOVERS.dimension_estado_reclamo(dimension_estado_reclamo_id, estado_reclamo_descripcion)
    (
        select estado_reclamo_id, estado_reclamo_descripcion from CARPINCHO_LOVERS.estado_reclamo
    )
end
go

create proc CARPINCHO_LOVERS.migrar_dimension_tipo_reclamo as
begin
    insert CARPINCHO_LOVERS.dimension_tipo_reclamo(dimension_tipo_reclamo_id, tipo_reclamo_descripcion)
    (
        select tipo_reclamo_id, tipo_reclamo_descripcion from CARPINCHO_LOVERS.tipo_reclamo
    )
end
go

create proc CARPINCHO_LOVERS.migrar_dimension_tipo_medio_de_pago as
begin
    insert CARPINCHO_LOVERS.dimension_tipo_medio_de_pago(dimension_tipo_medio_de_pago_id, tipo_medio_de_pago_descripcion)
    (
        select tipo_medio_pago_id, tipo_medio_pago_descripcion from CARPINCHO_LOVERS.tipo_medio_de_pago
    )
end
go

create proc CARPINCHO_LOVERS.migrar_dimension_tipo_movilidad as
begin
    insert CARPINCHO_LOVERS.dimension_tipo_movilidad(dimension_tipo_movilidad_id, movilidad_tipo_descripcion)
    (
        select movilidad_tipo_id, movilidad_tipo_descripcion from CARPINCHO_LOVERS.movilidad_tipo
    )
end
go

create proc CARPINCHO_LOVERS.migrar_dimension_tiempo as
begin
    insert CARPINCHO_LOVERS.dimension_tiempo(anio, mes)
		select year(pedido_fecha) as anio, month(pedido_fecha) as mes from CARPINCHO_LOVERS.pedido
        union
        select year(envio_mensajeria_fecha) as anio, month(envio_mensajeria_fecha) as mes from CARPINCHO_LOVERS.envio_mensajeria
        union
        select year(reclamo_fecha) as anio, month(reclamo_fecha) as mes from CARPINCHO_LOVERS.reclamo
		order by anio, mes;
end
go

create proc CARPINCHO_LOVERS.migrar_dimension_rango_etario as
begin
    insert into CARPINCHO_LOVERS.dimension_rango_etario(edad_descripcion, edad_desde, edad_hasta)
    values
        ('Menor a 25', 0, 24),
        ('25 a 34', 25 , 34),
        ('35 a 54', 35, 54),
        ('Mayor que 55', 55, 9999)
end
go

create proc CARPINCHO_LOVERS.migrar_dimension_rango_horario as
begin
    insert into CARPINCHO_LOVERS.dimension_rango_horario(horario_descripcion, horario_desde, horario_hasta)
    values
        ('00 a 02', 0, 2),
        ('02 a 04', 2, 4),
        ('04 a 06', 4, 6),
        ('06 a 08', 6, 8),
        ('08 a 10', 8, 10),
        ('10 a 12', 10, 12),
        ('12 a 14', 12, 14),
        ('14 a 16', 14, 16),
        ('16 a 18', 16, 18),
        ('18 a 20', 18, 20),
        ('20 a 22', 20, 22),
        ('22 a 24', 22, 24)
end
go