    use GD1C2023
    go

    set language 'English';

    go
    -------- TABLAS DE DIMENSIONES --------

    create table CARPINCHO_LOVERS.dimension_dia_semana(
        dimension_dia_semana_id decimal(18, 0) not null identity(1, 1),
        dia_nombre nvarchar(50) not null unique
    )

    create table CARPINCHO_LOVERS.dimension_provincia_localidad(
        dimension_provincia_localidad_id decimal(18, 0) not null identity(1, 1),
        dimension_localidad_provincia_nombre nvarchar(255) not null,
        dimension_localidad_localidad_nombre nvarchar(255) not null
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
        dimension_local_id decimal(18, 0) not null unique,
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
        dimension_rango_etario_usuario_id decimal(18,0) not null,
        dimension_rango_etario_repartidor_id decimal(18,0) not null,
        valor_asegurado_total decimal(18,2) not null,
        desvio_tiempo_entrega_total decimal(18,2) not null,
        cantidad_envios decimal(18,2) not null
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
        tiempo_resolucion_total decimal(18, 2) not null,
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
        dimension_rango_etario_usuario_id decimal(18, 0) not null,
        dimension_rango_etario_repartidor_id decimal(18, 0) not null,
        desvio_tiempo_entrega_total decimal(18, 2) not null,
        calificacion_total decimal(18, 2) not null,
        cantidad_pedidos decimal(18, 0) not null,
        monto_pedidos_total decimal(18, 2) not null,
        monto_envios_total decimal(18, 2) not null,
        monto_cupones_total decimal(18, 2) not null
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
                    dimension_tipo_movilidad_id, dimension_provincia_localidad_id, dimension_tipo_medio_de_pago_id, dimension_tipo_paquete_id, dimension_rango_horario_id, dimension_rango_etario_usuario_id,
                    dimension_rango_etario_repartidor_id)

    alter table CARPINCHO_LOVERS.hechos_pedidos add constraint pk_hechos_pedidos primary key (dimension_dia_semana_id, dimension_rango_horario_id, dimension_provincia_localidad_id, 
                    dimension_tipo_local_categoria_id, dimension_tiempo_id, dimension_tipo_movilidad_id, dimension_local_id, dimension_estado_pedido_id, dimension_rango_etario_usuario_id,
                    dimension_rango_etario_repartidor_id)

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
    alter table CARPINCHO_LOVERS.hechos_mensajeria add constraint fk_hecho_mensajeria_dimension_rango_etario_usuario foreign key (dimension_rango_etario_usuario_id)
            references CARPINCHO_LOVERS.dimension_rango_etario (dimension_rango_etario_id)
    alter table CARPINCHO_LOVERS.hechos_mensajeria add constraint fk_hecho_mensajeria_dimension_rango_etario_repartidor foreign key (dimension_rango_etario_repartidor_id)
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
    alter table CARPINCHO_LOVERS.hechos_pedidos add constraint fk_hecho_pedido_dimension_rango_etario_usuario foreign key (dimension_rango_etario_usuario_id)
            references CARPINCHO_LOVERS.dimension_rango_etario (dimension_rango_etario_id)
    alter table CARPINCHO_LOVERS.hechos_pedidos add constraint fk_hecho_pedido_dimension_rango_etario_repartidor foreign key (dimension_rango_etario_repartidor_id)
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
            from CARPINCHO_LOVERS.dimension_rango_horario
            where datepart(hour, @horario) >= horario_desde and datepart(hour, @horario) < horario_hasta
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
            where CARPINCHO_LOVERS.buscar_dimension_dia(@fecha) = dia_nombre
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
            join CARPINCHO_LOVERS.dimension_provincia_localidad as t3 on t3.dimension_localidad_provincia_nombre + t3.dimension_localidad_localidad_nombre = t1.provincia_nombre + t2.localidad_nombre
            where t2.localidad_id = @localidad
        )
    end
    go


    create function CARPINCHO_LOVERS.calcular_desvio_de_entrega(@fecha_inicio datetime, @fecha_entrega datetime, @estimacion decimal(18,2)) returns decimal(18,2) as
    begin
        DECLARE @resultado decimal(18,2);
        set @resultado = @estimacion - (DATEDIFF(minute, @fecha_inicio, @fecha_entrega)) -- REVISAR LA FORMULA 
        return @resultado
    end
    go


    -------- Procedures --------

    -- DIMENSIONES --
    create proc CARPINCHO_LOVERS.migrar_dimension_dia_semana as
    begin
        insert CARPINCHO_LOVERS.dimension_dia_semana(dia_nombre)
        (
            select dia_nombre from CARPINCHO_LOVERS.dia
        )
    end
    go

    create proc CARPINCHO_LOVERS.migrar_dimension_provincia_localidad as
    begin
        insert CARPINCHO_LOVERS.dimension_provincia_localidad(dimension_localidad_localidad_nombre, dimension_localidad_provincia_nombre)
        (
            select localidad_nombre, provincia_nombre
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
        insert CARPINCHO_LOVERS.dimension_categoria_local(dimension_categoria_nombre, dimension_tipo_local_descripcion)
        (
            select categoria_nombre, tipo_local_descripcion
            from CARPINCHO_LOVERS.categoria join CARPINCHO_LOVERS.tipo_local on categoria_tipo = tipo_local_id
        )
    end
    go

    create proc CARPINCHO_LOVERS.migrar_dimension_tipo_paquete as
    begin
        insert CARPINCHO_LOVERS.dimension_tipo_paquete(dimension_tipo_paquete_descripcion)
        (
            select tipo_paquete_descripcion from CARPINCHO_LOVERS.tipo_paquete
        )
    end
    go

    create proc CARPINCHO_LOVERS.migrar_dimension_estado_envio_mensajeria as
    begin
        insert CARPINCHO_LOVERS.dimension_estado_envio_mensajeria(dimension_estado_mensajeria_descripcion)
        (
            select estado_mensajeria_descripcion from CARPINCHO_LOVERS.estado_envio_mensajeria
        )
    end
    go

    create proc CARPINCHO_LOVERS.migrar_dimension_estado_pedido as
    begin
        insert CARPINCHO_LOVERS.dimension_estado_pedido(dimension_estado_pedido_descripcion)
        (
            select estado_pedido_descripcion from CARPINCHO_LOVERS.estado_pedido
        )
    end
    go

    create proc CARPINCHO_LOVERS.migrar_dimension_estado_reclamo as
    begin
        insert CARPINCHO_LOVERS.dimension_estado_reclamo(dimension_estado_reclamo_descripcion)
        (
            select estado_reclamo_descripcion from CARPINCHO_LOVERS.estado_reclamo
        )
    end
    go

    create proc CARPINCHO_LOVERS.migrar_dimension_tipo_reclamo as
    begin
        insert CARPINCHO_LOVERS.dimension_tipo_reclamo(dimension_reclamo_tipo_descripcion)
        (
            select reclamo_tipo_descripcion from CARPINCHO_LOVERS.reclamo_tipo
        )
    end
    go

    create proc CARPINCHO_LOVERS.migrar_dimension_tipo_medio_de_pago as
    begin
        insert CARPINCHO_LOVERS.dimension_tipo_medio_de_pago(dimension_tipo_medio_de_pago_descripcion)
        (
            select tipo_medio_pago_descripcion from CARPINCHO_LOVERS.tipo_medio_de_pago
        )
    end
    go

    create proc CARPINCHO_LOVERS.migrar_dimension_tipo_movilidad as
    begin
        insert CARPINCHO_LOVERS.dimension_tipo_movilidad(dimension_movilidad_tipo_descripcion)
        (
            select movilidad_tipo_descripcion from CARPINCHO_LOVERS.movilidad_tipo
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
            ('Mayor que 55', 55, 999)
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
        dimension_rango_horario_id, dimension_rango_etario_usuario_id, dimension_rango_etario_repartidor_id, valor_asegurado_total,
        desvio_tiempo_entrega_total, cantidad_envios)

                select 
                CARPINCHO_LOVERS.buscar_dimension_dia_id(envio_mensajeria_fecha),
                
                CARPINCHO_LOVERS.buscar_dimension_tiempo_id(year(envio_mensajeria_fecha), month(envio_mensajeria_fecha)),

                (select dimension_estado_envio_mensajeria_id from CARPINCHO_LOVERS.dimension_estado_envio_mensajeria 
                    where estado_mensajeria_descripcion = dimension_estado_mensajeria_descripcion),
                
                CARPINCHO_LOVERS.buscar_dimension_tipo_movilidad_id(envio_mensajeria_repartidor_id),

                CARPINCHO_LOVERS.buscar_dimension_provincia_localidad_id(envio_mensajeria_localidad_origen),
                
                (select dimension_tipo_medio_de_pago_id from CARPINCHO_LOVERS.dimension_tipo_medio_de_pago
                    where dimension_tipo_medio_de_pago_descripcion = tipo_medio_pago_descripcion),

                (select dimension_tipo_paquete_id from CARPINCHO_LOVERS.dimension_tipo_paquete
                    where dimension_tipo_paquete_descripcion = tipo_paquete_descripcion),

                CARPINCHO_LOVERS.buscar_dimension_rango_horario_id(envio_mensajeria_fecha),

                CARPINCHO_LOVERS.buscar_dimension_rango_etario_id(usuario_fecha_nac),

                CARPINCHO_LOVERS.buscar_dimension_rango_etario_id(repartidor_fecha_nac),
                
                sum(envio_mensajeria_valor_asegurado),

                sum(CARPINCHO_LOVERS.calcular_desvio_de_entrega(envio_mensajeria_fecha, envio_mensajeria_fecha_entrega, envio_mensajeria_tiempo_estimado)),

                count(*)

            from CARPINCHO_LOVERS.envio_mensajeria 
                join CARPINCHO_LOVERS.estado_envio_mensajeria on envio_mensajeria_estado = estado_mensajeria_id
				join CARPINCHO_LOVERS.tipo_medio_de_pago on envio_mensajeria_tipo_medio_pago_id = tipo_medio_pago_id
				join CARPINCHO_LOVERS.paquete on envio_mensajeria_nro = paquete_envio_mensajeria_nro
				join CARPINCHO_LOVERS.tipo_paquete on paquete_tipo_paquete = tipo_paquete_id
				join CARPINCHO_LOVERS.usuario on envio_mensajeria_usuario_id = usuario_id
                join CARPINCHO_LOVERS.repartidor on repartidor_id = envio_mensajeria_repartidor_id

            group by 
            CARPINCHO_LOVERS.buscar_dimension_dia_id(envio_mensajeria_fecha),
            CARPINCHO_LOVERS.buscar_dimension_tiempo_id(year(envio_mensajeria_fecha), month(envio_mensajeria_fecha)),
            estado_mensajeria_descripcion,
            CARPINCHO_LOVERS.buscar_dimension_tipo_movilidad_id(envio_mensajeria_repartidor_id),
            CARPINCHO_LOVERS.buscar_dimension_provincia_localidad_id(envio_mensajeria_localidad_origen),
            tipo_medio_pago_descripcion,
            tipo_paquete_descripcion,
            CARPINCHO_LOVERS.buscar_dimension_rango_horario_id(envio_mensajeria_fecha),
            CARPINCHO_LOVERS.buscar_dimension_rango_etario_id(usuario_fecha_nac),
            CARPINCHO_LOVERS.buscar_dimension_rango_etario_id(repartidor_fecha_nac)
    end
    go


    create proc CARPINCHO_LOVERS.migrar_hechos_pedidos as
    begin
        insert CARPINCHO_LOVERS.hechos_pedidos(dimension_dia_semana_id, dimension_rango_horario_id, dimension_provincia_localidad_id,
        dimension_tipo_local_categoria_id, dimension_tiempo_id, dimension_tipo_movilidad_id, dimension_local_id, dimension_estado_pedido_id, 
        dimension_rango_etario_usuario_id, dimension_rango_etario_repartidor_id, desvio_tiempo_entrega_total, calificacion_total, cantidad_pedidos,
        monto_pedidos_total, monto_envios_total, monto_cupones_total)

            select 
                CARPINCHO_LOVERS.buscar_dimension_dia_id(pedido_fecha),
                CARPINCHO_LOVERS.buscar_dimension_rango_horario_id(pedido_fecha),
                CARPINCHO_LOVERS.buscar_dimension_provincia_localidad_id(local_localidad),
                (select dimension_tipo_local_categoria_id from CARPINCHO_LOVERS.dimension_categoria_local 
                    where categoria_nombre = dimension_categoria_nombre),
                CARPINCHO_LOVERS.buscar_dimension_tiempo_id(year(pedido_fecha), month(pedido_fecha)),
                CARPINCHO_LOVERS.buscar_dimension_tipo_movilidad_id(envio_pedido_repartidor_id),
                (select dimension_local_id from CARPINCHO_LOVERS.dimension_local
                    where dimension_local_id = local_id),
                (select dimension_estado_pedido_id from CARPINCHO_LOVERS.dimension_estado_pedido
                    where estado_pedido_descripcion = dimension_estado_pedido_descripcion),
                CARPINCHO_LOVERS.buscar_dimension_rango_etario_id(usuario_fecha_nac),
                CARPINCHO_LOVERS.buscar_dimension_rango_etario_id(repartidor_fecha_nac),
                sum(CARPINCHO_LOVERS.calcular_desvio_de_entrega(pedido_fecha, pedido_fecha_entrega, pedido_tiempo_estimado_entrega)),
                sum(pedido_calificacion),
                count(*),
                sum(pedido_total_servicio),
                sum(pedido_precio_envio),
                sum(pedido_total_cupones)

            from CARPINCHO_LOVERS.pedido
                join CARPINCHO_LOVERS.local on pedido_local_id = local_id
                join CARPINCHO_LOVERS.categoria on local_categoria = categoria_id
                join CARPINCHO_LOVERS.envio_pedido on envio_pedido_nro = pedido_nro
                join CARPINCHO_LOVERS.estado_pedido on estado_pedido_id = pedido_estado
                join CARPINCHO_LOVERS.usuario on pedido_usuario_id = usuario_id
                join CARPINCHO_LOVERS.repartidor on repartidor_id = envio_pedido_repartidor_id
			group by 
                CARPINCHO_LOVERS.buscar_dimension_dia_id(pedido_fecha),
                CARPINCHO_LOVERS.buscar_dimension_rango_horario_id(pedido_fecha),
                categoria_nombre,
                CARPINCHO_LOVERS.buscar_dimension_provincia_localidad_id(local_localidad),
                CARPINCHO_LOVERS.buscar_dimension_tiempo_id(year(pedido_fecha), month(pedido_fecha)),
                local_id,
                estado_pedido_descripcion,
                CARPINCHO_LOVERS.buscar_dimension_tipo_movilidad_id(envio_pedido_repartidor_id),
                CARPINCHO_LOVERS.buscar_dimension_rango_etario_id(usuario_fecha_nac),
                CARPINCHO_LOVERS.buscar_dimension_rango_etario_id(repartidor_fecha_nac)
    end
    go

    create proc CARPINCHO_LOVERS.migrar_hechos_reclamo as
    begin
        insert CARPINCHO_LOVERS.hechos_reclamos(dimension_dia_semana_id, dimension_tiempo_id, dimension_local_id, dimension_estado_reclamo_id, 
        dimension_rango_horario_id, dimension_rango_etario_id, dimension_tipo_reclamo_id, cantidad_reclamos, tiempo_resolucion_total,
        monto_cupones)

            select 
                CARPINCHO_LOVERS.buscar_dimension_dia_id(reclamo_fecha),

                CARPINCHO_LOVERS.buscar_dimension_tiempo_id(year(reclamo_fecha), month(reclamo_fecha)),

                (select dimension_local_id
                 from CARPINCHO_LOVERS.dimension_local
                 where dimension_local_id = local_id),

                (select dimension_estado_reclamo_id
                 from CARPINCHO_LOVERS.dimension_estado_reclamo
                 where estado_reclamo_descripcion = dimension_estado_reclamo_descripcion),

                CARPINCHO_LOVERS.buscar_dimension_rango_horario_id(reclamo_fecha),

                CARPINCHO_LOVERS.buscar_dimension_rango_etario_id(operador_reclamo_fecha_nac),

                (select dimension_tipo_reclamo_id
                 from CARPINCHO_LOVERS.dimension_tipo_reclamo
                 where dimension_reclamo_tipo_descripcion = reclamo_tipo_descripcion),

                count(*),

                sum(DATEDIFF(minute, reclamo_fecha, reclamo_fecha_solucion)), --tiempo promedio resolucion (en minutos fecha incio reclamo - fecha resolucion)
                
                sum(cupon_monto)

            from CARPINCHO_LOVERS.reclamo 
                join CARPINCHO_LOVERS.estado_reclamo on reclamo_estado = estado_reclamo_id
                join CARPINCHO_LOVERS.operador_reclamo on operador_reclamo_id = reclamo_operador_id
                join CARPINCHO_LOVERS.reclamo_tipo on reclamo_tipo_id = reclamo_tipo
                join CARPINCHO_LOVERS.pedido on pedido_nro = reclamo_pedido_nro
                join CARPINCHO_LOVERS.local on local_id = pedido_local_id
                join CARPINCHO_LOVERS.cupon_reclamo on cupon_reclamo_reclamo_nro = reclamo_nro
                join CARPINCHO_LOVERS.cupon on cupon_nro = cupon_reclamo_nro


            group by 
            CARPINCHO_LOVERS.buscar_dimension_dia_id(reclamo_fecha),
            CARPINCHO_LOVERS.buscar_dimension_tiempo_id(year(reclamo_fecha), month(reclamo_fecha)), 
            estado_reclamo_descripcion,
            CARPINCHO_LOVERS.buscar_dimension_rango_horario_id(reclamo_fecha),
            CARPINCHO_LOVERS.buscar_dimension_rango_etario_id(operador_reclamo_fecha_nac),
            reclamo_tipo_descripcion,
            local_id
    end
    GO

    --EXECS

    exec CARPINCHO_LOVERS.migrar_dimension_categoria_local
    exec CARPINCHO_LOVERS.migrar_dimension_dia_semana
    exec CARPINCHO_LOVERS.migrar_dimension_estado_envio_mensajeria
    exec CARPINCHO_LOVERS.migrar_dimension_estado_pedido
    exec CARPINCHO_LOVERS.migrar_dimension_estado_reclamo
    exec CARPINCHO_LOVERS.migrar_dimension_local
    exec CARPINCHO_LOVERS.migrar_dimension_provincia_localidad
    exec CARPINCHO_LOVERS.migrar_dimension_rango_etario
    exec CARPINCHO_LOVERS.migrar_dimension_rango_horario
    exec CARPINCHO_LOVERS.migrar_dimension_tiempo
    exec CARPINCHO_LOVERS.migrar_dimension_tipo_medio_de_pago
    exec CARPINCHO_LOVERS.migrar_dimension_tipo_movilidad
    exec CARPINCHO_LOVERS.migrar_dimension_tipo_paquete
    exec CARPINCHO_LOVERS.migrar_dimension_tipo_reclamo
    exec CARPINCHO_LOVERS.migrar_hechos_mensajeria
    exec CARPINCHO_LOVERS.migrar_hechos_pedidos
    exec CARPINCHO_LOVERS.migrar_hechos_reclamo
    go

    ------- Views --------

    /* Día de la semana y franja horaria con mayor cantidad de pedidos según la
    localidad y categoría del local, para cada mes de cada año. */
    create view CARPINCHO_LOVERS.mayor_cant_pedidos (dia, mes, anio, franja_horaria, localidad, provincia, categoria_local, cantidad_pedidos) as
    select dia_nombre, mes, anio, horario_descripcion, dimension_localidad_localidad_nombre,
        dimension_localidad_provincia_nombre, dimension_categoria_nombre, sum(cantidad_pedidos)
    from CARPINCHO_LOVERS.hechos_pedidos as t1
        join CARPINCHO_LOVERS.dimension_dia_semana as t2 on t1.dimension_dia_semana_id = t2.dimension_dia_semana_id
        join CARPINCHO_LOVERS.dimension_tiempo as t3 on t1.dimension_tiempo_id = t3.dimension_tiempo_id
        join CARPINCHO_LOVERS.dimension_rango_horario as t4 on t1.dimension_rango_horario_id = t4.dimension_rango_horario_id
        join CARPINCHO_LOVERS.dimension_provincia_localidad as t5 on t1.dimension_provincia_localidad_id = t5.dimension_provincia_localidad_id
        join CARPINCHO_LOVERS.dimension_categoria_local as t6 on t1.dimension_tipo_local_categoria_id = t6.dimension_tipo_local_categoria_id
    group by dia_nombre, mes, anio, horario_descripcion, dimension_localidad_localidad_nombre,
        dimension_localidad_provincia_nombre, dimension_categoria_nombre

    go
    
    /* Monto total no cobrado por cada local en función de los pedidos cancelados según el día de la semana y 
    la franja horaria (cuentan como pedidos cancelados tanto los que cancela el usuario como el local) */
    create view CARPINCHO_LOVERS.monto_total_no_cobrado(dia, franja_horaria, local, monto) as
    select dia_nombre, horario_descripcion, dimension_local_nombre, sum(monto_pedidos_total) -- Queremos tomar solo los cancelados y hacer un sum de esos
    from CARPINCHO_LOVERS.hechos_pedidos as t1
        join CARPINCHO_LOVERS.dimension_dia_semana as t2 on t1.dimension_dia_semana_id = t2.dimension_dia_semana_id
        join CARPINCHO_LOVERS.dimension_rango_horario as t3 on t1.dimension_rango_horario_id = t3.dimension_rango_horario_id
        join CARPINCHO_LOVERS.dimension_local as t4 on t1.dimension_local_id = t4.dimension_local_id
        join CARPINCHO_LOVERS.dimension_estado_pedido as t5 on t1.dimension_estado_pedido_id = t5.dimension_estado_pedido_id
    where t5.dimension_estado_pedido_descripcion = 'Estado Pedido Cancelado'
    group by dia_nombre, horario_descripcion, dimension_local_nombre
    
    GO
    
    /*  Valor promedio mensual que tienen los envíos de pedidos en cada localidad. */
   
    create view CARPINCHO_LOVERS.promedio_mensual_envios_pedidos(anio, mes, localidad, monto_promedio) as
    select anio, mes, dimension_localidad_localidad_nombre, sum(monto_envios_total)/sum(cantidad_pedidos)
    from CARPINCHO_LOVERS.hechos_pedidos as t1
        join CARPINCHO_LOVERS.dimension_tiempo as t2 on t1.dimension_tiempo_id = t2.dimension_tiempo_id
        join CARPINCHO_LOVERS.dimension_provincia_localidad as t3 on t1.dimension_provincia_localidad_id = t3.dimension_provincia_localidad_id
    group by anio, mes, dimension_localidad_localidad_nombre
    go

    /* Desvío promedio en tiempo de entrega según el tipo de movilidad, el día de la semana y la franja horaria.           <------------   hecho solo para pedidos TODO
    El desvío debe calcularse en minutos y representa la diferencia entre la fecha/hora en que se realizó el pedido y 
    la fecha/hora que se entregó en comparación con los minutos de tiempo estimados.
    Este indicador debe tener en cuenta todos los envíos, es decir, sumar tanto los envíos de pedidos como los de mensajería. */
    
    create view CARPINCHO_LOVERS.desvio_promedio_tiempo_entrega(dia, franja_horaria, tipo_movilidad, desvio_promedio_tiempo_entrega) as
    select dia_nombre, horario_descripcion, dimension_movilidad_tipo_descripcion, 
        sum(isnull(t1.desvio_tiempo_entrega_total, 0) + isnull(t2.desvio_tiempo_entrega_total, 0))/sum(isnull(cantidad_pedidos,0) + isnull(cantidad_envios, 0))
    from CARPINCHO_LOVERS.hechos_pedidos as t1 
        join CARPINCHO_LOVERS.hechos_mensajeria as t2 on  (t2.dimension_dia_semana_id = t1.dimension_dia_semana_id and
                                                           t2.dimension_rango_horario_id = t1.dimension_rango_horario_id and
                                                           t2.dimension_tipo_movilidad_id = t1.dimension_tipo_movilidad_id)
        join CARPINCHO_LOVERS.dimension_dia_semana as t3 on t1.dimension_dia_semana_id = t3.dimension_dia_semana_id
        join CARPINCHO_LOVERS.dimension_tipo_movilidad as t4 on t1.dimension_tipo_movilidad_id = t4.dimension_tipo_movilidad_id
        join CARPINCHO_LOVERS.dimension_rango_horario as t5 on t1.dimension_rango_horario_id = t5.dimension_rango_horario_id

    group by dia_nombre, horario_descripcion, dimension_movilidad_tipo_descripcion

    go


    /* Monto total de los cupones utilizados por mes en función del rango etario de los usuarios. */

    create view CARPINCHO_LOVERS.monto_total_cupones(anio, mes, rango_etario_usuario, monto) as
    select anio, mes, edad_descripcion, sum(monto_cupones_total)
    from CARPINCHO_LOVERS.hechos_pedidos as t1
        join CARPINCHO_LOVERS.dimension_tiempo as t2 on t1.dimension_tiempo_id = t2.dimension_tiempo_id
        join CARPINCHO_LOVERS.dimension_rango_etario as t3 on t1.dimension_rango_etario_usuario_id = t3.dimension_rango_etario_id
    group by anio, mes, edad_descripcion
    
    go
    
    /* Promedio de calificación mensual por local. */

    create view CARPINCHO_LOVERS.promedio_calificacion_mensual(anio, mes, local, calificacion_promedio) as
    select anio, mes, dimension_local_nombre, sum(calificacion_total)/sum(cantidad_pedidos)
    from CARPINCHO_LOVERS.hechos_pedidos as t1
        join CARPINCHO_LOVERS.dimension_tiempo as t2 on t1.dimension_tiempo_id = t2.dimension_tiempo_id
        join CARPINCHO_LOVERS.dimension_local as t3 on t1.dimension_local_id = t3.dimension_local_id
    group by anio, mes, dimension_local_nombre
    
    go

    /* Porcentaje de pedidos y mensajería entregados mensualmente según el rango etario de los repartidores y la localidad.     <------------   hecho solo para pedidos
    Este indicador se debe tener en cuenta y sumar tanto los envíos de pedidos como los de mensajería. 
    El porcentaje se calcula en función del total general de pedidos y envíos mensuales entregados. */

    create view CARPINCHO_LOVERS.porcentaje_pedidos_mensajeria_entregados(anio, mes, rango_etario_repartidor, localidad, porcentaje_entregados) as
    select anio, mes, edad_descripcion, dimension_localidad_localidad_nombre,

    (sum(cantidad_pedidos + cantidad_envios)*100
    /
        (select sum(cantidad_pedidos) from CARPINCHO_LOVERS.hechos_pedidos as ts where 
            ts.dimension_provincia_localidad_id = t1.dimension_provincia_localidad_id and
            ts.dimension_tiempo_id = t1.dimension_tiempo_id and
            ts.dimension_rango_etario_repartidor_id = t1.dimension_rango_etario_repartidor_id)
     + 
        (select sum(cantidad_envios) from CARPINCHO_LOVERS.hechos_mensajeria as ts where
            ts.dimension_provincia_localidad_id = t1.dimension_provincia_localidad_id and
            ts.dimension_tiempo_id = t1.dimension_tiempo_id and
            ts.dimension_rango_etario_repartidor_id = t1.dimension_rango_etario_repartidor_id))
    
    from CARPINCHO_LOVERS.hechos_pedidos as t1
        join CARPINCHO_LOVERS.hechos_mensajeria as t2 on  (t2.dimension_tiempo_id = t1.dimension_tiempo_id and
                                                           t2.dimension_rango_etario_repartidor_id = t1.dimension_rango_etario_repartidor_id and
                                                            t2.dimension_provincia_localidad_id = t1.dimension_provincia_localidad_id)
        join CARPINCHO_LOVERS.dimension_tiempo as t3 on t1.dimension_tiempo_id = t3.dimension_tiempo_id
        join CARPINCHO_LOVERS.dimension_provincia_localidad as t4 on t1.dimension_provincia_localidad_id = t4.dimension_provincia_localidad_id
        join CARPINCHO_LOVERS.dimension_rango_etario as t5 on t1.dimension_rango_etario_repartidor_id = t5.dimension_rango_etario_id
        join CARPINCHO_LOVERS.dimension_estado_pedido as t6 on t1.dimension_estado_pedido_id = t6.dimension_estado_pedido_id
        join CARPINCHO_LOVERS.dimension_estado_envio_mensajeria as t7 on t2.dimension_estado_envio_mensajeria_id = t7.dimension_estado_envio_mensajeria_id
    where dimension_estado_pedido_descripcion = 'Estado Pedido Entregado' or dimension_estado_mensajeria_descripcion = 'Estado Mensajeria Entregado'
    group by anio, mes, edad_descripcion, dimension_localidad_localidad_nombre,
        t1.dimension_provincia_localidad_id, t1.dimension_tiempo_id, t1.dimension_rango_etario_repartidor_id
    
    go

    /* Promedio mensual del valor asegurado (valor declarado por el usuario) de los paquetes enviados 
    a través del servicio de mensajería en función del tipo de paquete */

    create view CARPINCHO_LOVERS.promedio_valor_asegurado_mensual(anio, mes, tipo_paquete, valor_asegurado_promedio) as
    select anio, mes, dimension_tipo_paquete_descripcion, sum(valor_asegurado_total)/sum(cantidad_envios)
    from CARPINCHO_LOVERS.hechos_mensajeria as t1
        join CARPINCHO_LOVERS.dimension_tiempo as t2 on t1.dimension_tiempo_id = t2.dimension_tiempo_id
        join CARPINCHO_LOVERS.dimension_tipo_paquete as t3 on t1.dimension_tipo_paquete_id = t3.dimension_tipo_paquete_id
    group by anio, mes, dimension_tipo_paquete_descripcion
    
    go

    /* Cantidad de reclamos mensuales recibidos por cada local en función del día de la semana y rango horario. */

    create view CARPINCHO_LOVERS.cantidad_reclamos_mensuales(anio, mes, dia, rango_horario, local, cant_reclamos) as -- Discrimina por anio o junta los meses??
    select anio, mes, dia_nombre, horario_descripcion, dimension_local_nombre, sum(cantidad_reclamos)
    from CARPINCHO_LOVERS.hechos_reclamos as t1
        join CARPINCHO_LOVERS.dimension_tiempo as t2 on t1.dimension_tiempo_id = t2.dimension_tiempo_id
        join CARPINCHO_LOVERS.dimension_dia_semana as t3 on t1.dimension_dia_semana_id = t3.dimension_dia_semana_id
        join CARPINCHO_LOVERS.dimension_rango_horario as t4 on t1.dimension_rango_horario_id = t4.dimension_rango_horario_id
        join CARPINCHO_LOVERS.dimension_local as t5 on t1.dimension_local_id = t5.dimension_local_id
    group by anio, mes, dia_nombre, horario_descripcion, dimension_local_nombre

    go
    
    /*  Tiempo promedio de resolución de reclamos mensual según cada tipo de reclamo y rango etario de los operadores.
    El tiempo de resolución debe calcularse en minutos y representa la diferencia entre la fecha/hora en que se
    realizó el reclamo y la fecha/hora que se resolvió. */
    
    create view CARPINCHO_LOVERS.promedio_tiempo_resolucion_reclamos(anio, mes, tipo_reclamo, rango_etario_operador, tiempo_resolucion_promedio) as
    select anio, mes, dimension_reclamo_tipo_descripcion, edad_descripcion, sum(tiempo_resolucion_total)/sum(cantidad_reclamos)
    from CARPINCHO_LOVERS.hechos_reclamos as t1
        join CARPINCHO_LOVERS.dimension_tiempo as t2 on t1.dimension_tiempo_id = t2.dimension_tiempo_id
        join CARPINCHO_LOVERS.dimension_tipo_reclamo as t3 on t1.dimension_tipo_reclamo_id = t3.dimension_tipo_reclamo_id
        join CARPINCHO_LOVERS.dimension_rango_etario as t4 on t1.dimension_rango_etario_id = t4.dimension_rango_etario_id
    group by anio, mes, dimension_reclamo_tipo_descripcion, edad_descripcion
    
    go

    /* Monto mensual generado en cupones a partir de reclamos. */

    create view CARPINCHO_LOVERS.monto_generado_en_cupones(anio, mes, monto) as -- Asumimos que discrimina por anio
    select anio, mes, sum(monto_cupones)
    from CARPINCHO_LOVERS.hechos_reclamos as t1
        join CARPINCHO_LOVERS.dimension_tiempo as t2 on t1.dimension_tiempo_id = t2.dimension_tiempo_id
    group by anio, mes

    go
    
    ------- CONSULTA VIEWS --------
/*
    select * from CARPINCHO_LOVERS.mayor_cant_pedidos
    select * from CARPINCHO_LOVERS.monto_total_no_cobrado
    select * from CARPINCHO_LOVERS.promedio_mensual_envios_pedidos
    select * from CARPINCHO_LOVERS.desvio_promedio_tiempo_entrega
    select * from CARPINCHO_LOVERS.monto_total_cupones
    select * from CARPINCHO_LOVERS.promedio_calificacion_mensual
    select * from CARPINCHO_LOVERS.porcentaje_pedidos_mensajeria_entregados
    select * from CARPINCHO_LOVERS.promedio_valor_asegurado_mensual
    select * from CARPINCHO_LOVERS.cantidad_reclamos_mensuales
    select * from CARPINCHO_LOVERS.promedio_tiempo_resolucion_reclamos
    select * from CARPINCHO_LOVERS.monto_generado_en_cupones
*/