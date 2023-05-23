use GD1C2023
go

create schema CARPINCHO_LOVERS
go

create table CARPINCHO_LOVERS.usuario( -- Done
    usuario_id decimal(18, 0) not null identity(1,1),
    usuario_dni decimal(18, 0) not null,
    usuario_nombre nvarchar(255) not null,
    usuario_apellido nvarchar(255) not null,
    usuario_telefono decimal(18, 0) not null,
    usuario_mail nvarchar(255) not null,
    usuario_fecha_nac date not null,
    usuario_fecha_registro datetime not null,
)

create table CARPINCHO_LOVERS.repartidor( -- Done
    repartidor_id decimal(18, 0) not null identity(1,1),
    repartidor_nombre nvarchar(255) not null,
    repartidor_apellido nvarchar(255) not null,
    repartidor_dni decimal(18, 0) not null,
    repartidor_telefono decimal(18, 0) not null,
    repartidor_direccion nvarchar(255) not null,
    repartidor_email nvarchar(255) not null,
    repartidor_fecha_nac date not null,
    repartidor_tipo_movilidad decimal(18, 0) not null
)

create table CARPINCHO_LOVERS.repartidor_x_localidad( -- Done
    repartidor_id decimal(18, 0) not null,
    localidad_id decimal(18, 0) not null,
    es_activa smallint not null
)

create table CARPINCHO_LOVERS.movilidad_tipo( -- Done
    movilidad_tipo_id decimal(18,0) not null identity(1,1),
    movilidad_tipo_descripcion nvarchar(50)    
)

create table CARPINCHO_LOVERS.direccion_usuario( -- Done
    direccion_id decimal(18, 0) not null identity(1, 1),
    direccion_usuario_id decimal(18, 0) not null,
    direccion_usuario_nombre nvarchar(50) not null,
    direccion_usuario_direccion nvarchar(255) not null,
    direccion_usuario_localidad date not null
)

create table CARPINCHO_LOVERS.cupon( -- Done
    cupon_nro decimal(18, 0) not null identity(1, 1),
    cupon_monto decimal(18, 2) not null,
    cupon_fecha_alta datetime not null,
    cupon_fecha_vencimiento datetime not null,
    cupon_tipo decimal(18, 0) not null,
    cupon_usuario_id decimal(18, 0) not null
)

create table CARPINCHO_LOVERS.cupon_tipo( -- Done
    cupon_tipo_id decimal(18, 0) not null identity(1, 1),
    cupon_tipo_descripcion nvarchar(50) not null
)

create table CARPINCHO_LOVERS.cupor_reclamo( -- Done
    cupon_reclamo_reclamo_nro decimal(18, 0) not null,
    cupon_reclamo_nro decimal(18, 0) not null
)

create table CARPINCHO_LOVERS.cupon_x_pedido( -- Done
    cupon_nro decimal(18, 0) not null,
    pedido_nro decimal(18, 0) not null
)

create table CARPINCHO_LOVERS.localidad( -- Done
    localidad_id decimal(18, 0) not null identity(1, 1),
    localidad_nombre nvarchar(50) not null,
    localidad_provincia_id decimal(18, 0)
)

create table CARPINCHO_LOVERS.direccion_envio( -- Done
    direccion_envio_id decimal(18, 0) not null identity(1, 1),
    direccion_envio_direccion nvarchar(255) not null,
    direccion_envio_localidad decimal(18, 0) not null
)

create table CARPINCHO_LOVERS.provincia( -- Done
    provincia_id decimal(18, 0) not null identity(1, 1),
    provincia_nombre nvarchar(30) not null
)

create table CARPINCHO_LOVERS.local( -- Done
    local_id decimal(18, 0) not null identity(1, 1),
    local_nombre nvarchar(100) not null,
    local_descripcion nvarchar(255) not null,
    local_direccion nvarchar(255) not null,
    local_localidad decimal(18, 0) not null,
    local_categoria_id decimal(18, 0)
)

create table CARPINCHO_LOVERS.horario( -- Done
    dia_id decimal(18, 0) not null,
    local_id decimal(18, 0) not null,
    horario_apertura time not null,
    horario_cierre time not null
)

create table CARPINCHO_LOVERS.dia( -- Done
    dia_id decimal(18, 0) not null identity(1, 1),
    dia_nombre nvarchar(15)
)

create table CARPINCHO_LOVERS.envio( -- Done
    envio_id decimal(18, 0) not null identity(1, 1),
    envio_precio decimal(18, 2) not null,
    envio_propina decimal(18, 2) not null,
    envio_direccion_id decimal(18, 0) not null,
    envio_repartidor_id decimal(18, 0) not null,
    envio_total decimal(18, 2) not null
)

create table CARPINCHO_LOVERS.pedido( -- Done
    pedido_nro decimal(18, 0) not null identity(1, 1),
    pedido_local_id decimal(18, 0) not null,
    pedido_usuario_id decimal(18, 0) not null, 
    pedido_total_productos decimal(18, 2) not null, 
    pedido_tarifa_servicio decimal(18, 2) not null, 
    pedido_total_cupones decimal(18, 2) not null, 
    pedido_total_servicio decimal(18, 2) not null, 
    pedido_observ nvarchar(255) not null,
    pedido_fecha datetime2(3) not null,
    pedido_fecha_entrega datetime2(3) not null,
    pedido_tiempo_estimado_entrega decimal(18, 2) not null,
    pedido_calificacion decimal(18, 2) not null,
    pedido_tipo_medio_pago decimal(18, 0) not null,
    pedido_medio_pago_id decimal(18, 0),
    pedido_envio_id decimal(18, 0) not null,
    pedido_total decimal(18, 2) not null
)

create table CARPINCHO_LOVERS.estado_pedido( -- Done
    estado_pedido_id decimal(18,0) not null identity(1,1),
    estado_pedido_nro decimal(18,0) not null,
    estado_pedido_estado decimal(18,0) not null,
    estado_pedido_fecha datetime not null
)

create table CARPINCHO_LOVERS.estado_posible_pedido( -- Done
    epp_id decimal(18,0) not null identity(1,1),
    epp_descripcion nvarchar(50) not null
)

create table CARPINCHO_LOVERS.reclamo( -- Done
    reclamo_nro decimal(18, 0) not null identity(1,1),
    reclamo_fecha datetime2(3) not null,
    reclamo_descripcion nvarchar(255) not null,
    reclamo_fecha_solucion datetime2(3) not null,
    reclamo_solucion nvarchar(255) not null,
    reclamo_calificacion decimal(18, 0) not null,
    reclamo_tipo decimal(18, 0) not null,
    reclamo_pedido_nro decimal(18, 0) not null,
    reclamo_operador_id decimal(18, 0) not null
)

create table CARPINCHO_LOVERS.reclamo_tipo( -- Done
    reclamo_tipo_id decimal(18,0) not null identity(1,1),
    reclamo_tipo_descripcion nvarchar(50)
)

create table CARPINCHO_LOVERS.estado_reclamo( -- Done
    estado_reclamo_id decimal(18,0) not null identity(1,1),
    estado_reclamo_nro decimal(18,0) not null,
    estado_reclamo_estado decimal(18,0) not null,
    estado_reclamo_fecha datetime not null
)

create table CARPINCHO_LOVERS.estado_posible_reclamo( -- Done
    epr_id decimal(18,0) not null identity(1,1),
    epr_descripcion nvarchar(50) not null
)

create table CARPINCHO_LOVERS.operador_reclamo( -- Done
    operador_reclamo_id decimal(18, 0) not null identity(1,1),
    operador_reclamo_nombre nvarchar(255) not null,
    operador_reclamo_apellido nvarchar(255) not null,
    operador_reclamo_dni decimal(18, 0) not null,
    operador_reclamo_telefono decimal(18, 0) not null,
    operador_reclamo_direccion nvarchar(255) not null,
    operador_reclamo_mail nvarchar(255) not null,
    operador_reclamo_fecha_nac date not null
)

create table CARPINCHO_LOVERS.medio_de_pago( -- Done
    medio_pago_id decimal(18, 0) not null identity(1,1),
    medio_pago_nro_tarjeta nvarchar(50) not null,
    medio_pago_tipo decimal(18, 0) not null,
    medio_pago_marca_tarjeta nvarchar(100) not null,
    medio_pago_usuario_id decimal(18, 0) not null
)

create table CARPINCHO_LOVERS.marca_tarjeta( -- Done
    marca_tarjeta_id decimal(18, 0) not null identity(1,1),
    marca_tarjeta_nombre nvarchar(50) not null
)

create table CARPINCHO_LOVERS.tipo_medio_de_pago( -- Done
    tipo_medio_pago_id decimal(18, 0) not null identity(1,1),
    tipo_medio_pago_descripcion nvarchar(50) not null
)

create table CARPINCHO_LOVERS.producto( -- Done
    producto_local_codigo nvarchar(50) not null,
    producto_local_nombre nvarchar(50) not null,
    producto_local_descripcion nvarchar(255)
)

create table CARPINCHO_LOVERS.producto_pedido( -- Done
    producto_pedido_producto_id decimal(18, 0) not null,
    producto_pedido_local_id decimal(18, 0) not null,
    producto_pedido_codigo decimal(18, 0) not null,
    producto_pedido_cantidad decimal(18, 0) not null,
    producto_precio decimal(18, 2) not null
)

create table CARPINCHO_LOVERS.localXproducto( -- Done
    producto_local_codigo nvarchar(50) not null,
    local_id decimal(18,0) not null,
    producto_local_precio decimal(18,2)
)

create table CARPINCHO_LOVERS.categoria( -- Done
    categoria_id decimal(18,0) not null identity(1,1),
    categoria_nombre nvarchar(100) not null unique,
    categoria_tipo decimal(18,0) not null
)

create table CARPINCHO_LOVERS.tipo_local( -- Done
    tipo_local_id decimal(18,0) not null identity(1,1),
    tipo_local_descripcion nvarchar(100)
)

create table CARPINCHO_LOVERS.paquete( -- Done
    paquete_id decimal(18, 0) not null identity,
    paquete_tipo_paquete decimal(18, 0) not null
)

create table CARPINCHO_LOVERS.tipo_paquete( -- Done
    tipo_paquete_id decimal(18, 0) not null identity(1, 1),
    tipo_paquete_descripcion nvarchar(50) not null,
    tipo_paquete_alto_max decimal(18, 2) not null,
    tipo_paquete_ancho_max decimal(18, 2) not null,
    tipo_paquete_largo_max decimal(18, 2) not null,
    tipo_paquete_peso_max decimal(18, 2) not null,
    tipo_paquete_precio decimal(18, 2) not null
)

-- create table CARPINCHO_LOVERS.paquete_tipo(
--     paquete_tipo_id decimal(18, 0) not null identity(1, 1),
--     paquete_tipo_descripcion nvarchar(50) not null
-- )

-- create table CARPINCHO_LOVERS.paquete_precio_tipo(
--     paquete_precio_tipo_id decimal(18, 0) not null identity(1, 1),
--     paquete_precio_tipo_descripcion decimal(18, 2)
-- )

create table CARPINCHO_LOVERS.envio_mensajeria( -- Done
    envio_mensajeria_nro decimal(18 ,0) not null identity(1, 1),
    envio_mesajeria_direccion_origen decimal(18 ,0) not null,
    envio_mesajeria_direccion_destino decimal(18 ,0) not null,
    envio_mesajeria_km decimal(18 ,2) not null,
    envio_mesajeria_valor_asegurado decimal(18 ,2) not null,
    envio_mesajeria_precio_envio decimal(18 ,2) not null,
    envio_mesajeria_precio_seguro decimal(18 ,2) not null,
    envio_mesajeria_precio_paquete decimal(18 ,2) not null,
    envio_mesajeria_propina decimal(18 ,2) not null,
    envio_mesajeria_total decimal(18 ,2) not null,
    envio_mesajeria_observ nvarchar(255) not null,
    envio_mesajeria_fecha datetime not null,
    envio_mesajeria_fecha_entrega datetime not null,
    envio_mesajeria_tiempo_estimado decimal(18 ,2) not null,
    envio_mesajeria_calificacion decimal(18, 0) not null,
    envio_mesajeria_estado nvarchar(50) not null,
    envio_mesajeria_tipo_medio_pago_id decimal(18 ,0) not null,
    envio_mesajeria_usuario_id decimal(18 ,0) not null,
    envio_mesajeria_rapeetidor_id decimal(18 ,0) not null,
    envio_mesajeria_paquete_id decimal(18 ,0) not null,
    envio_mesajeria_medio_pago_id decimal(18 ,0) not null
)

create table CARPINCHO_LOVERS.estado_mensajeria( -- Done
    estado_mensajeria_id decimal(18,0) not null identity(1,1),
    estado_mensajeria_nro decimal(18,0) not null,
    estado_envio_estado decimal(18,0) not null,
    estado_mensajeria_fecha datetime not null
)

create table CARPINCHO_LOVERS.estado_posible_envio( -- Done
    epe_id decimal(18,0) not null identity(1,1),
    epe_descripcion nvarchar(50) not null
)
go

--PRIMARY KEYS

alter table CARPINCHO_LOVERS.usuario add constraint pk_usuario primary key (usuario_id)
alter table CARPINCHO_LOVERS.direccion_usuario add constraint pk_direccion_usuario primary key (direccion_id)
alter table CARPINCHO_LOVERS.medio_de_pago add constraint pk_medio_de_pago primary key (medio_pago_id)
alter table CARPINCHO_LOVERS.marca_tarjeta add constraint pk_marca_tarjeta primary key (marca_tarjeta_id)
alter table CARPINCHO_LOVERS.tipo_medio_de_pago add constraint pk_tipo_medio_de_pago primary key (tipo_medio_de_pago_id)
alter table CARPINCHO_LOVERS.localidad add constraint pk_localidad primary key (localidad_id)
alter table CARPINCHO_LOVERS.provincia add constraint pk_provincia primary key (provincia_id)
alter table CARPINCHO_LOVERS.local add constraint pk_local primary key (local_id)
alter table CARPINCHO_LOVERS.categoria add constraint pk_categoria primary key (categoria_id)
alter table CARPINCHO_LOVERS.tipo_local add constraint pk_tipo_local primary key (tipo_local_id)
alter table CARPINCHO_LOVERS.dia add constraint pk_dia primary key (dia_id)
alter table CARPINCHO_LOVERS.horario add constraint pk_horario primary key (dia_id, local_id)
alter table CARPINCHO_LOVERS.producto add constraint pk_producto primary key (producto_local_codigo)
alter table CARPINCHO_LOVERS.local_x_producto add constraint pk_local_x_producto primary key (producto_local_codigo, local_id)
alter table CARPINCHO_LOVERS.repartidor add constraint pk_repartidor primary key (repartidor_id)
alter table CARPINCHO_LOVERS.movilidad_tipo add constraint pk_movilidad_tipo primary key (movilidad_tipo_id)
alter table CARPINCHO_LOVERS.repartidor_x_localidad add constraint pk_repartidor_x_local primary key (repartidor_id, localidad_id)
alter table CARPINCHO_LOVERS.pedido add constraint pk_pedido primary key (pedido_nro)
alter table CARPINCHO_LOVERS.estado_pedido add constraint pk_estado_pedido primary key (estado_pedido_id)
alter table CARPINCHO_LOVERS.estado_posible_pedido add constraint pk_estado_posible_pedido primary key (epp_id)
alter table CARPINCHO_LOVERS.producto_pedido add constraint pk_producto_pedido primary key (producto_pedido_producto_id, producto_pedido_local_id, producto_pedido_codigo)
alter table CARPINCHO_LOVERS.envio add constraint pk_envio primary key (envio_id)
alter table CARPINCHO_LOVERS.reclamo add constraint pk_reclamo primary key (reclamo_nro)
alter table CARPINCHO_LOVERS.estado_reclamo add constraint pk_estado_reclamo primary key (estado_reclamo_id)
alter table CARPINCHO_LOVERS.estado_posible_reclamo add constraint pk_estado_posible_reclamo primary key (epr_id)
alter table CARPINCHO_LOVERS.reclamo_tipo add constraint pk_reclamo_tipo primary key (reclamo_tipo_id)
alter table CARPINCHO_LOVERS.operador_reclamo add constraint pk_operador_reclamo primary key (operador_reclamo_id)
alter table CARPINCHO_LOVERS.envio_mensajeria add constraint pk_envio_mensajeria primary key (envio_mensajeria_nro)
alter table CARPINCHO_LOVERS.estado_mensajeria add constraint pk_estado_mensajeria primary key (estado_mensajeria_id)
alter table CARPINCHO_LOVERS.estado_posible_envio add constraint pk_estado_posible_envio primary key (epe_id)
alter table CARPINCHO_LOVERS.paquete add constraint pk_paquete primary key (paquete_id)
alter table CARPINCHO_LOVERS.tipo_paquete add constraint pk_tipo_paquete primary key (tipo_paquete_id)
alter table CARPINCHO_LOVERS.direccion_envio add constraint pk_direccion_envio primary key (direccion_envio_id)
alter table CARPINCHO_LOVERS.cupon add constraint pk_cupon primary key (cupon_nro)
alter table CARPINCHO_LOVERS.cupon_tipo add constraint pk_cupon_tipo primary key (cupon_tipo_id)
alter table CARPINCHO_LOVERS.cupon_x_pedido add constraint pk_cupon_x_pedido primary key (cupon_nro, pedido_nro)
alter table CARPINCHO_LOVERS.cupon_reclamo add constraint pk_cupon_reclamo primary key (cupon_reclamo_reclamo_nro, cupon_reclamo_nro)


--FOREIGN KEYS

alter table CARPINCHO_LOVERS.direccion_usuario add constraint fk_direccion_usuario_usuario foreign key (direccion_usuario_id)
        references CARPINCHO_LOVERS.usuario (usuario_id)
alter table CARPINCHO_LOVERS.direccion_usuario add constraint fk_direccion_usuario_localidad foreign key (direccion_usuario_localidad)
        references CARPINCHO_LOVERS.localidad (localidad_id)
alter table CARPINCHO_LOVERS.localidad add constraint fk_localidad_provincia foreign key (localidad_provincia_id)
        references CARPINCHO_LOVERS.provincia (provincia_id)
alter table CARPINCHO_LOVERS.cupon add constraint fk_cupon_tipo foreign key (cupon_tipo)
        references CARPINCHO_LOVERS.cupon_tipo (cupon_tipo_id)
alter table CARPINCHO_LOVERS.cupon add constraint fk_cupon_usuario foreign key (cupon_usuario_id)
        references CARPINCHO_LOVERS.usuario (usuario_id)
alter table CARPINCHO_LOVERS.cupon_reclamo add constraint fk_cupon_reclamo_cupon foreign key (cupon_reclamo_nro)
        references CARPINCHO_LOVERS.cupon (cupon_nro)
alter table CARPINCHO_LOVERS.cupon_reclamo add constraint fk_cupon_reclamo_reclamo foreign key (cupon_reclamo_reclamo_nro)
        references CARPINCHO_LOVERS.reclamo (reclamo_nro)
alter table CARPINCHO_LOVERS.repartidor add constraint fk_repartidor_tipo_movilidad foreign key (repartidor_tipo_movilidad)
        references CARPINCHO_LOVERS.movilidad_tipo (movilidad_tipo_id)
alter table CARPINCHO_LOVERS.repartidor_x_localidad add constraint fk_repartidor_x_localida_repartidor foreign key (repartidor_id)
        references CARPINCHO_LOVERS.repartidor (repartidor_id)
alter table CARPINCHO_LOVERS.repartidor add constraint fk_repartidor_x_localidad_localidad foreign key (localidad_id)
        references CARPINCHO_LOVERS.localidad (localidad_id)
alter table CARPINCHO_LOVERS.cupon_x_pedido add constraint fk_cupon_x_pedido_cupon foreign key (cupon_nro)
        references CARPINCHO_LOVERS.cupon (cupon_nro)
alter table CARPINCHO_LOVERS.cupon_x_pedido add constraint fk_cupon_x_pedido_pedido foreign key (pedido_nro)
        references CARPINCHO_LOVERS.pedido (pedido_nro)
alter table CARPINCHO_LOVERS.direccion_envio add constraint fk_direccion_envio_localidad foreign key (direccion_envio_localidad)
        references CARPINCHO_LOVERS.localidad (localidad_id)
alter table CARPINCHO_LOVERS.local add constraint fk_local_localidad foreign key (local_localidad)
        references CARPINCHO_LOVERS.localidad (localidad_id)
alter table CARPINCHO_LOVERS.local add constraint fk_local_categoria foreign key (local_categoria_id)
        references CARPINCHO_LOVERS.categoria (categoria_id)
alter table CARPINCHO_LOVERS.horario add constraint fk_horario_dia foreign key (dia_id)
        references CARPINCHO_LOVERS.dia (dia_id)
alter table CARPINCHO_LOVERS.horario add constraint fk_horario_local foreign key (local_id)
        references CARPINCHO_LOVERS.local (local_id)
alter table CARPINCHO_LOVERS.envio add constraint fk_envio_direccion foreign key (envio_direccion_id)
        references CARPINCHO_LOVERS.direccion_usuario (direccion_id)
alter table CARPINCHO_LOVERS.envio add constraint fk_envio_repartidor foreign key (envio_repartidor_id)
        references CARPINCHO_LOVERS.repartidor (repartidor_id)
alter table CARPINCHO_LOVERS.pedido add constraint fk_pedido_local foreign key (pedido_local_id)
        references CARPINCHO_LOVERS.local (local_id)
alter table CARPINCHO_LOVERS.pedido add constraint fk_pedido_usuario foreign key (pedido_usuario_id)
        references CARPINCHO_LOVERS.usuario (usuario_id)
alter table CARPINCHO_LOVERS.pedido add constraint fk_pedido_tipo_medio_pago foreign key (pedido_tipo_medio_pago)
        references CARPINCHO_LOVERS.tipo_medio_de_pago (tipo_medio_de_pago_id)
alter table CARPINCHO_LOVERS.pedido add constraint fk_medio_pago foreign key (pedido_medio_pago_id)
        references CARPINCHO_LOVERS.medio_de_pago (medio_pago_id)
alter table CARPINCHO_LOVERS.pedido add constraint fk_pedido_envio foreign key (pedido_envio_id)
        references CARPINCHO_LOVERS.envio (envio_id)
alter table CARPINCHO_LOVERS.estado_pedido add constraint fk_estado_pedido_pedido foreign key (estado_pedido_nro)
        references CARPINCHO_LOVERS.pedido (pedido_nro)
alter table CARPINCHO_LOVERS.estado_pedido add constraint fk_estado_pedido_estado foreign key (estado_pedido_estado)
        references CARPINCHO_LOVERS.estado_posible_pedido (epp_id)
alter table CARPINCHO_LOVERS.reclamo add constraint fk_reclamo_tipo foreign key (reclamo_tipo)
        references CARPINCHO_LOVERS.reclamo_tipo (reclamo_tipo_id)
alter table CARPINCHO_LOVERS.reclamo add constraint fk_reclamo_pedido foreign key (reclamo_pedido_nro)
        references CARPINCHO_LOVERS.pedido (pedido_nro)
alter table CARPINCHO_LOVERS.reclamo add constraint fk_reclamo_operador foreign key (reclamo_operador_id)
        references CARPINCHO_LOVERS.operador_reclamo (operador_reclamo_id)
alter table CARPINCHO_LOVERS.estado_reclamo add constraint fk_estado_reclamo_reclamo foreign key (estado_reclamo_nro)
        references CARPINCHO_LOVERS.reclamo (reclamo_nro)
alter table CARPINCHO_LOVERS.estado_reclamo add constraint fk_estado_reclamo_estado foreign key (estado_reclamo_estado)
        references CARPINCHO_LOVERS.estado_posible_reclamo (epr_id)
alter table CARPINCHO_LOVERS.medio_de_pago add constraint fk_medio_de_pago_tipo foreign key (medio_pago_tipo)
        references CARPINCHO_LOVERS.tipo_medio_de_pago (tipo_medio_de_pago_id)
alter table CARPINCHO_LOVERS.medio_de_pago add constraint fk_medio_de_pago_marca_tarjeta foreign key (medio_pago_marca_tarjeta)
        references CARPINCHO_LOVERS.marca_tarjeta (marca_tarjeta_id)
alter table CARPINCHO_LOVERS.medio_de_pago add constraint fk_medio_de_pago_usuario foreign key (medio_pago_usuario_id)
        references CARPINCHO_LOVERS.usuario (usuario_id)
alter table CARPINCHO_LOVERS.producto_pedido add constraint fk_producto_pedido_producto_y_local foreign key (producto_pedido_producto_id, producto_pedido_local_id)
        references CARPINCHO_LOVERS.local_x_producto (producto_local_codigo, local_id)
alter table CARPINCHO_LOVERS.producto_pedido add constraint fk_producto_pedido_pedido foreign key (producto_pedido_codigo)
        references CARPINCHO_LOVERS.pedido (pedido_nro)
alter table CARPINCHO_LOVERS.local_x_producto add constraint fk_local_x_producto_producto foreign key (producto_local_codigo)
        references CARPINCHO_LOVERS.producto (producto_local_codigo)
alter table CARPINCHO_LOVERS.local_x_producto add constraint fk_local_x_producto_local foreign key (local_id)
        references CARPINCHO_LOVERS.local (local_id)
alter table CARPINCHO_LOVERS.categoria add constraint fk_categoria_tipo foreign key (categoria_tipo)
        references CARPINCHO_LOVERS.tipo_local (tipo_local_id)
alter table CARPINCHO_LOVERS.paquete add constraint fk_paquete_tipo_paquete foreign key (paquete_tipo)
        references CARPINCHO_LOVERS.tipo_paquete (tipo_paquete_id)
alter table CARPINCHO_LOVERS.envio_mensajeria add constraint fk_envio_mensajeria_dir_orig foreign key (envio_mesajeria_direccion_origen)
        references CARPINCHO_LOVERS.direccion_envio (direccion_enivo_id)
alter table CARPINCHO_LOVERS.envio_mensajeria add constraint fk_envio_mensajeria_dir_des foreign key (envio_mesajeria_direccion_destino)
        references CARPINCHO_LOVERS.direccion_envio (direccion_enivo_id)
alter table CARPINCHO_LOVERS.envio_mensajeria add constraint fk_envio_mensajeria_tipo_medio_pago_id foreign key (envio_mesajeria_tipo_medio_pago_id)
        references CARPINCHO_LOVERS.tipo_medio_de_pago (tipo_medio_de_pago_id)
alter table CARPINCHO_LOVERS.envio_mensajeria add constraint fk_envio_mensajeria_usuario foreign key (envio_mensajeria_usuario_id)
        references CARPINCHO_LOVERS.usuario (usuario_id)
alter table CARPINCHO_LOVERS.envio_mesajeria add constraint fk_envio_mensajeria_repartidor foreign key (envio_mensajeria_repartidor_id)
        references CARPINCHO_LOVERS.repartidor (repartidor_id)
alter table CARPINCHO_LOVERS.envio_mensajeria add constraint fk_envio_mensajeria_paquete foreign key (envio_mensajeria_paquete_id)
        references CARPINCHO_LOVERS.paquete (paquete_id)
alter table CARPINCHO_LOVERS.envio_mensajeria add constraint fk_envio_mensajeria_medio_de_pago foreign key (envio_mesajeria_medio_pago_id)
        references CARPINCHO_LOVERS.medio_de_pago (medio_pago_id)
alter table CARPINCHO_LOVERS.estado_mensajeria add constraint fk_estado_mensajeria_nro foreign key (estado_mensajeria_nro)
        references CARPINCHO_LOVERS.envio_mensajeria (envio_mensajeria_nro)
alter table CARPINCHO_LOVERS.estado_mensajeria add constraint fk_estado_envio_estado foreign key (estado_envio_estado)
        references CARPINCHO_LOVERS.estado_posible_envio (epe_id)

go

--PROCEDURES

create proc CARPINCHO_LOVERS.migrar_usuarios as
begin 
    insert CARPINCHO_LOVERS.usuario (usuario_nombre, usuario_apellido, usuario_dni, usuario_fecha_registro,
    usuario_telefono, usuario_mail, usuario_fecha_nac)
    (
        select USUARIO_NOMBRE,USUARIO_APELLIDO,USUARIO_DNI,USUARIO_FECHA_REGISTRO,USUARIO_TELEFONO,
        USUARIO_MAIL,USUARIO_FECHA_NAC from gd_esquema.Maestra 

        group by USUARIO_NOMBRE,USUARIO_APELLIDO,USUARIO_DNI,USUARIO_FECHA_REGISTRO,USUARIO_TELEFONO,
        USUARIO_MAIL,USUARIO_FECHA_NAC 
    )
end 

go

create proc CARPINCHO_LOVERS.migrar_tipo_paquete as -- Hay q ver el tema de crear un paquete por cada fila y asignarle su tipo de paquete
begin
    insert CARPINCHO_LOVERS.tipo_paquete(tipo_paquete_descripcion, tipo_paquete_alto_max, tipo_paquete_ancho_max, tipo_paquete_largo_max, tipo_paquete_peso_max, tipo_paquete_precio)
    (
            select PAQUETE_TIPO, PAQUETE_ALTO_MAX, PAQUETE_ANCHO_MAX, PAQUETE_LARGO_MAX, PAQUETE_PESO_MAX, PAQUETE_TIPO_PRECIO
            from gd_esquema.Maestra
            where PAQUETE_TIPO is not null
            group by PAQUETE_TIPO, PAQUETE_ALTO_MAX, PAQUETE_ANCHO_MAX, PAQUETE_LARGO_MAX, PAQUETE_PESO_MAX, PAQUETE_TIPO_PRECIO
    )
end

go

create proc CARPINCHO_LOVERS.migrar_marca_tarjeta as
begin
    insert CARPINCHO_LOVERS.marca_tarjeta(marca_tarjeta_nombre)
    (
        select marca_tarjeta from gd_esquema.Maestra group by marca_tarjeta
    )
end

go

create proc CARPINCHO_LOVERS.migrar_tipo_medio_de_pago as
begin
    insert CARPINCHO_LOVERS.tipo_medio_de_pago(tipo_medio_pago_descripcion)
    (
        select medio_pago_tipo from gd_esquema.Maestra group by medio_pago_tipo
    )
end

go

create proc CARPINCHO_LOVERS.migrar_estado_posible_envio as
begin
    insert CARPINCHO_LOVERS.estado_posible_envio(epe_descripcion)
    (
        select ENVIO_MENSAJERIA_ESTADO from gd_esquema.Maestra where ENVIO_MENSAJERIA_ESTADO is not null group by ENVIO_MENSAJERIA_ESTADO
    )
end

go

create proc CARPINCHO_LOVERS.migrar_estado_posible_pedido as
begin
    insert CARPINCHO_LOVERS.estado_posible_pedido(epp_descripcion)
    (
        select PEDIDO_ESTADO from gd_esquema.Maestra where PEDIDO_ESTADO is not null group by PEDIDO_ESTADO
    )
end

go

create proc CARPINCHO_LOVERS.migrar_estado_posible_reclamo as
begin 
    insert CARPINCHO_LOVERS.estado_posible_reclamo(epr_descripcion)
    (
        select RECLAMO_ESTADO from gd_esquema.Maestra
        where RECLAMO_ESTADO is not null 
        group by RECLAMO_ESTADO
    )
end

go

create proc CARPINCHO_LOVERS.migrar_reclamo_tipo as
begin 
    insert CARPINCHO_LOVERS.reclamo_tipo(reclamo_tipo_descripcion)
    (
      select RECLAMO_TIPO from gd_esquema.Maestra
      where RECLAMO_TIPO is not null
      group by RECLAMO_TIPO   
    )
end
go

create proc CARPINCHO_LOVERS.migrar_tipo_local as
begin 
    insert CARPINCHO_LOVERS.tipo_local(tipo_local_descripcion)
    (
      select LOCAL_TIPO from gd_esquema.Maestra
      where LOCAL_TIPO is not null
      group by LOCAL_TIPO  
    )
end
go

/*create proc CARPINCHO_LOVERS.migrar_categoria as
begin 
    insert CARPINCHO_LOVERS.categoria(categoria_nombre, categoria_tipo)
    (
      
    )
end
go*/

create proc CARPINCHO_LOVERS.migrar_tipo_movilidad as
begin
    insert CARPINCHO_LOVERS.movilidad_tipo(movilidad_tipo_descripcion)
    (
        select REPARTIDOR_TIPO_MOVILIDAD from gd_esquema.Maestra group by REPARTIDOR_TIPO_MOVILIDAD
    )
end

go

create proc CARPINCHO_LOVERS.migrar_tipo_cupon as
begin
    insert CARPINCHO_LOVERS.cupon_tipo(cupon_tipo_descripcion)
    (
        select CUPON_TIPO from gd_esquema.Maestra where CUPON_TIPO is not null
        union
        select CUPON_RECLAMO_TIPO from gd_esquema.Maestra where CUPON_RECLAMO_TIPO is not null
    )
end

go

create proc CARPINCHO_LOVERS.migrar_medio_de_pago as
begin
    insert CARPINCHO_LOVERS.medio_de_pago(medio_pago_nro_tarjeta, medio_pago_tipo, medio_pago_marca_tarjeta, medio_pago_usuario_id)
    (
        select medio_pago_nro_tarjeta,
            (select marca_tarjeta_id from marca_tarjeta where marca_tarjeta_nombre = te.marca_tarjeta),
            (select tipo_medio_de_pago_id from tipo_medio_de_pago where tipo_medio_pago_descripcion = te.medio_pago_tipo),
            (select usuario_id from usuario as ti 
                where ti.usuario_nombre+ti.usuario_apellido+ti.usuario_dni = te.usuario_nombre+te.usuario_apellido+te.usuario_dni)
        from gd_esquema.Maestra as te group by USUARIO_DNI,MEDIO_PAGO_NRO_TARJETA,MEDIO_PAGO_TIPO,MARCA_TARJETA 
    )
end

go

create proc CARPINCHO_LOVERS.migrar_provincia as
begin
    insert CARPINCHO_LOVERS.provincia(provincia_nombre)
    (
        select ENVIO_MENSAJERIA_PROVINCIA from gd_esquema.Maestra where ENVIO_MENSAJERIA_PROVINCIA is not null
        union
        select DIRECCION_USUARIO_PROVINCIA from gd_esquema.Maestra where DIRECCION_USUARIO_PROVINCIA is not null
        union
        select LOCAL_PROVINCIA from gd_esquema.Maestra where LOCAL_PROVINCIA is not null
    )
end

go

--ACA SE PUEDE HACER UNA FUNCION QUE DADO UN NOMBRE DE PROVINCIA NOS DE EL ID
create proc CARPINCHO_LOVERS.migrar_localidad as
begin
    insert CARPINCHO_LOVERS.localidad(localidad_nombre, localidad_provincia_id)
    (
        select ENVIO_MENSAJERIA_LOCALIDAD,
                (select provincia_id from provincia where provincia_nombre = ENVIO_MENSAJERIA_PROVINCIA)
            from gd_esquema.Maestra group by ENVIO_MENSAJERIA_LOCALIDAD, ENVIO_MENSAJERIA_PROVINCIA
        union
        select DIRECCION_USUARIO_LOCALIDAD,
                (select provincia_id from provincia where provincia_nombre = DIRECCION_USUARIO_PROVINCIA)
            from gd_esquema.Maestra group by DIRECCION_USUARIO_LOCALIDAD, DIRECCION_USUARIO_PROVINCIA
        union
        select LOCAL_LOCALIDAD,
                (select provincia_id from provincia where provincia_nombre = LOCAL_PROVINCIA)
            from gd_esquema.Maestra group by LOCAL_LOCALIDAD, LOCAL_PROVINCIA
    )
end

go

create proc CARPINCHO_LOVERS.migrar_direccion_usuario as
    insert CARPINCHO_LOVERS.direccion_usuario(direccion_usuario_id, direccion_usuario_nombre, direccion_usuario_direccion, direccion_usuario_localidad)
    (
        select 
            (select usuario_id from usuario as ti 
            where ti.usuario_nombre+ti.usuario_apellido+ti.usuario_dni = 
            te.usuario_nombre+te.usuario_apellido+te.usuario_dni),
            DIRECCION_USUARIO_NOMBRE, direccion_usuario_direccion,
            (select localidad_id from localidad where localidad_nombre = DIRECCION_USUARIO_LOCALIDAD)
        from gd_esquema.Maestra as te group by usuario_nombre, usuario_apellido, usuario_dni, DIRECCION_USUARIO_NOMBRE, 
        DIRECCION_USUARIO_DIRECCION, DIRECCION_USUARIO_LOCALIDAD, DIRECCION_USUARIO_PROVINCIA
    )
end