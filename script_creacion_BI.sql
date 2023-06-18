use GD1C2023
go

set language 'English';

go
-------- TABLAS DE DIMENSIONES --------

create table CARPINCHO_LOVERS.dimension_dia_semana(
    dimension_dia_semana_id decimal(18, 0) not null identity(1, 1),
    nombre nvarchar(50) not null
)

create table CARPINCHO_LOVERS.dimension_provincia_localidad(
    dimension_provincia_localidad_id decimal(18, 0) not null identity(1, 1),
    dimension_nombre_provincia nvarchar(255) not null,
    dimension_nombre_localidad nvarchar(255) not null
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
    dimension_estado_reclamo_descripcion nvarchar(50) not null
)

create table CARPINCHO_LOVERS.dimension_estado_pedido(
    dimension_estado_pedido_id decimal(18, 0) not null identity(1, 1),
    dimension_estado_pedido_descripcion nvarchar(50) not null
)

create table CARPINCHO_LOVERS.dimension_estado_envio_mensajeria(
    dimension_estado_envio_mensajeria_id decimal(18, 0) not null identity(1, 1),
    dimension_estado_mensajeria_descripcion nvarchar(50) not null
)

create table CARPINCHO_LOVERS.dimension_tipo_reclamo(
    dimension_tipo_reclamo_id decimal(18, 0) not null identity(1, 1),
    dimension_reclamo_tipo_descripcion nvarchar(50) not null
)

create table CARPINCHO_LOVERS.dimension_local(
    dimension_local_id decimal(18, 0) not null identity(1, 1),
    dimension_local_nombre nvarchar(100) not null
)

create table CARPINCHO_LOVERS.dimension_categoria_local(
    dimension_tipo_local_categoria_id decimal(18, 0) not null identity(1, 1),
    dimension_categoria_nombre nvarchar(100) not null,
    dimension_tipo_local_descripcion nvarchar(50) not null
)

create table CARPINCHO_LOVERS.dimension_tipo_movilidad(
    dimension_tipo_movilidad_id decimal(18,0) not null identity(1, 1),
    dimension_movilidad_tipo_descripcion nvarchar(50) not null
)

create table CARPINCHO_LOVERS.dimension_tipo_medio_de_pago(
    dimension_tipo_medio_de_pago_id decimal(18,0) not null identity(1, 1),
    dimension_tipo_medio_de_pago_descripcion nvarchar(50)
)

create table CARPINCHO_LOVERS.dimension_tipo_paquete(
    dimension_tipo_paquete_id decimal(18,0) not null identity(1, 1),
    dimension_tipo_paquete_descripcion nvarchar(255) not null
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

create function CARPINCHO_LOVERS.buscar_dimension_rango_etario_id(@fecha_nacimiento date) returns decimal(18, 0) 
as
begin
    return(
        select dimension_rango_etario_id
        from CARPINCHO_LOVERS.dimension_rango_etario
        where (year(getdate()) - year(@fecha_nacimiento)) between edad_desde and edad_hasta
    )
end
go

create function CARPINCHO_LOVERS.buscar_dimension_rango_horario_id(@horario datetime) returns decimal(18, 0) as
begin
    return(
        select dimension_rango_horario_id
        from CARPINCHO_LOVERS.dimension_rango_horario -- DATEPART
        where @horario >= horario_desde and @horario < horario_hasta
    )
end
go

create function CARPINCHO_LOVERS.buscar_dimension_tiempo_id(@anio decimal(4, 0), @mes decimal(2, 0)) returns decimal(18, 0) as
begin
    return(
        select dimension_tiempo_id
        from CARPINCHO_LOVERS.dimension_tiempo
        where @anio = anio and @mes = mes
    )
end
go

create function CARPINCHO_LOVERS.buscar_dimension_categoria_id(@categoria nvarchar(100), @tipo nvarchar(50)) returns decimal(18, 0) as
begin
    return(
        select dimension_tipo_local_categoria_id
        from CARPINCHO_LOVERS.dimension_categoria_local
        where @categoria = dimension_categoria_nombre and @tipo = dimension_tipo_local_descripcion
    )
end
go

create function CARPINCHO_LOVERS.buscar_dimension_dia_id(@fecha date) returns decimal(18, 0) as
begin
    return(
        select dimension_dia_semana_id
        from CARPINCHO_LOVERS.dimension_dia_semana
        where CARPINCHO_LOVERS.buscar_dimension_dia(@fecha) = nombre
    )
end
go

create function CARPINCHO_LOVERS.buscar_dimension_dia(@fecha date) returns nvarchar(50) as
begin
    return(
        case
                when datename(weekday, @fecha) = 'Monday' then 'Lunes'
                when datename(weekday, @fecha) = 'Tuesday' then 'Martes'
                when datename(weekday, @fecha) = 'Wednesday' then 'Miercoles'
                when datename(weekday, @fecha) = 'Thursday' then 'Jueves'
                when datename(weekday, @fecha) = 'Friday' then 'Viernes'
                when datename(weekday, @fecha) = 'Saturday' then 'Sabado'
                when datename(weekday, @fecha) = 'Sunday' then 'Domingo'
        end                
    )
end
go

create function CARPINCHO_LOVERS.buscar_dimension_tipo_movilidad_id(@repartidor_id decimal(18, 0)) returns decimal(18, 0) as
begin
    return(
        select dimension_tipo_movilidad_id
        from CARPINCHO_LOVERS.movilidad_tipo as t1
        join CARPINCHO_LOVERS.repartidor as t2 on t1.movilidad_tipo_id = t2.repartidor_tipo_movilidad
        join CARPINCHO_LOVERS.dimension_tipo_movilidad as t3 on t3.dimension_movilidad_tipo_descripcion = t1.movilidad_tipo_descripcion
        where t2.repartidor_id = @repartidor_id
    )
end
go

create function CARPINCHO_LOVERS.buscar_dimension_provincia_localidad_id(@localidad decimal(18, 0)) returns decimal(18, 0) as
begin
    return(
        select dimension_provincia_localidad_id
        from CARPINCHO_LOVERS.provincia as t1
        join CARPINCHO_LOVERS.localidad as t2 on t1.provincia_id = t2.localidad_provincia_id
        join CARPINCHO_LOVERS.dimension_provincia_localidad as t3 on t3.dimension_nombre_provincia + t3.dimension_nombre_localidad = t1.provincia_nombre + t2.localidad_nombre
        where t2.localidad_id = @localidad
    )
end
go


create function CARPINCHO_LOVERS.calcular_desvio_de_entrega(@fecha_inicio decimal(18, 0), @fecha_entrega decimal(18,0), @estimacion decimal(18,2)) returns decimal(18,2) as
begin
    DECLARE @resultado decimal(18,2);
    set @resultado = @estimacion - (@fecha_inicio - @fecha_entrega) -- REVISAR LA FORMULA
    return @resultado
end
go


-------- Procedures --------

-- DIMENSIONES --
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
    insert CARPINCHO_LOVERS.dimension_provincia_localidad(dimension_provincia_localidad_id, dimension_nombre_localidad, dimension_nombre_provincia)
    (
        select localidad_id, localidad_nombre, provincia_nombre
        from localidad join provincia on localidad_provincia_id = provincia_id
    )
end
go

create proc CARPINCHO_LOVERS.migrar_dimension_local as
begin
    insert CARPINCHO_LOVERS.dimension_local(dimension_local_id, dimension_local_nombre)
    (
        select local_id, local_nombre
        from CARPINCHO_LOVERS.local
    )
end
go

create proc CARPINCHO_LOVERS.migrar_dimension_categoria_local as
begin
    insert CARPINCHO_LOVERS.dimension_categoria_local(dimension_tipo_local_categoria_id, dimension_categoria_nombre, dimension_tipo_local_descripcion)
    (
        select categoria_id, categoria_nombre, tipo_local_descripcion
        from CARPINCHO_LOVERS.categoria join CARPINCHO_LOVERS.tipo_local on categoria_tipo = tipo_local_id
    )
end
go

create proc CARPINCHO_LOVERS.migrar_dimension_tipo_paquete as
begin
    insert CARPINCHO_LOVERS.dimension_tipo_paquete(dimension_tipo_paquete_id, dimension_tipo_paquete_descripcion)
    (
        select tipo_paquete_id, tipo_paquete_descripcion from CARPINCHO_LOVERS.tipo_paquete
    )
end
go

create proc CARPINCHO_LOVERS.migrar_dimension_estado_envio_mensajeria as
begin
    insert CARPINCHO_LOVERS.dimension_estado_envio_mensajeria(dimension_estado_envio_mensajeria_id, dimension_estado_mensajeria_descripcion)
    (
        select estado_mensajeria_id, estado_mensajeria_descripcion from CARPINCHO_LOVERS.estado_envio_mensajeria
    )
end
go

create proc CARPINCHO_LOVERS.migrar_dimension_estado_pedido as
begin
    insert CARPINCHO_LOVERS.dimension_estado_pedido(dimension_estado_pedido_id, dimension_estado_pedido_descripcion)
    (
        select estado_pedido_id, estado_pedido_descripcion from CARPINCHO_LOVERS.estado_pedido
    )
end
go

create proc CARPINCHO_LOVERS.migrar_dimension_estado_reclamo as
begin
    insert CARPINCHO_LOVERS.dimension_estado_reclamo(dimension_estado_reclamo_id, dimension_estado_reclamo_descripcion)
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
    insert CARPINCHO_LOVERS.dimension_tipo_medio_de_pago(dimension_tipo_medio_de_pago_id, dimension_tipo_medio_de_pago_descripcion)
    (
        select tipo_medio_pago_id, tipo_medio_pago_descripcion from CARPINCHO_LOVERS.tipo_medio_de_pago
    )
end
go

create proc CARPINCHO_LOVERS.migrar_dimension_tipo_movilidad as
begin
    insert CARPINCHO_LOVERS.dimension_tipo_movilidad(dimension_tipo_movilidad_id, dimension_movilidad_tipo_descripcion)
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

-- HECHOS --
create proc CARPINCHO_LOVERS.migrar_hechos_mensajeria as
begin
    insert CARPINCHO_LOVERS.hechos_mensajeria(dimension_dia_semana_id, dimension_tiempo_id, dimension_estado_envio_mensajeria_id, 
    dimension_tipo_movilidad_id, dimension_provincia_localidad_id, dimension_tipo_medio_de_pago_id, dimension_tipo_paquete_id, 
    dimension_rango_horario_id, dimension_rango_etario_id, promedio_valor_asegurado, desvio_promedio_tiempo_entrega)

        select 
            CARPINCHO_LOVERS.buscar_dimension_dia_id(envio_mensajeria_fecha),
            
            CARPINCHO_LOVERS.buscar_dimension_tiempo_id(year(envio_mensajeria_fecha), month(envio_mensajeria_fecha)),

            (select dimension_estado_envio_mensajeria from CARPINCHO_LOVERS.dimension_estado_envio_mensajeria 
                where estado_mensajeria_descripcion = dimension_estado_mensajeria_descripcion),
            
            CARPINCHO_LOVERS.buscar_dimension_tipo_movilidad_id(envio_mensajeria_repartidor_id),

            CARPINCHO_LOVERS.buscar_dimension_provincia_localidad_id(envio_mensajeria_localidad_origen),
            
            (select dimension_tipo_medio_de_pago_id from CARPINCHO_LOVERS.dimension_tipo_medio_de_pago
                where dimension_tipo_medio_de_pago_descripcion = tipo_medio_pago_descripcion),

            (select dimension_tipo_paquete_id from dimension_tipo_paquete
                where dimension_tipo_paquete_descripcion = tipo_paquete_descripcion),

            CARPINCHO_LOVERS.buscar_dimension_rango_horario_id(envio_mensajeria_fecha),

            CARPINCHO_LOVERS.buscar_dimension_rango_etario_id(usuario_fecha_nac),
            
            sum(envio_mensajeria_valor_asegurado)/count(*),

            avg(CARPINCHO_LOVERS.calcular_desvio_de_entrega(envio_mensajeria, envio_mensajeria_fecha_entrega, envio_mensajeria_tiempo_estimado))

            count(*)

        from CARPINCHO_LOVERS.envio_mensajeria 
            join CARPINCHO_LOVERS.tipo_medio_de_pago on envio_mensajeria_medio_pago_id = tipo_medio_pago_id
            join CARPINCHO_LOVERS.estado_envio_mensajeria on envio_mensajeria_estado = estado_mensajeria_id
            join CARPINCHO_LOVERS.usuario on envio_mensajeria_usuario_id = usuario_id

        group by 
        CARPINCHO_LOVERS.buscar_dimension_dia_id(envio_mensajeria_fecha),
        CARPINCHO_LOVERS.buscar_dimension_tiempo_id(year(envio_mensajeria_fecha), month(envio_mensajeria_fecha)),
        estado_mensajeria_descripcion,
        envio_mensajeria_repartidor_id,
        envio_mensajeria_localidad_origen,
        tipo_medio_pago_descripcion,
        tipo_paquete_descripcion,
        CARPINCHO_LOVERS.buscar_dimension_rango_horario_id(envio_mensajeria_fecha),
        CARPINCHO_LOVERS.buscar_dimension_rango_etario_id(usuario_fecha_nac)

end
go


/*create proc CARPINCHO_LOVERS.migrar_hechos_pedidos as
begin
    insert CARPINCHO_LOVERS.hechos_pedidos(dimension_dia_semana_id, dimension_rango_horario_id, dimension_provincia_localidad_id,
    dimension_tipo_local_categoria_id, dimension_tiempo_id, dimension_tipo_movilidad_id, dimension_local_id, dimension_estado_pedido_id, 
    dimension_rango_etario_usuario, dimension_rango_etario_repartidor, desvio_promedio_tiempo_entrega, promedio_calificacion, cantidad_pedidos,
    monto_total_pedidos, monto_promedio_envios, monto_total_cupones)

        select 
            
        from CARPINCHO_LOVERS.pedidos
end
go*/

create proc CARPINCHO_LOVERS.migrar_hechos_reclamo as
begin
    insert CARPINCHO_LOVERS.hechos_reclamos(dimension_dia_semana_id, dimension_tiempo_id, dimension_local_id, dimension_estado_reclamo_id, 
    dimension_rango_horario_id, dimension_rango_etario_id, dimension_tipo_reclamo_id, cantidad_reclamos, tiempo_promedio_resolucion,
    monto_cupones)

        select 
            CARPINCHO_LOVERS.buscar_dimension_dia_id(reclamo_fecha),

            CARPINCHO_LOVERS.buscar_dimension_tiempo_id(year(reclamo_fecha), month(reclamo_fecha)),

            (select dimension_local_id
             from CARPINCHO_LOVERS.dimension_local
             where dimension_local_id in (select pedido_local_id
								          from CARPINCHO_LOVERS.pedido JOIN CARPINCHO_LOVERS.local on local_id = pedido_local_id
								          group by pedido_local_id)),

            (select dimension_estado_reclamo_id
             from CARPINCHO_LOVERS.dimension_estado_reclamo
             where estado_reclamo_descripcion = dimension_estado_reclamo_descripcion),

            CARPINCHO_LOVERS.buscar_dimension_rango_horario_id(reclamo_fecha),

            CARPINCHO_LOVERS.buscar_dimension_rango_etario_id(operador_reclamo_fecha_nac),

            (select dimension_tipo_reclamo_id
             from CARPINCHO_LOVERS.dimension_tipo_reclamo
             where dimension_reclamo_tipo_descripcion = reclamo_tipo_descripcion),

            count(reclamo_nro),

			avg(DATEDIFF(minute, reclamo_fecha, reclamo_fecha_solucion)), --tiempo promedio resolucion (en minutos fecha incio reclamo - fecha resolucion)
            
			(select sum(cupon_monto)
			 from CARPINCHO_LOVERS.cupon_reclamo join CARPINCHO_LOVERS.cupon on cupon_nro = cupon_reclamo_nro
			 where cupon_reclamo_reclamo_nro = reclamo_nro) -- monto_cupones (monto generado en cupones a partir de reclamos)
            
        from CARPINCHO_LOVERS.reclamo 
            join estado_reclamo on reclamo_estado = estado_reclamo_id
            join operador_reclamo on operador_reclamo_id = reclamo_operador_id
            join reclamo_tipo on reclamo_tipo_id = reclamo_tipo
		group by 
		CARPINCHO_LOVERS.buscar_dimension_dia_id(reclamo_fecha),
		CARPINCHO_LOVERS.buscar_dimension_tiempo_id(year(reclamo_fecha), month(reclamo_fecha)), 
		estado_reclamo_descripcion,
		CARPINCHO_LOVERS.buscar_dimension_rango_horario_id(reclamo_fecha),
		CARPINCHO_LOVERS.buscar_dimension_rango_etario_id(operador_reclamo_fecha_nac),
		reclamo_tipo_descripcion,
		reclamo_nro
end
--GO
-------- Views --------

/* Día de la semana y franja horaria con mayor cantidad de pedidos según la
localidad y categoría del local, para cada mes de cada año. */


/* Monto total no cobrado por cada local en función de los pedidos cancelados según el día de la semana y 
la franja horaria (cuentan como pedidos cancelados tanto los que cancela el usuario como el local) */


/*  Valor promedio mensual que tienen los envíos de pedidos en cada localidad. */


/* Desvío promedio en tiempo de entrega según el tipo de movilidad, el día de la semana y la franja horaria.
El desvío debe calcularse en minutos y representa la diferencia entre la fecha/hora en que se realizó el pedido y 
la fecha/hora que se entregó en comparación con los minutos de tiempo estimados.
Este indicador debe tener en cuenta todos los envíos, es decir, sumar tanto los envíos de pedidos como los de mensajería. */


/* Monto total de los cupones utilizados por mes en función del rango etario de los usuarios. */


/* Promedio de calificación mensual por local. */


/* Porcentaje de pedidos y mensajería entregados mensualmente según el rango etario de los repartidores y la localidad.
Este indicador se debe tener en cuenta y sumar tanto los envíos de pedidos como los de mensajería.
El porcentaje se calcula en función del total general de pedidos y envíos mensuales entregados. */


/* Promedio mensual del valor asegurado (valor declarado por el usuario) de los paquetes enviados 
a través del servicio de mensajería en función del tipo de paquete */


/* Cantidad de reclamos mensuales recibidos por cada local en función del día de la semana y rango horario. */


/*  Tiempo promedio de resolución de reclamos mensual según cada tipo de reclamo y rango etario de los operadores.
El tiempo de resolución debe calcularse en minutos y representa la diferencia entre la fecha/hora en que se
realizó el reclamo y la fecha/hora que se resolvió. */


/* Monto mensual generado en cupones a partir de reclamos. */
