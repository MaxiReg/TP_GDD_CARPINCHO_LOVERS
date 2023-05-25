use GD1C2023
go

create schema CARPINCHO_LOVERS
go

------------------------------------------------- CREACION TABLAS -------------------------------------------------
create table CARPINCHO_LOVERS.usuario(
    usuario_id decimal(18, 0) not null identity(1,1),
    usuario_dni decimal(18, 0) not null,
    usuario_nombre nvarchar(255) not null,
    usuario_apellido nvarchar(255) not null,
    usuario_telefono decimal(18, 0) not null,
    usuario_mail nvarchar(255) not null,
    usuario_fecha_nac date not null,
    usuario_fecha_registro datetime not null
)

create table CARPINCHO_LOVERS.repartidor(
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

create table CARPINCHO_LOVERS.repartidor_x_localidad(
    repartidor_id decimal(18, 0) not null,
    localidad_id decimal(18, 0) not null,
    es_activa smallint not null
)

create table CARPINCHO_LOVERS.movilidad_tipo(
    movilidad_tipo_id decimal(18,0) not null identity(1,1),
    movilidad_tipo_descripcion nvarchar(50)    
)

create table CARPINCHO_LOVERS.direccion_usuario(
    direccion_id decimal(18, 0) not null identity(1, 1),
    direccion_usuario_id decimal(18, 0) not null,
    direccion_usuario_nombre nvarchar(50) not null,
    direccion_usuario_direccion nvarchar(255) not null,
    direccion_usuario_localidad decimal(18,0) not null
)

create table CARPINCHO_LOVERS.cupon(
    cupon_nro decimal(18, 0) not null identity(1, 1),
    cupon_monto decimal(18, 2) not null,
    cupon_fecha_alta datetime not null,
    cupon_fecha_vencimiento datetime not null,
    cupon_tipo decimal(18, 0) not null,
    cupon_usuario_id decimal(18, 0) not null
)

create table CARPINCHO_LOVERS.cupon_tipo(
    cupon_tipo_id decimal(18, 0) not null identity(1, 1),
    cupon_tipo_descripcion nvarchar(50) not null
)

create table CARPINCHO_LOVERS.cupon_reclamo(
    cupon_reclamo_reclamo_nro decimal(18, 0) not null,
    cupon_reclamo_nro decimal(18, 0) not null
)

create table CARPINCHO_LOVERS.cupon_x_pedido(
    cupon_nro decimal(18, 0) not null,
    pedido_nro decimal(18, 0) not null
)

create table CARPINCHO_LOVERS.localidad(
    localidad_id decimal(18, 0) not null identity(1, 1),
    localidad_nombre nvarchar(50) not null,
    localidad_provincia_id decimal(18, 0)
)

create table CARPINCHO_LOVERS.direccion_envio(
    direccion_envio_id decimal(18, 0) not null identity(1, 1),
    direccion_envio_direccion nvarchar(255) not null,
    direccion_envio_localidad decimal(18, 0) not null
)

create table CARPINCHO_LOVERS.provincia(
    provincia_id decimal(18, 0) not null identity(1, 1),
    provincia_nombre nvarchar(30) not null
)

create table CARPINCHO_LOVERS.local(
    local_id decimal(18, 0) not null identity(1, 1),
    local_nombre nvarchar(100) not null,
    local_descripcion nvarchar(255) not null,
    local_direccion nvarchar(255) not null,
    local_localidad decimal(18, 0) not null,
    local_categoria_id decimal(18, 0)
)

create table CARPINCHO_LOVERS.horario(
    dia_id decimal(18, 0) not null,
    local_id decimal(18, 0) not null,
    horario_apertura decimal(18, 0) not null,
    horario_cierre decimal(18, 0) not null
)

create table CARPINCHO_LOVERS.dia(
    dia_id decimal(18, 0) not null identity(1, 1),
    dia_nombre nvarchar(50)
)

create table CARPINCHO_LOVERS.envio_pedido(
    envio_pedido_id decimal(18, 0) not null identity(1, 1),
    envio_pedido_direccion_id decimal(18, 0) not null,
    envio_pedido_repartidor_id decimal(18, 0) not null,
    envio_pedido_nro decimal(18, 0) not null
)

create table CARPINCHO_LOVERS.pedido(
    pedido_nro decimal(18, 0) not null identity(1, 1),
    pedido_local_id decimal(18, 0) not null,
    pedido_usuario_id decimal(18, 0) not null, 
    pedido_total_productos decimal(18, 2) not null,
    pedido_precio_envio decimal(18, 2) not null, 
    pedido_propina decimal(18, 2) not null,
    pedido_tarifa_servicio decimal(18, 2) not null, 
    pedido_total_cupones decimal(18, 2) not null, 
    pedido_observ nvarchar(255) not null,
    pedido_fecha datetime2(3) not null,
    pedido_fecha_entrega datetime2(3) not null,
    pedido_tiempo_estimado_entrega decimal(18, 2) not null,
    pedido_calificacion decimal(18, 2) not null,
    pedido_tipo_medio_pago decimal(18, 0) not null,
    pedido_medio_pago_id decimal(18, 0),
    pedido_total_servicio decimal(18, 2) not null 
)

create table CARPINCHO_LOVERS.estado_pedido(
    estado_pedido_id decimal(18,0) not null identity(1,1),
    estado_pedido_nro decimal(18,0) not null,
    estado_pedido_estado decimal(18,0) not null,
    estado_pedido_fecha datetime not null
)

create table CARPINCHO_LOVERS.estado_posible_pedido(
    epp_id decimal(18,0) not null identity(1,1),
    epp_descripcion nvarchar(50) not null
)

create table CARPINCHO_LOVERS.reclamo(
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

create table CARPINCHO_LOVERS.reclamo_tipo(
    reclamo_tipo_id decimal(18,0) not null identity(1,1),
    reclamo_tipo_descripcion nvarchar(50)
)

create table CARPINCHO_LOVERS.estado_reclamo(
    estado_reclamo_id decimal(18,0) not null identity(1,1),
    estado_reclamo_nro decimal(18,0) not null,
    estado_reclamo_estado decimal(18,0) not null,
    estado_reclamo_fecha datetime not null
)

create table CARPINCHO_LOVERS.estado_posible_reclamo(
    epr_id decimal(18,0) not null identity(1,1),
    epr_descripcion nvarchar(50) not null
)

create table CARPINCHO_LOVERS.operador_reclamo(
    operador_reclamo_id decimal(18, 0) not null identity(1,1),
    operador_reclamo_nombre nvarchar(255) not null,
    operador_reclamo_apellido nvarchar(255) not null,
    operador_reclamo_dni decimal(18, 0) not null,
    operador_reclamo_telefono decimal(18, 0) not null,
    operador_reclamo_direccion nvarchar(255) not null,
    operador_reclamo_mail nvarchar(255) not null,
    operador_reclamo_fecha_nac date not null
)

create table CARPINCHO_LOVERS.medio_de_pago(
    medio_pago_id decimal(18, 0) not null identity(1,1),
    medio_pago_nro_tarjeta nvarchar(50) not null,
    medio_pago_tipo decimal(18, 0) not null,
    medio_pago_marca_tarjeta decimal(18, 0) not null,
    medio_pago_usuario_id decimal(18, 0) not null
)

create table CARPINCHO_LOVERS.marca_tarjeta(
    marca_tarjeta_id decimal(18, 0) not null identity(1,1),
    marca_tarjeta_nombre nvarchar(50) not null
)

create table CARPINCHO_LOVERS.tipo_medio_de_pago(
    tipo_medio_pago_id decimal(18, 0) not null identity(1,1),
    tipo_medio_pago_descripcion nvarchar(50) not null
)

create table CARPINCHO_LOVERS.producto(
    producto_codigo nvarchar(50) not null,
    producto_nombre nvarchar(50) not null,
    producto_descripcion nvarchar(255)
)

create table CARPINCHO_LOVERS.producto_pedido(
    producto_pedido_producto_id nvarchar(50) not null,
    producto_pedido_local_id decimal(18, 0) not null,
    producto_pedido_codigo decimal(18, 0) not null,
    producto_pedido_cantidad decimal(18, 0) not null,
    producto_precio decimal(18, 2) not null
)

create table CARPINCHO_LOVERS.local_x_producto(
    producto_codigo nvarchar(50) not null,
    local_id decimal(18,0) not null,
    producto_local_precio decimal(18,2)
)

create table CARPINCHO_LOVERS.categoria(
    categoria_id decimal(18,0) not null identity(1,1),
    categoria_nombre nvarchar(100) not null unique,
    categoria_tipo decimal(18,0) not null
)

create table CARPINCHO_LOVERS.tipo_local(
    tipo_local_id decimal(18,0) not null identity(1,1),
    tipo_local_descripcion nvarchar(100)
)

create table CARPINCHO_LOVERS.paquete(
    paquete_id decimal(18, 0) not null identity,
    paquete_tipo_paquete decimal(18, 0) not null
)

create table CARPINCHO_LOVERS.tipo_paquete(
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

create table CARPINCHO_LOVERS.envio_mensajeria(
    envio_mensajeria_nro decimal(18 ,0) not null identity(1, 1),
    envio_mensajeria_direccion_origen decimal(18 ,0) not null,
    envio_mensajeria_direccion_destino decimal(18 ,0) not null,
    envio_mensajeria_km decimal(18 ,2) not null,
    envio_mensajeria_valor_asegurado decimal(18 ,2) not null,
    envio_mensajeria_precio_envio decimal(18 ,2) not null,
    envio_mensajeria_precio_seguro decimal(18 ,2) not null,
    envio_mensajeria_precio_paquete decimal(18 ,2) not null,
    envio_mensajeria_propina decimal(18 ,2) not null,
    envio_mensajeria_total decimal(18 ,2) not null,
    envio_mensajeria_observ nvarchar(255) not null,
    envio_mensajeria_fecha datetime not null,
    envio_mensajeria_fecha_entrega datetime not null,
    envio_mensajeria_tiempo_estimado decimal(18 ,2) not null,
    envio_mensajeria_calificacion decimal(18, 0) not null,
    envio_mensajeria_estado nvarchar(50) not null,
    envio_mensajeria_tipo_medio_pago_id decimal(18 ,0) not null,
    envio_mensajeria_usuario_id decimal(18 ,0) not null,
    envio_mensajeria_repartidor_id decimal(18 ,0) not null,
    envio_mensajeria_paquete_id decimal(18 ,0) not null,
    envio_mensajeria_medio_pago_id decimal(18 ,0) not null
)

create table CARPINCHO_LOVERS.estado_mensajeria(
    estado_mensajeria_id decimal(18,0) not null identity(1,1),
    estado_mensajeria_nro decimal(18,0) not null,
    estado_envio_estado decimal(18,0) not null,
    estado_mensajeria_fecha datetime not null
)

create table CARPINCHO_LOVERS.estado_posible_envio( 
    epe_id decimal(18,0) not null identity(1,1),
    epe_descripcion nvarchar(50) not null
)
go

------------------------------------------------- PRIMARY KEYS -------------------------------------------------

alter table CARPINCHO_LOVERS.usuario add constraint pk_usuario primary key (usuario_id)
alter table CARPINCHO_LOVERS.direccion_usuario add constraint pk_direccion_usuario primary key (direccion_id)
alter table CARPINCHO_LOVERS.medio_de_pago add constraint pk_medio_de_pago primary key (medio_pago_id)
alter table CARPINCHO_LOVERS.marca_tarjeta add constraint pk_marca_tarjeta primary key (marca_tarjeta_id)
alter table CARPINCHO_LOVERS.tipo_medio_de_pago add constraint pk_tipo_medio_de_pago primary key (tipo_medio_pago_id)
alter table CARPINCHO_LOVERS.localidad add constraint pk_localidad primary key (localidad_id)
alter table CARPINCHO_LOVERS.provincia add constraint pk_provincia primary key (provincia_id)
alter table CARPINCHO_LOVERS.local add constraint pk_local primary key (local_id)
alter table CARPINCHO_LOVERS.categoria add constraint pk_categoria primary key (categoria_id)
alter table CARPINCHO_LOVERS.tipo_local add constraint pk_tipo_local primary key (tipo_local_id)
alter table CARPINCHO_LOVERS.dia add constraint pk_dia primary key (dia_id)
alter table CARPINCHO_LOVERS.horario add constraint pk_horario primary key (dia_id, local_id)
alter table CARPINCHO_LOVERS.producto add constraint pk_producto primary key (producto_codigo)
alter table CARPINCHO_LOVERS.local_x_producto add constraint pk_local_x_producto primary key (producto_codigo, local_id)
alter table CARPINCHO_LOVERS.repartidor add constraint pk_repartidor primary key (repartidor_id)
alter table CARPINCHO_LOVERS.movilidad_tipo add constraint pk_movilidad_tipo primary key (movilidad_tipo_id)
alter table CARPINCHO_LOVERS.repartidor_x_localidad add constraint pk_repartidor_x_local primary key (repartidor_id, localidad_id)
alter table CARPINCHO_LOVERS.pedido add constraint pk_pedido primary key (pedido_nro)
alter table CARPINCHO_LOVERS.estado_pedido add constraint pk_estado_pedido primary key (estado_pedido_id)
alter table CARPINCHO_LOVERS.estado_posible_pedido add constraint pk_estado_posible_pedido primary key (epp_id)
alter table CARPINCHO_LOVERS.producto_pedido add constraint pk_producto_pedido primary key (producto_pedido_producto_id, producto_pedido_local_id, producto_pedido_codigo)
alter table CARPINCHO_LOVERS.envio_pedido add constraint pk_envio_pedido primary key (envio_pedido_id)
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


------------------------------------------------- FOREIGN KEYS -------------------------------------------------

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
alter table CARPINCHO_LOVERS.repartidor_x_localidad add constraint fk_repartidor_x_localidad_repartidor foreign key (repartidor_id)
        references CARPINCHO_LOVERS.repartidor (repartidor_id)
alter table CARPINCHO_LOVERS.localidad add constraint fk_repartidor_x_localidad_localidad foreign key (localidad_id)
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
alter table CARPINCHO_LOVERS.envio_pedido add constraint fk_envio_pedido_direccion foreign key (envio_pedido_direccion_id)
        references CARPINCHO_LOVERS.direccion_usuario (direccion_id)
alter table CARPINCHO_LOVERS.envio_pedido add constraint fk_envio_pedido_repartidor foreign key (envio_pedido_repartidor_id)
        references CARPINCHO_LOVERS.repartidor (repartidor_id)
alter table CARPINCHO_LOVERS.pedido add constraint fk_pedido_local foreign key (pedido_local_id)
        references CARPINCHO_LOVERS.local (local_id)
alter table CARPINCHO_LOVERS.pedido add constraint fk_pedido_usuario foreign key (pedido_usuario_id)
        references CARPINCHO_LOVERS.usuario (usuario_id)
alter table CARPINCHO_LOVERS.pedido add constraint fk_pedido_tipo_medio_pago foreign key (pedido_tipo_medio_pago)
        references CARPINCHO_LOVERS.tipo_medio_de_pago (tipo_medio_pago_id)
alter table CARPINCHO_LOVERS.pedido add constraint fk_medio_pago foreign key (pedido_medio_pago_id)
        references CARPINCHO_LOVERS.medio_de_pago (medio_pago_id)
alter table CARPINCHO_LOVERS.envio_pedido add constraint fk_envio_pedido_pedido foreign key (envio_pedido_nro)
        references CARPINCHO_LOVERS.pedido (pedido_nro)
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
        references CARPINCHO_LOVERS.tipo_medio_de_pago (tipo_medio_pago_id)
alter table CARPINCHO_LOVERS.medio_de_pago add constraint fk_medio_de_pago_marca_tarjeta foreign key (medio_pago_marca_tarjeta)
        references CARPINCHO_LOVERS.marca_tarjeta (marca_tarjeta_id)
alter table CARPINCHO_LOVERS.medio_de_pago add constraint fk_medio_de_pago_usuario foreign key (medio_pago_usuario_id)
        references CARPINCHO_LOVERS.usuario (usuario_id)
alter table CARPINCHO_LOVERS.producto_pedido add constraint fk_producto_pedido_producto_y_local foreign key (producto_pedido_producto_id, producto_pedido_local_id)
        references CARPINCHO_LOVERS.local_x_producto (producto_codigo, local_id)
alter table CARPINCHO_LOVERS.producto_pedido add constraint fk_producto_pedido_pedido foreign key (producto_pedido_codigo)
        references CARPINCHO_LOVERS.pedido (pedido_nro)
alter table CARPINCHO_LOVERS.local_x_producto add constraint fk_local_x_producto_producto foreign key (producto_codigo)
        references CARPINCHO_LOVERS.producto (producto_codigo)
alter table CARPINCHO_LOVERS.local_x_producto add constraint fk_local_x_producto_local foreign key (local_id)
        references CARPINCHO_LOVERS.local (local_id)
alter table CARPINCHO_LOVERS.categoria add constraint fk_categoria_tipo foreign key (categoria_tipo)
        references CARPINCHO_LOVERS.tipo_local (tipo_local_id)
alter table CARPINCHO_LOVERS.paquete add constraint fk_paquete_tipo_paquete foreign key (paquete_tipo_paquete)
        references CARPINCHO_LOVERS.tipo_paquete (tipo_paquete_id)
alter table CARPINCHO_LOVERS.envio_mensajeria add constraint fk_envio_mensajeria_dir_orig foreign key (envio_mensajeria_direccion_origen)
        references CARPINCHO_LOVERS.direccion_envio (direccion_envio_id)
alter table CARPINCHO_LOVERS.envio_mensajeria add constraint fk_envio_mensajeria_dir_des foreign key (envio_mensajeria_direccion_destino)
        references CARPINCHO_LOVERS.direccion_envio (direccion_envio_id)
alter table CARPINCHO_LOVERS.envio_mensajeria add constraint fk_envio_mensajeria_tipo_medio_pago_id foreign key (envio_mensajeria_tipo_medio_pago_id)
        references CARPINCHO_LOVERS.tipo_medio_de_pago (tipo_medio_pago_id)
alter table CARPINCHO_LOVERS.envio_mensajeria add constraint fk_envio_mensajeria_usuario foreign key (envio_mensajeria_usuario_id)
        references CARPINCHO_LOVERS.usuario (usuario_id)
alter table CARPINCHO_LOVERS.envio_mensajeria add constraint fk_envio_mensajeria_repartidor foreign key (envio_mensajeria_repartidor_id)
        references CARPINCHO_LOVERS.repartidor (repartidor_id)
alter table CARPINCHO_LOVERS.envio_mensajeria add constraint fk_envio_mensajeria_paquete foreign key (envio_mensajeria_paquete_id)
        references CARPINCHO_LOVERS.paquete (paquete_id)
alter table CARPINCHO_LOVERS.envio_mensajeria add constraint fk_envio_mensajeria_medio_de_pago foreign key (envio_mensajeria_medio_pago_id)
        references CARPINCHO_LOVERS.medio_de_pago (medio_pago_id)
alter table CARPINCHO_LOVERS.estado_mensajeria add constraint fk_estado_mensajeria_nro foreign key (estado_mensajeria_nro)
        references CARPINCHO_LOVERS.envio_mensajeria (envio_mensajeria_nro)
alter table CARPINCHO_LOVERS.estado_mensajeria add constraint fk_estado_envio_estado foreign key (estado_envio_estado)
        references CARPINCHO_LOVERS.estado_posible_envio (epe_id)

go

------------------------------------------------- FUNCIONES -------------------------------------------------

create FUNCTION CARPINCHO_LOVERS.buscar_provincia (@provincia_nombre nvarchar(30)) returns decimal(18,0)
AS
BEGIN
    RETURN
        (
        select provincia_id from CARPINCHO_LOVERS.provincia where provincia_nombre = @provincia_nombre
        )
END

go

create function CARPINCHO_LOVERS.buscar_local (@local_nombre nvarchar(100), @local_descripcion nvarchar(255), @local_direccion nvarchar(255)) returns decimal(18, 0)
AS
BEGIN
    RETURN
    (
        select local_id from CARPINCHO_LOVERS.local where local_nombre = @local_nombre and local_descripcion = @local_descripcion and local_direccion = @local_direccion
    )
END

go

create FUNCTION CARPINCHO_LOVERS.buscar_localidad (@provincia_nombre nvarchar(30), @localidad_nombre nvarchar(50)) returns decimal(18,0)
AS
BEGIN
    RETURN
    (
        select localidad_id from CARPINCHO_LOVERS.localidad join CARPINCHO_LOVERS.provincia on localidad_provincia_id = provincia_id 
        where localidad_nombre = @localidad_nombre and provincia_nombre = @provincia_nombre
    )
end

go

create function CARPINCHO_LOVERS.buscar_usuario (@usuario_dni decimal(18,0), @usuario_nombre nvarchar(255), @usuario_apellido nvarchar(255)) RETURNS decimal(18,0)
AS
BEGIN
    RETURN
    (
        select usuario_id from CARPINCHO_LOVERS.usuario
        where usuario_dni + usuario_nombre + usuario_apellido = @usuario_dni + @usuario_nombre + @usuario_apellido
    )
END 
go

------------------------------------------------- PROCEDURES -------------------------------------------------

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

create proc CARPINCHO_LOVERS.migrar_repartidor as
begin
    insert CARPINCHO_LOVERS.repartidor(repartidor_nombre, repartidor_apellido, repartidor_dni, repartidor_telefono, repartidor_direccion, repartidor_email, repartidor_fecha_nac, repartidor_tipo_movilidad)
    (
        select REPARTIDOR_NOMBRE, REPARTIDOR_APELLIDO, REPARTIDOR_DNI, REPARTIDOR_TELEFONO, REPARTIDOR_DIRECION, REPARTIDOR_EMAIL, REPARTIDOR_FECHA_NAC, (select movilidad_tipo_id from CARPINCHO_LOVERS.tipo_movilidad where movilidad_tipo_descripcion = REPARTIDOR_TIPO_MOVILIDAD)
        from gd_esquema.Maestra
        where REPARTIDOR_NOMBRE is not null
        group by REPARTIDOR_NOMBRE, REPARTIDOR_APELLIDO, REPARTIDOR_DNI, REPARTIDOR_TELEFONO, REPARTIDOR_DIRECION, REPARTIDOR_EMAIL, REPARTIDOR_FECHA_NAC, REPARTIDOR_TIPO_MOVILIDAD -- No se repiten pero seria mas correcto
    )
end

GO

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
            (select tipo_medio_pago_id from tipo_medio_de_pago where tipo_medio_pago_descripcion = te.medio_pago_tipo),
            CARPINCHO_LOVERS.buscar_usuario(USUARIO_DNI, USUARIO_NOMBRE, USUARIO_APELLIDO)
        from gd_esquema.Maestra as te group by USUARIO_DNI, usuario_nombre,usuario_apellido,MEDIO_PAGO_NRO_TARJETA,MEDIO_PAGO_TIPO,MARCA_TARJETA 
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

create proc CARPINCHO_LOVERS.migrar_localidad as
begin
    insert CARPINCHO_LOVERS.localidad(localidad_nombre, localidad_provincia_id)
    (
        select ENVIO_MENSAJERIA_LOCALIDAD,
                CARPINCHO_LOVERS.buscar_provincia(ENVIO_MENSAJERIA_PROVINCIA)
            from gd_esquema.Maestra group by ENVIO_MENSAJERIA_LOCALIDAD, ENVIO_MENSAJERIA_PROVINCIA
        union
        select DIRECCION_USUARIO_LOCALIDAD,
                CARPINCHO_LOVERS.buscar_provincia(DIRECCION_USUARIO_PROVINCIA)
            from gd_esquema.Maestra group by DIRECCION_USUARIO_LOCALIDAD, DIRECCION_USUARIO_PROVINCIA
        union
        select LOCAL_LOCALIDAD,
                CARPINCHO_LOVERS.buscar_provincia( LOCAL_PROVINCIA)
            from gd_esquema.Maestra group by LOCAL_LOCALIDAD, LOCAL_PROVINCIA
    )
end

go

create proc CARPINCHO_LOVERS.migrar_direccion_usuario as
begin
    insert CARPINCHO_LOVERS.direccion_usuario(direccion_usuario_id, direccion_usuario_nombre, direccion_usuario_direccion, direccion_usuario_localidad)
    (
        select 
            CARPINCHO_LOVERS.buscar_usuario(USUARIO_DNI, USUARIO_NOMBRE, USUARIO_APELLIDO),
            DIRECCION_USUARIO_NOMBRE, direccion_usuario_direccion,
            CARPINCHO_LOVERS.buscar_localidad(DIRECCION_USUARIO_LOCALIDAD, DIRECCION_USUARIO_PROVINCIA)
        from gd_esquema.Maestra as te group by usuario_nombre, usuario_apellido, usuario_dni, DIRECCION_USUARIO_NOMBRE, 
        DIRECCION_USUARIO_DIRECCION--, DIRECCION_USUARIO_LOCALIDAD
    )
end
GO

create proc CARPINCHO_LOVERS.migrar_operador_reclamo as
begin
    insert CARPINCHO_LOVERS.operador_reclamo(operador_reclamo_nombre, operador_reclamo_apellido, operador_reclamo_dni, operador_reclamo_telefono, operador_reclamo_direccion, operador_reclamo_mail, operador_reclamo_fecha_nac)
    (
        select OPERADOR_RECLAMO_NOMBRE, OPERADOR_RECLAMO_APELLIDO, OPERADOR_RECLAMO_DNI, OPERADOR_RECLAMO_TELEFONO,
                OPERADOR_RECLAMO_DIRECCION, OPERADOR_RECLAMO_MAIL, OPERADOR_RECLAMO_FECHA_NAC
        from gd_esquema.Maestra
        where OPERADOR_RECLAMO_NOMBRE is not null
        group by OPERADOR_RECLAMO_NOMBRE, OPERADOR_RECLAMO_APELLIDO, OPERADOR_RECLAMO_DNI, OPERADOR_RECLAMO_TELEFONO, OPERADOR_RECLAMO_DIRECCION, OPERADOR_RECLAMO_MAIL, OPERADOR_RECLAMO_FECHA_NAC -- No se repiten pero seria mas correcto
    )
end

GO

create proc CARPINCHO_LOVERS.migrar_dias as
begin
    insert CARPINCHO_LOVERS.dia(dia_nombre)
    (
        select HORARIO_LOCAL_DIA
        from gd_esquema.Maestra
        where HORARIO_LOCAL_DIA is not null
        group by HORARIO_LOCAL_DIA
    )
end

GO

create proc CARPINCHO_LOVERS.migrar_horario as
begin
    insert CARPINCHO_LOVERS.horario(horario_apertura, horario_cierre)
    (
        select HORARIO_LOCAL_HORA_APERTURA, HORARIO_LOCAL_HORA_CIERRE,
            (select dia_id from CARPINCHO_LOVERS.dia where dia_nombre = HORARIO_LOCAL_DIA),
            buscar_local(LOCAL_NOMBRE, LOCAL_DESCRIPCION, LOCAL_DIRECCION)
        from gd_esquema.Maestra
        where HORARIO_LOCAL_HORA_APERTURA is not null and HORARIO_LOCAL_HORA_CIERRE is not null
        group by HORARIO_LOCAL_HORA_APERTURA, HORARIO_LOCAL_HORA_CIERRE
    )
end

GO

create proc CARPINCHO_LOVERS.migrar_cupon as -- FALTA combinar con cupones de reclamo y ver asignacion de cupones (a quien le corresponde)
begin
    insert CARPINCHO_LOVERS.cupon(cupon_nro, cupon_monto, cupon_fecha_alta, cupon_fecha_vencimiento, cupon_tipo, cupon_usuario_id)
    (
        select CUPON_NRO, CUPON_MONTO, CUPON_FECHA_ALTA, CUPON_FECHA_VENCIMIENTO,
            (select cupon_tipo_id from CARPINCHO_LOVERS.tipo_cupon where cupon_tipo_descripcion = CUPON_TIPO),
            buscar_usuario(USUAIRO_DNI, USUARIO_NOMBRE, USUARIO_APELLIDO)
        from gd_esquema.Maestra
        where CUPON_NRO is not null
        group by CUPON_NRO, CUPON_MONTO, CUPON_FECHA_ALTA, CUPON_FECHA_VENCIMIENTO
    )
end

go

create proc CARPINCHO_LOVERS.migrar_cupon_x_pedido as
BEGIN
    insert CARPINCHO_LOVERS.cupon_x_pedido(cupon_nro, pedido_nro)
    (
        select (select cupon_nro from CARPINCHO_LOVERS.cupon where cupon_nro = CUPON_NRO),
            (select pedido_nro from CARPINCHO_LOVERS.pedido where pedido_nro = PEDIDO_NRO)
        from gd_esquema.Maestra
        where CUPON_NRO is not null and PEDIDO_NRO is not null
    )
end

go

--Modelo de procs

-- create proc CARPINCHO_LOVERS.migrar
-- BEGIN
--     insert CARPINCHO_LOVERS.
--     (

--     )
-- end

-- go

create proc CARPINCHO_LOVERS.migrar_productos as
BEGIN
    insert CARPINCHO_LOVERS.producto(producto_codigo, producto_nombre, producto_descripcion)
    (
        select PRODUCTO_LOCAL_CODIGO, PRODUCTO_LOCAL_NOMBRE, PRODUCTO_LOCAL_DESCRIPCION from gd_esquema.Maestra
        group by PRODUCTO_LOCAL_CODIGO, PRODUCTO_LOCAL_NOMBRE, PRODUCTO_LOCAL_DESCRIPCION
    )
end

go

create proc CARPINCHO_LOVERS.migrar_local as
BEGIN
    insert CARPINCHO_LOVERS.local(local_nombre, local_descripcion, local_direccion, local_localidad)
    (
        SELECT LOCAL_NOMBRE ,LOCAL_DESCRIPCION, LOCAL_DIRECCION, buscar_localidad(LOCAL_PROVINCIA, LOCAL_LOCALIDAD)
        from gd_esquema.Maestra group by LOCAL_NOMBRE ,LOCAL_DESCRIPCION, LOCAL_DIRECCION
    )
end

go

create proc CARPINCHO_LOVERS.migrar_local_x_producto as
BEGIN
    insert CARPINCHO_LOVERS.local_x_producto(producto_codigo, local_id, producto_local_precio)
    (
        SELECT PRODUCTO_LOCAL_CODIGO,
            buscar_local(LOCAL_NOMBRE ,LOCAL_DESCRIPCION, LOCAL_DIRECCION),
            producto_local_precio
        from gd_esquema.Maestra group by LOCAL_NOMBRE ,LOCAL_DESCRIPCION, LOCAL_DIRECCION, PRODUCTO_LOCAL_CODIGO
    )
end

go

create proc CARPINCHO_LOVERS.migrar_reclamo as
BEGIN
    insert CARPINCHO_LOVERS.reclamo(reclamo_nro, reclamo_fecha, reclamo_descripcion, reclamo_fecha_solucion, reclamo_solucion, reclamo_calificacion, reclamo_tipo, reclamo_pedido_nro, reclamo_operador_id)
    (
        select RECLAMO_NRO, RECLAMO_FECHA, RECLAMO_DESCRIPCION, RECLAMO_FECHA_SOLUCION, RECLAMO_SOLUCION, RECLAMO_CALIFICACION,
            (select reclamo_tipo_id from CARPINCHO_LOVERS.reclamo_tipo where reclamo_tipo_descripcion = RECLAMO_TIPO),
            (select pedido_nro from CARPINCHO_LOVERS.pedido where pedido_nro = PEDIDO_NRO),
            (select operador_reclamo_id from CARPINCHO_LOVERS.operador_reclamo where operador_reclamo_nombre + operador_reclamo_apellido + operador_reclamo_dni = @operador_nombre + @operador_apellido + @operador_dni)
        from gd_esquema.Maestra
        where RECLAMO_NRO is not null
    )
end

go

-- REPARTIDOR X LOCALIDAD
/*create proc CARPINCHO_LOVERS.migrar_repartidor_x_localidad AS
BEGIN
    insert CARPINCHO_LOVERS.repartidor_x_localidad(localidad_id, es_activa)
    (
        
    )
END*/

go


create proc CARPINCHO_LOVERS.migrar_pedido as
BEGIN
    DECLARE @variable_id_usuario decimal(18,0);
    
    insert CARPINCHO_LOVERS.pedido(pedido_nro, pedido_local_id, pedido_usuario_id, pedido_total_productos, pedido_precio_envio,
        pedido_propina, pedido_tarifa_servicio, pedido_total_cupones, pedido_observ, pedido_fecha,
        pedido_fecha_entrega, pedido_calificacion, pedido_tiempo_estimado_entrega, pedido_calificacion,
        pedido_tipo_medio_pago, pedido_medio_pago_id, pedido_total_servicio)
    (
        select 
        pedido_nro,
        buscar_local(LOCAL_NOMBRE ,LOCAL_DESCRIPCION, LOCAL_DIRECCION),
        buscar_usuario(usuario_dni, usuario_nombre, usuario_apellido),
        pedido_total_productos,
        pedido_precio_envio,
        pedido_propina,
        pedido_tarifa_servicio,
        pedido_total_cupones,
        pedido_observ,
        pedido_fecha,
        pedido_fecha_entrega,
        pedido_calificacion,
        buscar_tipo_medio_de_pago(tipo_medio_de_pago),
        buscar_medio_de_pago(buscar_usuario(usuario_dni, usuario_nombre, usuario_apellido), medio_pago_nro_tarjeta, medio_pago_marca_tarjeta),
        pedido_total_servicio
        from gd_esquema.Maestra group by pedido_nro
    )
end

go

create proc CARPINCHO_LOVERS.migrar_estado_pedido as
BEGIN
    insert CARPINCHO_LOVERS.estado_pedido(estado_pedido_nro, estado_pedido_estado, estado_pedido_fecha)
    (
        select (select pedido_nro from CARPINCHO_LOVERS.pedido where PEDIDO_NRO = pedido_nro),
            (select epp_id from estado_posible_pedido where epp_descripcion = PEDIDO_ESTADO),
            NULL -- CHECKEAR
        from gd.Maestra
        where PEDIDO_NRO is not null and PEDIDO_ESTADO is not null
    )
end

go

create proc CARPINCHO_LOVERS.migrar_estado_envio_mensajeria as
BEGIN
    insert CARPINCHO_LOVERS.estado_mensajeria(estado_mensajeria_nro, estado_envio_estado, estado_mensajeria_fecha)
    (
        select (select envio_mensajeria_nro from CARPINCHO_LOVERS.envio_mensajeria where ENVIO_MENSAJERIA_NRO = envio_mensajeria_nro),
            (select epe_id from estado_posible_envio where epe_descripcion = ENVIO_MENSAJERIA_ESTADO),
            NULL -- CHECKEAR
        from gd.Maestra
        where ENVIO_MENSAJERIA_NRO is not null and ENVIO_MENSAJERIA_ESTADO is not null
    )
end

go

create proc CARPINCHO_LOVERS.migrar_estado_reclamo as
BEGIN
    insert CARPINCHO_LOVERS.estado_reclamo(estado_reclamo_nro, estado_reclamo_estado, estado_reclamo_fecha)
    (
        select (select reclamo_nro from CARPINCHO_LOVERS.reclamo where RECLAMO_NRO = reclamo_nro),
            (select epr_id from estado_posible_reclamo where epr_descripcion = RECLAMO_ESTADO),
            NULL -- CHECKEAR
        from gd.Maestra
        where RECLAMO_NRO is not null and RECLAMO_ESTADO is not null
    )
end

go

create proc CARPINCHO_LOVERS.migrar_producto_x_pedido as
BEGIN
    insert CARPINCHO_LOVERS.producto_x_pedido(producto_pedido_producto_id, producto_pedido_local_id, producto_pedido_codigo,
        producto_pedido_cantidad, producto_precio)
    (
        SELECT 
        (select producto_local_codigo from CARPINCHO_LOVERS.local_x_producto where producto_local_codigo = PRODUCTO_LOCAL_CODIGO),
        buscar_local(LOCAL_NOMBRE, LOCAL_DESCRIPCION, LOCAL_DIRECCION),
        (select pedido_nro from CARPINCHO_LOVERS.pedido where pedido_nro = PEDIDO_NRO)
        PRODUCTO_CANTIDAD,
        PRODUCTO_LOCAL_PRECIO
        from gd_esquema.Maestra
        where PRODUCTO_LOCAL_CODIGO is not null
        Group by LOCAL_NOMBRE, LOCAL_DESCRIPCION, LOCAL_DIRECCION, PRODUCTO_LOCAL_CODIGO, PEDIDO_NRO
    )
END

GO

create proc CARPINCHO_LOVERS.migrar_envio_pedido AS
BEGIN
    insert CARPINCHO_LOVERS.envio_pedido(envio_pedido_direccion_id, envio_pedido_repartidor_id, envio_pedido_nro)
    SELECT (select ),
    (select repartidor_id from CARPINCHO_LOVERS.repartidor where repartidor_dni + repartidor_nombre + repartidor_apellido = REPARTIDOR_DNI + REPARTIDOR_NOMBRE + REPARTIDOR_APELLIDO),
    (select pedido_nro from CARPINCHO_LOVERS.pedido where pedido_nro = PEDIDO_NRO)
    from gd_esquema.Maestra
END