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
    usuario_fecha_registro datetime2(3) not null
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
    movilidad_tipo_descripcion nvarchar(50) not null
)

create table CARPINCHO_LOVERS.direccion_usuario(
    direccion_id decimal(18, 0) not null identity(1, 1),
    direccion_usuario_id decimal(18, 0) not null,
    direccion_usuario_nombre nvarchar(50) not null,
    direccion_usuario_direccion nvarchar(255) not null,
    direccion_usuario_localidad_id decimal(18, 0) not null
)

create table CARPINCHO_LOVERS.cupon(
    cupon_nro decimal(18, 0) not null,
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
    localidad_nombre nvarchar(255) not null,
    localidad_provincia_id decimal(18, 0) not null
)

create table CARPINCHO_LOVERS.provincia(
    provincia_id decimal(18, 0) not null identity(1, 1),
    provincia_nombre nvarchar(255) not null
)

create table CARPINCHO_LOVERS.local(
    local_id decimal(18, 0) not null identity(1, 1),
    local_nombre nvarchar(100) not null,
    local_descripcion nvarchar(255) not null,
    local_direccion nvarchar(255) not null,
    local_localidad decimal(18, 0) not null,
    local_categoria decimal(18, 0),
    local_tipo decimal(18,0) not null
)

create table CARPINCHO_LOVERS.horario(
    horario_id decimal(18, 0) not null identity(1, 1),
    horario_dia_id decimal(18, 0) not null,
    horario_local_id decimal(18, 0) not null,
    horario_apertura decimal(18, 0) not null,
    horario_cierre decimal(18, 0) not null
)

create table CARPINCHO_LOVERS.dia(
    dia_id decimal(18, 0) not null identity(1, 1),
    dia_nombre nvarchar(50) not null
)

create table CARPINCHO_LOVERS.envio_pedido(
    envio_pedido_id decimal(18, 0) not null identity(1, 1),
    envio_pedido_direccion_id decimal(18, 0) not null,
    envio_pedido_repartidor_id decimal(18, 0) not null,
    envio_pedido_nro decimal(18, 0) not null
)

create table CARPINCHO_LOVERS.pedido(
    pedido_nro decimal(18, 0) not null,
    pedido_local_id decimal(18, 0) not null,
    pedido_usuario_id decimal(18, 0) not null, 
    pedido_total_productos decimal(18, 2) not null,
    pedido_precio_envio decimal(18, 2) not null, 
    pedido_propina decimal(18, 2) not null,
    pedido_tarifa_servicio decimal(18, 2) not null, 
    pedido_total_cupones decimal(18, 2) not null, 
    pedido_observ nvarchar(255) not null,
    pedido_fecha datetime not null,
    pedido_fecha_entrega datetime not null,
    pedido_tiempo_estimado_entrega decimal(18, 2) not null,
    pedido_calificacion decimal(18, 0) not null,
    pedido_tipo_medio_pago decimal(18, 0) not null,
    pedido_medio_pago_id decimal(18, 0),
    pedido_total_servicio decimal(18, 2) not null,
    pedido_estado decimal(18,0) not null
)

create table CARPINCHO_LOVERS.trazabilidad_pedido(
    trazabilidad_pedido_id decimal(18,0) not null identity(1,1),
    trazabilidad_pedido_nro decimal(18,0) not null,
    trazabilidad_pedido_estado decimal(18,0) not null,
    trazabilidad_pedido_fecha datetime not null
)

create table CARPINCHO_LOVERS.estado_pedido(
    estado_pedido_id decimal(18,0) not null identity(1,1),
    estado_pedido_descripcion nvarchar(50) not null
)

create table CARPINCHO_LOVERS.reclamo(
    reclamo_nro decimal(18, 0) not null,
    reclamo_fecha datetime not null,
    reclamo_descripcion nvarchar(255) not null,
    reclamo_fecha_solucion datetime not null,
    reclamo_solucion nvarchar(255) not null,
    reclamo_calificacion decimal(18, 0) not null,
    reclamo_estado decimal(18, 0) not null,
    reclamo_tipo decimal(18, 0) not null,
    reclamo_pedido_nro decimal(18, 0) not null,
    reclamo_operador_id decimal(18, 0) not null
)

create table CARPINCHO_LOVERS.reclamo_tipo(
    reclamo_tipo_id decimal(18,0) not null identity(1,1),
    reclamo_tipo_descripcion nvarchar(50) not null
)

create table CARPINCHO_LOVERS.trazabilidad_reclamo(
    trazabilidad_reclamo_id decimal(18,0) not null identity(1,1),
    trazabilidad_reclamo_nro decimal(18,0) not null,
    trazabilidad_reclamo_estado decimal(18,0) not null,
    trazabilidad_reclamo_fecha datetime not null
)

create table CARPINCHO_LOVERS.estado_reclamo(
    estado_reclamo_id decimal(18,0) not null identity(1,1),
    estado_reclamo_descripcion nvarchar(50) not null
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
    marca_tarjeta_nombre nvarchar(100) not null
)

create table CARPINCHO_LOVERS.tipo_medio_de_pago(
    tipo_medio_pago_id decimal(18, 0) not null identity(1,1),
    tipo_medio_pago_descripcion nvarchar(50) not null
)

create table CARPINCHO_LOVERS.producto(
    producto_codigo nvarchar(50) not null,
    producto_nombre nvarchar(50) not null,
    producto_descripcion nvarchar(255) not null
)

create table CARPINCHO_LOVERS.producto_x_pedido(
    producto_pedido_producto_id nvarchar(50) not null,
    producto_pedido_local_id decimal(18, 0) not null,
    producto_pedido_codigo decimal(18, 0) not null,
    producto_pedido_cantidad decimal(18, 0) not null,
    producto_precio decimal(18, 2) not null
)

create table CARPINCHO_LOVERS.local_x_producto(
    producto_codigo nvarchar(50) not null,
    local_id decimal(18,0) not null,
    producto_local_precio decimal(18,2) not null
)

create table CARPINCHO_LOVERS.categoria(
    categoria_id decimal(18,0) not null identity(1,1),
    categoria_nombre nvarchar(100) not null unique,
    categoria_tipo decimal(18,0) not null
)

create table CARPINCHO_LOVERS.tipo_local(
    tipo_local_id decimal(18,0) not null identity(1,1),
    tipo_local_descripcion nvarchar(100) not null
)

create table CARPINCHO_LOVERS.paquete(
    paquete_id decimal(18, 0) not null identity,
    paquete_tipo_paquete decimal(18, 0) not null,
    paquete_envio_mensajeria_nro decimal(18, 0) not null
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

create table CARPINCHO_LOVERS.envio_mensajeria(
    envio_mensajeria_nro decimal(18 ,0) not null,
    envio_mensajeria_localidad_origen decimal(18 ,0) not null,
    envio_mensajeria_localidad_destino decimal(18 ,0) not null,
    envio_mensajeria_direccion_origen nvarchar(255) not null,
    envio_mensajeria_direccion_destino nvarchar(255) not null,
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
    envio_mensajeria_tipo_medio_pago_id decimal(18 ,0) not null,
    envio_mensajeria_usuario_id decimal(18 ,0) not null,
    envio_mensajeria_repartidor_id decimal(18 ,0) not null,
    envio_mensajeria_medio_pago_id decimal(18 ,0) not null,
    envio_mensajeria_estado decimal(18, 0) not null
)

create table CARPINCHO_LOVERS.trazabilidad_envio_mensajeria(
    trazabilidad_mensajeria_id decimal(18,0) not null identity(1,1),
    trazabilidad_mensajeria_nro decimal(18,0) not null,
    trazabilidad_mensajeria_estado decimal(18,0) not null,
    trazabilidad_mensajeria_fecha datetime not null
)

create table CARPINCHO_LOVERS.estado_envio_mensajeria( 
    estado_mensajeria_id decimal(18,0) not null identity(1,1),
    estado_mensajeria_descripcion nvarchar(50) not null
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
alter table CARPINCHO_LOVERS.horario add constraint pk_horario primary key (horario_id)
alter table CARPINCHO_LOVERS.producto add constraint pk_producto primary key (producto_codigo)
alter table CARPINCHO_LOVERS.local_x_producto add constraint pk_local_x_producto primary key (producto_codigo, local_id)
alter table CARPINCHO_LOVERS.repartidor add constraint pk_repartidor primary key (repartidor_id)
alter table CARPINCHO_LOVERS.movilidad_tipo add constraint pk_movilidad_tipo primary key (movilidad_tipo_id)
alter table CARPINCHO_LOVERS.repartidor_x_localidad add constraint pk_repartidor_x_local primary key (repartidor_id, localidad_id)
alter table CARPINCHO_LOVERS.pedido add constraint pk_pedido primary key (pedido_nro)
alter table CARPINCHO_LOVERS.trazabilidad_pedido add constraint pk_trazabilidad_pedido primary key (trazabilidad_pedido_id)
alter table CARPINCHO_LOVERS.estado_pedido add constraint pk_estado_pedido primary key (estado_pedido_id)
alter table CARPINCHO_LOVERS.producto_x_pedido add constraint pk_producto_pedido primary key (producto_pedido_producto_id, producto_pedido_local_id, producto_pedido_codigo)
alter table CARPINCHO_LOVERS.envio_pedido add constraint pk_envio_pedido primary key (envio_pedido_id)
alter table CARPINCHO_LOVERS.reclamo add constraint pk_reclamo primary key (reclamo_nro)
alter table CARPINCHO_LOVERS.trazabilidad_reclamo add constraint pk_trazabilidad_reclamo primary key (trazabilidad_reclamo_id)
alter table CARPINCHO_LOVERS.estado_reclamo add constraint pk_estado_reclamo primary key (estado_reclamo_id)
alter table CARPINCHO_LOVERS.reclamo_tipo add constraint pk_reclamo_tipo primary key (reclamo_tipo_id)
alter table CARPINCHO_LOVERS.operador_reclamo add constraint pk_operador_reclamo primary key (operador_reclamo_id)
alter table CARPINCHO_LOVERS.envio_mensajeria add constraint pk_envio_mensajeria primary key (envio_mensajeria_nro)
alter table CARPINCHO_LOVERS.trazabilidad_envio_mensajeria add constraint pk_trazabilidad_mensajeria primary key (trazabilidad_mensajeria_id)
alter table CARPINCHO_LOVERS.estado_envio_mensajeria add constraint pk_estado_mensajeria primary key (estado_mensajeria_id)
alter table CARPINCHO_LOVERS.paquete add constraint pk_paquete primary key (paquete_id)
alter table CARPINCHO_LOVERS.tipo_paquete add constraint pk_tipo_paquete primary key (tipo_paquete_id)
alter table CARPINCHO_LOVERS.cupon add constraint pk_cupon primary key (cupon_nro)
alter table CARPINCHO_LOVERS.cupon_tipo add constraint pk_cupon_tipo primary key (cupon_tipo_id)
alter table CARPINCHO_LOVERS.cupon_x_pedido add constraint pk_cupon_x_pedido primary key (cupon_nro, pedido_nro)
alter table CARPINCHO_LOVERS.cupon_reclamo add constraint pk_cupon_reclamo primary key (cupon_reclamo_reclamo_nro, cupon_reclamo_nro)


------------------------------------------------- FOREIGN KEYS -------------------------------------------------

alter table CARPINCHO_LOVERS.direccion_usuario add constraint fk_direccion_usuario_usuario foreign key (direccion_usuario_id)
        references CARPINCHO_LOVERS.usuario (usuario_id)
alter table CARPINCHO_LOVERS.direccion_usuario add constraint fk_direccion_usuario_localidad_id foreign key (direccion_usuario_localidad_id)
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
alter table CARPINCHO_LOVERS.local add constraint fk_local_localidad foreign key (local_localidad)
        references CARPINCHO_LOVERS.localidad (localidad_id)
alter table CARPINCHO_LOVERS.local add constraint fk_local_categoria foreign key (local_categoria)
        references CARPINCHO_LOVERS.categoria (categoria_id)
alter table CARPINCHO_LOVERS.horario add constraint fk_horario_dia foreign key (horario_dia_id)
        references CARPINCHO_LOVERS.dia (dia_id)
alter table CARPINCHO_LOVERS.horario add constraint fk_horario_local foreign key (horario_local_id)
        references CARPINCHO_LOVERS.local (local_id)
alter table CARPINCHO_LOVERS.local add constraint fk_local_tipo foreign key (local_tipo)
        references CARPINCHO_LOVERS.tipo_local (tipo_local_id)
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
alter table CARPINCHO_LOVERS.pedido add constraint fk_pedido_estado_pedido foreign key (pedido_estado)
        references CARPINCHO_LOVERS.estado_pedido (estado_pedido_id)
alter table CARPINCHO_LOVERS.envio_pedido add constraint fk_envio_pedido_pedido foreign key (envio_pedido_nro)
        references CARPINCHO_LOVERS.pedido (pedido_nro)
alter table CARPINCHO_LOVERS.trazabilidad_pedido add constraint fk_trazabilidad_pedido_pedido foreign key (trazabilidad_pedido_nro)
        references CARPINCHO_LOVERS.pedido (pedido_nro)
alter table CARPINCHO_LOVERS.trazabilidad_pedido add constraint fk_trazabilidad_pedido_estado foreign key (trazabilidad_pedido_estado)
        references CARPINCHO_LOVERS.estado_pedido (estado_pedido_id)
alter table CARPINCHO_LOVERS.reclamo add constraint fk_reclamo_estado foreign key (reclamo_estado)
        references CARPINCHO_LOVERS.estado_reclamo (estado_reclamo_id)        
alter table CARPINCHO_LOVERS.reclamo add constraint fk_reclamo_tipo foreign key (reclamo_tipo)
        references CARPINCHO_LOVERS.reclamo_tipo (reclamo_tipo_id)
alter table CARPINCHO_LOVERS.reclamo add constraint fk_reclamo_pedido foreign key (reclamo_pedido_nro)
        references CARPINCHO_LOVERS.pedido (pedido_nro)
alter table CARPINCHO_LOVERS.reclamo add constraint fk_reclamo_operador foreign key (reclamo_operador_id)
        references CARPINCHO_LOVERS.operador_reclamo (operador_reclamo_id)
alter table CARPINCHO_LOVERS.trazabilidad_reclamo add constraint fk_trazabilidad_reclamo foreign key (trazabilidad_reclamo_nro)
        references CARPINCHO_LOVERS.reclamo (reclamo_nro)
alter table CARPINCHO_LOVERS.trazabilidad_reclamo add constraint fk_trazabilidad_reclamo_estado foreign key (trazabilidad_reclamo_estado)
        references CARPINCHO_LOVERS.estado_reclamo (estado_reclamo_id)
alter table CARPINCHO_LOVERS.medio_de_pago add constraint fk_medio_de_pago_tipo foreign key (medio_pago_tipo)
        references CARPINCHO_LOVERS.tipo_medio_de_pago (tipo_medio_pago_id)
alter table CARPINCHO_LOVERS.medio_de_pago add constraint fk_medio_de_pago_marca_tarjeta foreign key (medio_pago_marca_tarjeta)
        references CARPINCHO_LOVERS.marca_tarjeta (marca_tarjeta_id)
alter table CARPINCHO_LOVERS.medio_de_pago add constraint fk_medio_de_pago_usuario foreign key (medio_pago_usuario_id)
        references CARPINCHO_LOVERS.usuario (usuario_id)
alter table CARPINCHO_LOVERS.producto_x_pedido add constraint fk_producto_pedido_producto_y_local foreign key (producto_pedido_producto_id, producto_pedido_local_id)
        references CARPINCHO_LOVERS.local_x_producto (producto_codigo, local_id)
alter table CARPINCHO_LOVERS.producto_x_pedido add constraint fk_producto_pedido_pedido foreign key (producto_pedido_codigo)
        references CARPINCHO_LOVERS.pedido (pedido_nro)
alter table CARPINCHO_LOVERS.local_x_producto add constraint fk_local_x_producto_producto foreign key (producto_codigo)
        references CARPINCHO_LOVERS.producto (producto_codigo)
alter table CARPINCHO_LOVERS.local_x_producto add constraint fk_local_x_producto_local foreign key (local_id)
        references CARPINCHO_LOVERS.local (local_id)
alter table CARPINCHO_LOVERS.categoria add constraint fk_categoria_tipo foreign key (categoria_tipo)
        references CARPINCHO_LOVERS.tipo_local (tipo_local_id)
alter table CARPINCHO_LOVERS.paquete add constraint fk_paquete_tipo_paquete foreign key (paquete_tipo_paquete)
        references CARPINCHO_LOVERS.tipo_paquete (tipo_paquete_id)
alter table CARPINCHO_LOVERS.envio_mensajeria add constraint fk_envio_mensajeria_localidad_orig foreign key (envio_mensajeria_localidad_origen)
        references CARPINCHO_LOVERS.localidad (localidad_id)
alter table CARPINCHO_LOVERS.envio_mensajeria add constraint fk_envio_mensajeria_localidad_des foreign key (envio_mensajeria_localidad_destino)
        references CARPINCHO_LOVERS.localidad (localidad_id)
alter table CARPINCHO_LOVERS.envio_mensajeria add constraint fk_envio_mensajeria_tipo_medio_pago_id foreign key (envio_mensajeria_tipo_medio_pago_id)
        references CARPINCHO_LOVERS.tipo_medio_de_pago (tipo_medio_pago_id)
alter table CARPINCHO_LOVERS.envio_mensajeria add constraint fk_envio_mensajeria_usuario foreign key (envio_mensajeria_usuario_id)
        references CARPINCHO_LOVERS.usuario (usuario_id)
alter table CARPINCHO_LOVERS.envio_mensajeria add constraint fk_envio_mensajeria_repartidor foreign key (envio_mensajeria_repartidor_id)
        references CARPINCHO_LOVERS.repartidor (repartidor_id)
alter table CARPINCHO_LOVERS.paquete add constraint fk_paquete_envio_mensajeria foreign key (paquete_envio_mensajeria_nro)
        references CARPINCHO_LOVERS.envio_mensajeria (envio_mensajeria_nro)
alter table CARPINCHO_LOVERS.envio_mensajeria add constraint fk_envio_mensajeria_medio_de_pago foreign key (envio_mensajeria_medio_pago_id)
        references CARPINCHO_LOVERS.medio_de_pago (medio_pago_id)
alter table CARPINCHO_LOVERS.envio_mensajeria add constraint fk_envio_mensajeria_estado foreign key (envio_mensajeria_estado)
        references CARPINCHO_LOVERS.estado_envio_mensajeria (estado_mensajeria_id)
alter table CARPINCHO_LOVERS.trazabilidad_envio_mensajeria add constraint fk_trazabilidad_envio_mensajeria_nro foreign key (trazabilidad_mensajeria_nro)
        references CARPINCHO_LOVERS.envio_mensajeria (envio_mensajeria_nro)
alter table CARPINCHO_LOVERS.trazabilidad_envio_mensajeria add constraint fk_trazabilidad_mensajeria_estado foreign key (trazabilidad_mensajeria_estado)
        references CARPINCHO_LOVERS.estado_envio_mensajeria (estado_mensajeria_id)

go

------------------------------------------------- FUNCIONES -------------------------------------------------

create FUNCTION CARPINCHO_LOVERS.buscar_provincia (@provincia_nombre nvarchar(255)) returns decimal(18,0)
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

create FUNCTION CARPINCHO_LOVERS.buscar_localidad (@provincia_nombre nvarchar(255), @localidad_nombre nvarchar(255)) returns decimal(18,0)
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
        where usuario_dni = @usuario_dni and usuario_nombre + usuario_apellido = @usuario_nombre + @usuario_apellido
    )
END 
go

create function CARPINCHO_LOVERS.buscar_estado_envio_mensajeria (@estado nvarchar(50)) RETURNS decimal(18,0)
AS
BEGIN
    RETURN
    (
        select estado_mensajeria_id from CARPINCHO_LOVERS.estado_envio_mensajeria
        where estado_mensajeria_descripcion = @estado
    )
END 

go

create function CARPINCHO_LOVERS.buscar_estado_pedido (@estado nvarchar(50)) RETURNS decimal(18,0)
AS
BEGIN
    RETURN
    (
        select estado_pedido_id from CARPINCHO_LOVERS.estado_pedido
        where estado_pedido_descripcion = @estado
    )
END 

go

create function CARPINCHO_LOVERS.buscar_estado_reclamo (@estado nvarchar(50)) RETURNS decimal(18,0)
AS
BEGIN
    RETURN
    (
        select estado_reclamo_id from CARPINCHO_LOVERS.estado_reclamo
        where estado_reclamo_descripcion = @estado
    )
END

GO

CREATE function CARPINCHO_LOVERS.buscar_medio_de_pago(@usuario_id decimal(18,0), @tarjeta_nro nvarchar(50), @tarjeta_marca nvarchar(100)) RETURNS decimal(18,0)
AS
BEGIN
    RETURN
    (
        select medio_pago_id from CARPINCHO_LOVERS.medio_de_pago
        where medio_pago_nro_tarjeta = @tarjeta_nro and medio_pago_marca_tarjeta = CARPINCHO_LOVERS.buscar_marca_tarjeta(@tarjeta_marca) and medio_pago_usuario_id = @usuario_id
    )
END
go

CREATE function CARPINCHO_LOVERS.buscar_tipo_medio_de_pago(@medio_pago nvarchar(50)) RETURNS decimal(18,0)
AS
BEGIN
    RETURN
    (
        select tipo_medio_pago_id from CARPINCHO_LOVERS.tipo_medio_de_pago where tipo_medio_pago_descripcion = @medio_pago
    )
END
go

CREATE function CARPINCHO_LOVERS.buscar_marca_tarjeta(@marca_tarjeta nvarchar(100)) RETURNS decimal(18,0)
AS
BEGIN
    RETURN
    (
        select marca_tarjeta_id from CARPINCHO_LOVERS.marca_tarjeta where marca_tarjeta_nombre = @marca_tarjeta
    )
END

go

CREATE function CARPINCHO_LOVERS.buscar_tipo_cupon(@cupon_tipo nvarchar(100)) RETURNS decimal(18,0)
AS
BEGIN
    RETURN
    (
        select cupon_tipo_id from CARPINCHO_LOVERS.cupon_tipo where cupon_tipo_descripcion = @cupon_tipo
    )
END

go

CREATE function CARPINCHO_LOVERS.buscar_tipo_local(@local_descripcion nvarchar(100)) RETURNS decimal(18,0)
AS
BEGIN
    RETURN
    (
        select tipo_local_id from CARPINCHO_LOVERS.tipo_local where tipo_local_descripcion = @local_descripcion
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

create proc CARPINCHO_LOVERS.migrar_direccion_usuario as
begin
    insert CARPINCHO_LOVERS.direccion_usuario(direccion_usuario_id, direccion_usuario_nombre, direccion_usuario_direccion, direccion_usuario_localidad_id)
    (
        select 
            CARPINCHO_LOVERS.buscar_usuario(USUARIO_DNI, USUARIO_NOMBRE, USUARIO_APELLIDO),
            DIRECCION_USUARIO_NOMBRE, DIRECCION_USUARIO_DIRECCION,
            CARPINCHO_LOVERS.buscar_localidad(DIRECCION_USUARIO_PROVINCIA, DIRECCION_USUARIO_LOCALIDAD)
        from gd_esquema.Maestra where DIRECCION_USUARIO_LOCALIDAD is not null
        group by USUARIO_NOMBRE, USUARIO_APELLIDO, USUARIO_DNI, DIRECCION_USUARIO_NOMBRE, 
            DIRECCION_USUARIO_DIRECCION, DIRECCION_USUARIO_LOCALIDAD, DIRECCION_USUARIO_PROVINCIA
    )
end
go

create proc CARPINCHO_LOVERS.migrar_localidad as
begin
    insert CARPINCHO_LOVERS.localidad(localidad_nombre, localidad_provincia_id)
    (
        select ENVIO_MENSAJERIA_LOCALIDAD,
                CARPINCHO_LOVERS.buscar_provincia(ENVIO_MENSAJERIA_PROVINCIA)
            from gd_esquema.Maestra 
			where ENVIO_MENSAJERIA_LOCALIDAD is not null
			group by ENVIO_MENSAJERIA_LOCALIDAD, ENVIO_MENSAJERIA_PROVINCIA
        union
        select DIRECCION_USUARIO_LOCALIDAD,
                CARPINCHO_LOVERS.buscar_provincia(DIRECCION_USUARIO_PROVINCIA)
            from gd_esquema.Maestra 
			where DIRECCION_USUARIO_LOCALIDAD is not null
			group by DIRECCION_USUARIO_LOCALIDAD, DIRECCION_USUARIO_PROVINCIA
        union
        select LOCAL_LOCALIDAD,
                CARPINCHO_LOVERS.buscar_provincia( LOCAL_PROVINCIA)
            from gd_esquema.Maestra 
			where LOCAL_LOCALIDAD is not null
			group by LOCAL_LOCALIDAD, LOCAL_PROVINCIA
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


create proc CARPINCHO_LOVERS.migrar_medio_de_pago as
begin
    insert CARPINCHO_LOVERS.medio_de_pago(medio_pago_nro_tarjeta, medio_pago_tipo, medio_pago_marca_tarjeta, medio_pago_usuario_id)
    (
        select MEDIO_PAGO_NRO_TARJETA,
			CARPINCHO_LOVERS.buscar_tipo_medio_de_pago(MEDIO_PAGO_TIPO),
            CARPINCHO_LOVERS.buscar_marca_tarjeta(MARCA_TARJETA),
            CARPINCHO_LOVERS.buscar_usuario(USUARIO_DNI, USUARIO_NOMBRE, USUARIO_APELLIDO)
        from gd_esquema.Maestra as te group by USUARIO_DNI, usuario_nombre, usuario_apellido, MEDIO_PAGO_NRO_TARJETA,MEDIO_PAGO_TIPO,MARCA_TARJETA 
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

create proc CARPINCHO_LOVERS.migrar_marca_tarjeta as
begin
    insert CARPINCHO_LOVERS.marca_tarjeta(marca_tarjeta_nombre)
    (
        select marca_tarjeta from gd_esquema.Maestra group by marca_tarjeta
    )
end
go

create proc CARPINCHO_LOVERS.migrar_repartidor as
begin
    insert CARPINCHO_LOVERS.repartidor(repartidor_nombre, repartidor_apellido, repartidor_dni, repartidor_telefono, repartidor_direccion, repartidor_email, repartidor_fecha_nac, repartidor_tipo_movilidad)
    (
        select REPARTIDOR_NOMBRE, REPARTIDOR_APELLIDO, REPARTIDOR_DNI, REPARTIDOR_TELEFONO, REPARTIDOR_DIRECION, REPARTIDOR_EMAIL, REPARTIDOR_FECHA_NAC, (select movilidad_tipo_id from CARPINCHO_LOVERS.movilidad_tipo where movilidad_tipo_descripcion = REPARTIDOR_TIPO_MOVILIDAD)
        from gd_esquema.Maestra
        where REPARTIDOR_NOMBRE is not null
        group by REPARTIDOR_NOMBRE, REPARTIDOR_APELLIDO, REPARTIDOR_DNI, REPARTIDOR_TELEFONO, REPARTIDOR_DIRECION, REPARTIDOR_EMAIL, REPARTIDOR_FECHA_NAC, REPARTIDOR_TIPO_MOVILIDAD -- No se repiten pero seria mas correcto
    )
end

go

/*
Para cada repartidor se fija si su ultima fecha de entrega de un pedido es menor que su ultima fecha de entrega
de un envio de mensajeria y en funcion de cual de los dos sea el ultimo busca lo localidad correspondiente.
*/
create proc CARPINCHO_LOVERS.migrar_repartidor_x_localidad as
begin
    insert CARPINCHO_LOVERS.repartidor_x_localidad(repartidor_id, localidad_id, es_activa)
    (
        select 
            repartidor_id,
            case 
                when  (SELECT max([PEDIDO_FECHA_ENTREGA]) FROM [gd_esquema].[Maestra] 
                    as ti where ti.[REPARTIDOR_NOMBRE] + ti.[REPARTIDOR_APELLIDO] =
                    te.repartidor_nombre + te.repartidor_apellido and  + ti.[REPARTIDOR_DNI] = te.repartidor_dni AND [PEDIDO_FECHA_ENTREGA] IS NOT NULL) >= 
                    (SELECT max([ENVIO_MENSAJERIA_FECHA_ENTREGA]) FROM [gd_esquema].[Maestra] 
                    as ti where ti.[REPARTIDOR_NOMBRE] + ti.[REPARTIDOR_APELLIDO] =
                    te.repartidor_nombre + te.repartidor_apellido and ti.[REPARTIDOR_DNI] = te.repartidor_dni AND [ENVIO_MENSAJERIA_FECHA_ENTREGA] IS NOT NULL)
                        then 
                    (select top 1 CARPINCHO_LOVERS.buscar_localidad(LOCAL_PROVINCIA, LOCAL_LOCALIDAD) FROM [GD1C2023].[gd_esquema].[Maestra] as ti
                        where ti.[REPARTIDOR_NOMBRE]+ti.[REPARTIDOR_APELLIDO] = te.[REPARTIDOR_NOMBRE]+te.[REPARTIDOR_APELLIDO] and ti.[REPARTIDOR_DNI] = te.[REPARTIDOR_DNI]
                        order by [PEDIDO_FECHA_ENTREGA] desc)

                else
                    (select top 1 CARPINCHO_LOVERS.buscar_localidad([ENVIO_MENSAJERIA_PROVINCIA], [ENVIO_MENSAJERIA_LOCALIDAD]) FROM [GD1C2023].[gd_esquema].[Maestra] as ti
                        where ti.[REPARTIDOR_NOMBRE]+ti.[REPARTIDOR_APELLIDO] = te.[REPARTIDOR_NOMBRE]+te.[REPARTIDOR_APELLIDO] and ti.[REPARTIDOR_DNI] = te.[REPARTIDOR_DNI]
                        order by [ENVIO_MENSAJERIA_FECHA_ENTREGA] desc)
				end,
            1
                
        from CARPINCHO_LOVERS.repartidor as te
    )
end


go

create proc CARPINCHO_LOVERS.migrar_tipo_movilidad as
begin
    insert CARPINCHO_LOVERS.movilidad_tipo(movilidad_tipo_descripcion)
    (
        select REPARTIDOR_TIPO_MOVILIDAD from gd_esquema.Maestra group by REPARTIDOR_TIPO_MOVILIDAD
    )
end
go

create proc CARPINCHO_LOVERS.migrar_cupon as
begin
    insert CARPINCHO_LOVERS.cupon(cupon_nro, cupon_monto, cupon_fecha_alta, cupon_fecha_vencimiento, cupon_tipo, cupon_usuario_id)
    (
       select CUPON_NRO, CUPON_MONTO, CUPON_FECHA_ALTA, CUPON_FECHA_VENCIMIENTO,
            CARPINCHO_LOVERS.buscar_tipo_cupon(CUPON_TIPO),
            CARPINCHO_LOVERS.buscar_usuario(USUARIO_DNI, USUARIO_NOMBRE, USUARIO_APELLIDO)
        from gd_esquema.Maestra
        where CUPON_NRO is not null
        group by CUPON_NRO, CUPON_MONTO, CUPON_FECHA_ALTA, CUPON_FECHA_VENCIMIENTO,
             CUPON_TIPO, USUARIO_DNI, USUARIO_NOMBRE, USUARIO_APELLIDO
    )
end
go


create proc CARPINCHO_LOVERS.migrar_cupon_reclamo as
begin
    --Primero migramos los cupones de reclamo que no aun no fueron utilizados (osea que no tienen un cupon normal con su mismo codigo)
    insert CARPINCHO_LOVERS.cupon(cupon_nro, cupon_monto, cupon_fecha_alta, cupon_fecha_vencimiento, cupon_tipo, cupon_usuario_id)
    (
        SELECT 
            t1.CUPON_RECLAMO_NRO
            ,t1.CUPON_RECLAMO_MONTO
            ,t1.CUPON_RECLAMO_FECHA_ALTA
            ,t1.CUPON_RECLAMO_FECHA_VENCIMIENTO
            ,CARPINCHO_LOVERS.buscar_tipo_cupon(t1.CUPON_RECLAMO_TIPO)
            ,CARPINCHO_LOVERS.buscar_usuario(t1.USUARIO_DNI, t1.USUARIO_NOMBRE, t1.USUARIO_APELLIDO)
        FROM gd_esquema.Maestra as t1 left join gd_esquema.Maestra as t2 on t2.CUPON_NRO = t1.CUPON_RECLAMO_NRO
        where t1.CUPON_RECLAMO_NRO is not null and t2.CUPON_NRO is null
    )
    --Ahora  migramos la relacion entre un cupon y su reclamo
    insert CARPINCHO_LOVERS.cupon_reclamo(cupon_reclamo_reclamo_nro, cupon_reclamo_nro)
    (
        select RECLAMO_NRO, CUPON_RECLAMO_NRO
        from gd_esquema.Maestra
        where CUPON_RECLAMO_NRO is not null
        group by RECLAMO_NRO, CUPON_RECLAMO_NRO
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

create proc CARPINCHO_LOVERS.migrar_cupon_x_pedido as
BEGIN
    insert CARPINCHO_LOVERS.cupon_x_pedido(cupon_nro, pedido_nro)
    (
        select cupon_nro, pedido_nro
        from gd_esquema.Maestra
        where CUPON_NRO is not null and PEDIDO_NRO is not null
    )
end

go

create proc CARPINCHO_LOVERS.migrar_productos as
BEGIN
    insert CARPINCHO_LOVERS.producto(producto_codigo, producto_nombre, producto_descripcion)
    (
        select PRODUCTO_LOCAL_CODIGO, PRODUCTO_LOCAL_NOMBRE, PRODUCTO_LOCAL_DESCRIPCION from gd_esquema.Maestra
		where PRODUCTO_LOCAL_CODIGO is not null
        group by PRODUCTO_LOCAL_CODIGO, PRODUCTO_LOCAL_NOMBRE, PRODUCTO_LOCAL_DESCRIPCION
    )
end
go

create proc CARPINCHO_LOVERS.migrar_local as
BEGIN
    insert CARPINCHO_LOVERS.local(local_nombre, local_descripcion, local_direccion, local_localidad, local_tipo)
    (
        SELECT LOCAL_NOMBRE, LOCAL_DESCRIPCION, LOCAL_DIRECCION,
            CARPINCHO_LOVERS.buscar_localidad(LOCAL_PROVINCIA, LOCAL_LOCALIDAD),
            (select tipo_local_id from CARPINCHO_LOVERS.tipo_local where tipo_local_descripcion = LOCAL_TIPO)
        from gd_esquema.Maestra 
		where LOCAL_NOMBRE is not null
		group by LOCAL_NOMBRE ,LOCAL_DESCRIPCION, LOCAL_DIRECCION, LOCAL_PROVINCIA, LOCAL_LOCALIDAD, LOCAL_TIPO
    )
end
go

create proc CARPINCHO_LOVERS.migrar_categoria as
begin 
    insert into CARPINCHO_LOVERS.categoria(categoria_nombre, categoria_tipo) values ('Parrilla', CARPINCHO_LOVERS.buscar_tipo_local('Tipo Local Restaurante'))
    insert into CARPINCHO_LOVERS.categoria(categoria_nombre, categoria_tipo) values ('Heladeria', CARPINCHO_LOVERS.buscar_tipo_local('Tipo Local Restaurante'))
    insert into CARPINCHO_LOVERS.categoria(categoria_nombre, categoria_tipo) values ('Comida Rapida', CARPINCHO_LOVERS.buscar_tipo_local('Tipo Local Restaurante'))
    insert into CARPINCHO_LOVERS.categoria(categoria_nombre, categoria_tipo) values ('Minimercado', CARPINCHO_LOVERS.buscar_tipo_local('Tipo Local Mercado'))
    insert into CARPINCHO_LOVERS.categoria(categoria_nombre, categoria_tipo) values ('Kiosco', CARPINCHO_LOVERS.buscar_tipo_local('Tipo Local Mercado'))
    insert into CARPINCHO_LOVERS.categoria(categoria_nombre, categoria_tipo) values ('Supermercado', CARPINCHO_LOVERS.buscar_tipo_local('Tipo Local Mercado'))
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
go

create proc CARPINCHO_LOVERS.migrar_horario as
begin
    insert CARPINCHO_LOVERS.horario(horario_apertura, horario_cierre, horario_dia_id, horario_local_id)
    (
        select HORARIO_LOCAL_HORA_APERTURA, HORARIO_LOCAL_HORA_CIERRE,
            (select dia_id from CARPINCHO_LOVERS.dia where dia_nombre = HORARIO_LOCAL_DIA),
            CARPINCHO_LOVERS.buscar_local(LOCAL_NOMBRE, LOCAL_DESCRIPCION, LOCAL_DIRECCION)
        from gd_esquema.Maestra
        where HORARIO_LOCAL_HORA_APERTURA is not null and HORARIO_LOCAL_HORA_CIERRE is not null
        group by HORARIO_LOCAL_HORA_APERTURA, HORARIO_LOCAL_HORA_CIERRE, HORARIO_LOCAL_DIA, LOCAL_NOMBRE, LOCAL_DESCRIPCION, LOCAL_DIRECCION
    )
end
go

create proc CARPINCHO_LOVERS.migrar_local_x_producto as
BEGIN
    insert CARPINCHO_LOVERS.local_x_producto(producto_codigo, local_id, producto_local_precio)
    (
        SELECT PRODUCTO_LOCAL_CODIGO,
            CARPINCHO_LOVERS.buscar_local(LOCAL_NOMBRE ,LOCAL_DESCRIPCION, LOCAL_DIRECCION),
            producto_local_precio
        from gd_esquema.Maestra 
		where PRODUCTO_LOCAL_CODIGO is not null
		group by LOCAL_NOMBRE ,LOCAL_DESCRIPCION, LOCAL_DIRECCION, PRODUCTO_LOCAL_CODIGO, PRODUCTO_LOCAL_PRECIO
    )
end

go

create proc CARPINCHO_LOVERS.migrar_reclamo as
BEGIN
    insert CARPINCHO_LOVERS.reclamo(reclamo_nro, reclamo_fecha, reclamo_descripcion, reclamo_fecha_solucion, reclamo_solucion, reclamo_calificacion, reclamo_tipo, reclamo_pedido_nro, reclamo_operador_id, reclamo_estado)
    (
        select RECLAMO_NRO, RECLAMO_FECHA, RECLAMO_DESCRIPCION, RECLAMO_FECHA_SOLUCION, RECLAMO_SOLUCION, RECLAMO_CALIFICACION,
            (select reclamo_tipo_id from CARPINCHO_LOVERS.reclamo_tipo where reclamo_tipo_descripcion = RECLAMO_TIPO),
            pedido_nro,
            (select operador_reclamo_id from CARPINCHO_LOVERS.operador_reclamo as ti where ti.operador_reclamo_nombre + ti.operador_reclamo_apellido = te.operador_reclamo_nombre + te.operador_reclamo_apellido and ti.operador_reclamo_dni = te.operador_reclamo_dni),
            CARPINCHO_LOVERS.buscar_estado_reclamo(RECLAMO_ESTADO)
        from gd_esquema.Maestra as te
        where RECLAMO_NRO is not null
    )
end
go

create proc CARPINCHO_LOVERS.migrar_estado_reclamo as
begin
    insert into CARPINCHO_LOVERS.estado_reclamo(estado_reclamo_descripcion) values ('Estado Reclamo En Revision')
    insert into CARPINCHO_LOVERS.estado_reclamo(estado_reclamo_descripcion) values ('Estado Reclamo Solucionado')
    insert into CARPINCHO_LOVERS.estado_reclamo(estado_reclamo_descripcion) values ('Estado Reclamo Iniciado')
    insert CARPINCHO_LOVERS.estado_reclamo(estado_reclamo_descripcion) -- Migra Estado Mensajeria Entregado
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

create proc CARPINCHO_LOVERS.migrar_operador_reclamo as
begin
    insert CARPINCHO_LOVERS.operador_reclamo(operador_reclamo_nombre, operador_reclamo_apellido, operador_reclamo_dni, operador_reclamo_telefono, operador_reclamo_direccion, operador_reclamo_mail, operador_reclamo_fecha_nac)
    (
        select OPERADOR_RECLAMO_NOMBRE, OPERADOR_RECLAMO_APELLIDO, OPERADOR_RECLAMO_DNI, OPERADOR_RECLAMO_TELEFONO,
                OPERADOR_RECLAMO_DIRECCION, OPERADOR_RECLAMO_MAIL, OPERADOR_RECLAMO_FECHA_NAC
        from gd_esquema.Maestra
        where OPERADOR_RECLAMO_NOMBRE is not null
        group by OPERADOR_RECLAMO_NOMBRE, OPERADOR_RECLAMO_APELLIDO, OPERADOR_RECLAMO_DNI, OPERADOR_RECLAMO_TELEFONO, OPERADOR_RECLAMO_DIRECCION, OPERADOR_RECLAMO_MAIL, OPERADOR_RECLAMO_FECHA_NAC
    )
end

go

create proc CARPINCHO_LOVERS.migrar_pedido as
BEGIN
    DECLARE @variable_id_usuario decimal(18,0);
    
    insert CARPINCHO_LOVERS.pedido(pedido_nro, pedido_local_id, pedido_usuario_id, pedido_total_productos, pedido_precio_envio,
        pedido_propina, pedido_tarifa_servicio, pedido_total_cupones, pedido_observ, pedido_fecha,
        pedido_fecha_entrega, pedido_tiempo_estimado_entrega, pedido_calificacion,
        pedido_tipo_medio_pago, pedido_medio_pago_id, pedido_total_servicio, pedido_estado)
    (
        select 
        pedido_nro,
        CARPINCHO_LOVERS.buscar_local(LOCAL_NOMBRE ,LOCAL_DESCRIPCION, LOCAL_DIRECCION),
        CARPINCHO_LOVERS.buscar_usuario(usuario_dni, usuario_nombre, usuario_apellido),
        pedido_total_productos,
        pedido_precio_envio,
        pedido_propina,
        pedido_tarifa_servicio,
        pedido_total_cupones,
        pedido_observ,
        pedido_fecha,
        pedido_fecha_entrega,
        pedido_tiempo_estimado_entrega,
        pedido_calificacion,
        CARPINCHO_LOVERS.buscar_tipo_medio_de_pago(MEDIO_PAGO_TIPO),
        CARPINCHO_LOVERS.buscar_medio_de_pago(CARPINCHO_LOVERS.buscar_usuario(usuario_dni, usuario_nombre, usuario_apellido), MEDIO_PAGO_NRO_TARJETA, MARCA_TARJETA),
        pedido_total_servicio,
        CARPINCHO_LOVERS.buscar_estado_pedido(pedido_estado)

        from gd_esquema.Maestra 
        where PEDIDO_NRO is not null
        group by pedido_nro, LOCAL_NOMBRE,LOCAL_DESCRIPCION, LOCAL_DIRECCION,
            usuario_dni, usuario_nombre, usuario_apellido, pedido_total_productos, pedido_precio_envio,
            pedido_propina, pedido_tarifa_servicio, pedido_total_cupones, pedido_observ,
            pedido_fecha, pedido_fecha_entrega, pedido_tiempo_estimado_entrega, pedido_calificacion, MEDIO_PAGO_TIPO,
            medio_pago_nro_tarjeta, MARCA_TARJETA, pedido_total_servicio, pedido_estado
    )
end

go

create proc CARPINCHO_LOVERS.migrar_estado_pedido as
begin
    insert into CARPINCHO_LOVERS.estado_pedido(estado_pedido_descripcion) values ('Estado Pedido Realizado')
    insert into CARPINCHO_LOVERS.estado_pedido(estado_pedido_descripcion) values ('Estado Pedido Confirmado')
    insert into CARPINCHO_LOVERS.estado_pedido(estado_pedido_descripcion) values ('Estado Pedido En Preparacion')
    insert into CARPINCHO_LOVERS.estado_pedido(estado_pedido_descripcion) values ('Estado Pedido En Camino')
    insert into CARPINCHO_LOVERS.estado_pedido(estado_pedido_descripcion) values ('Estado Pedido Entregado')
    insert into CARPINCHO_LOVERS.estado_pedido(estado_pedido_descripcion) values ('Estado Pedido Cancelado')
    insert CARPINCHO_LOVERS.estado_pedido(estado_pedido_descripcion) -- Migra solo Estado Mensajeria Entregado y Estado Mensajeria Cancelado
    (
        select PEDIDO_ESTADO from gd_esquema.Maestra where PEDIDO_ESTADO is not null group by PEDIDO_ESTADO
    )
end

go

create proc CARPINCHO_LOVERS.migrar_producto_x_pedido as
BEGIN
    insert CARPINCHO_LOVERS.producto_x_pedido(producto_pedido_producto_id, producto_pedido_local_id, producto_pedido_codigo,
        producto_pedido_cantidad, producto_precio)
    (
        SELECT 
        PRODUCTO_LOCAL_CODIGO,
        CARPINCHO_LOVERS.buscar_local(LOCAL_NOMBRE, LOCAL_DESCRIPCION, LOCAL_DIRECCION),
        pedido_nro,
        sum(PRODUCTO_CANTIDAD),
        PRODUCTO_LOCAL_PRECIO
        from gd_esquema.Maestra
        where PRODUCTO_LOCAL_CODIGO is not null
        Group by LOCAL_NOMBRE, LOCAL_DESCRIPCION, LOCAL_DIRECCION, PRODUCTO_LOCAL_CODIGO, PEDIDO_NRO, PRODUCTO_LOCAL_PRECIO
    )
end

go

create proc CARPINCHO_LOVERS.migrar_envio_pedido AS
BEGIN
    insert CARPINCHO_LOVERS.envio_pedido(envio_pedido_direccion_id, envio_pedido_repartidor_id, envio_pedido_nro)
    (
        SELECT (select direccion_id from direccion_usuario  where direccion_usuario_direccion = te.DIRECCION_USUARIO_DIRECCION),
        (select repartidor_id from CARPINCHO_LOVERS.repartidor as ti where ti.repartidor_dni = te.REPARTIDOR_DNI and ti.repartidor_nombre + ti.repartidor_apellido =  te.REPARTIDOR_NOMBRE + te.REPARTIDOR_APELLIDO),
        pedido_nro
        from gd_esquema.Maestra as te
        where PEDIDO_NRO is not null
        Group by PEDIDO_NRO, DIRECCION_USUARIO_DIRECCION, REPARTIDOR_DNI, REPARTIDOR_NOMBRE, REPARTIDOR_APELLIDO
    )
END
GO

create proc CARPINCHO_LOVERS.migrar_envio_mensajeria AS
BEGIN
    insert CARPINCHO_LOVERS.envio_mensajeria(envio_mensajeria_nro, envio_mensajeria_localidad_origen, envio_mensajeria_localidad_destino,
        envio_mensajeria_direccion_origen, envio_mensajeria_direccion_destino, envio_mensajeria_km, envio_mensajeria_valor_asegurado,
        envio_mensajeria_precio_envio, envio_mensajeria_precio_seguro, envio_mensajeria_precio_paquete, envio_mensajeria_propina,
        envio_mensajeria_total, envio_mensajeria_observ, envio_mensajeria_fecha, envio_mensajeria_fecha_entrega,
        envio_mensajeria_tiempo_estimado, envio_mensajeria_calificacion, envio_mensajeria_tipo_medio_pago_id, envio_mensajeria_usuario_id, 
        envio_mensajeria_repartidor_id, envio_mensajeria_medio_pago_id, envio_mensajeria_estado)
    (
        SELECT
        ENVIO_MENSAJERIA_NRO,
        CARPINCHO_LOVERS.buscar_localidad(ENVIO_MENSAJERIA_PROVINCIA, ENVIO_MENSAJERIA_LOCALIDAD),
        CARPINCHO_LOVERS.buscar_localidad(ENVIO_MENSAJERIA_PROVINCIA, ENVIO_MENSAJERIA_LOCALIDAD),
        ENVIO_MENSAJERIA_DIR_ORIG,
        ENVIO_MENSAJERIA_DIR_DEST,
        ENVIO_MENSAJERIA_KM,
        ENVIO_MENSAJERIA_VALOR_ASEGURADO,
        ENVIO_MENSAJERIA_PRECIO_ENVIO,
        ENVIO_MENSAJERIA_PRECIO_SEGURO,
        PAQUETE_TIPO_PRECIO,
        ENVIO_MENSAJERIA_PROPINA,
        ENVIO_MENSAJERIA_TOTAL,
        ENVIO_MENSAJERIA_OBSERV,
        ENVIO_MENSAJERIA_FECHA,
        ENVIO_MENSAJERIA_FECHA_ENTREGA,
        ENVIO_MENSAJERIA_TIEMPO_ESTIMADO,
        ENVIO_MENSAJERIA_CALIFICACION,
        CARPINCHO_LOVERS.buscar_tipo_medio_de_pago(MEDIO_PAGO_TIPO),
        CARPINCHO_LOVERS.buscar_usuario(USUARIO_DNI, USUARIO_NOMBRE, USUARIO_APELLIDO),
        (select repartidor_id from CARPINCHO_LOVERS.repartidor as ti where ti.repartidor_dni = te.REPARTIDOR_DNI and ti.repartidor_nombre + ti.repartidor_apellido =  te.REPARTIDOR_NOMBRE + te.REPARTIDOR_APELLIDO),
        CARPINCHO_LOVERS.buscar_medio_de_pago(CARPINCHO_LOVERS.buscar_usuario(usuario_dni, usuario_nombre, usuario_apellido), MEDIO_PAGO_NRO_TARJETA, MARCA_TARJETA),
        CARPINCHO_LOVERS.buscar_estado_envio_mensajeria(ENVIO_MENSAJERIA_ESTADO)
        FROM gd_esquema.Maestra as te
        where ENVIO_MENSAJERIA_NRO is not null
    )
end
go

create proc CARPINCHO_LOVERS.migrar_estado_envio as
begin
    insert CARPINCHO_LOVERS.estado_envio_mensajeria(estado_mensajeria_descripcion)
    (
        select ENVIO_MENSAJERIA_ESTADO from gd_esquema.Maestra where ENVIO_MENSAJERIA_ESTADO is not null group by ENVIO_MENSAJERIA_ESTADO
    )
    -- estado envio mensajeria Migra solo 'Estado Mensajeria Entregado'
    insert into CARPINCHO_LOVERS.estado_envio_mensajeria(estado_mensajeria_descripcion) values ('Estado Mensajeria Realizado')
    insert into CARPINCHO_LOVERS.estado_envio_mensajeria(estado_mensajeria_descripcion) values ('Estado Mensajeria Confirmado')
    insert into CARPINCHO_LOVERS.estado_envio_mensajeria(estado_mensajeria_descripcion) values ('Estado Mensajeria En Camino Origen')
    insert into CARPINCHO_LOVERS.estado_envio_mensajeria(estado_mensajeria_descripcion) values ('Estado Mensajeria En Camino Destino')
    insert into CARPINCHO_LOVERS.estado_envio_mensajeria(estado_mensajeria_descripcion) values ('Estado Mensajeria Cancelado')
    
end
go

create proc CARPINCHO_LOVERS.migrar_paquete as
BEGIN
    insert CARPINCHO_LOVERS.paquete(paquete_tipo_paquete, paquete_envio_mensajeria_nro)
    (
        select 
            (select tipo_paquete_id from CARPINCHO_LOVERS.tipo_paquete AS ti where ti.tipo_paquete_descripcion = te.PAQUETE_TIPO),
            ENVIO_MENSAJERIA_NRO
        FROM gd_esquema.Maestra as te
        where envio_mensajeria_nro is not null
    )
END
go

create proc CARPINCHO_LOVERS.migrar_tipo_paquete as
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

create proc CARPINCHO_LOVERS.migrar_trazabilidad_reclamo as
begin
    insert CARPINCHO_LOVERS.trazabilidad_reclamo(trazabilidad_reclamo_estado, trazabilidad_reclamo_nro, trazabilidad_reclamo_fecha)
    (
        select CARPINCHO_LOVERS.buscar_estado_reclamo('Estado Reclamo Iniciado'), reclamo_nro, reclamo_fecha from gd_esquema.Maestra
        where RECLAMO_NRO is not null
        union
        select CARPINCHO_LOVERS.buscar_estado_reclamo('Estado Reclamo Solucionado'), reclamo_nro, reclamo_fecha_solucion from gd_esquema.Maestra
        where RECLAMO_NRO is not null
    )
end
go

create proc CARPINCHO_LOVERS.migrar_trazabilidad_pedido as
begin
    insert CARPINCHO_LOVERS.trazabilidad_pedido(trazabilidad_pedido_estado, trazabilidad_pedido_nro, trazabilidad_pedido_fecha)
    (
        select CARPINCHO_LOVERS.buscar_estado_pedido('Estado Pedido Realizado'), pedido_nro, pedido_fecha from gd_esquema.Maestra
        where PEDIDO_NRO is not null
        union
        select case 
                    when PEDIDO_ESTADO = 'Estado Mensajeria Entregado' then CARPINCHO_LOVERS.buscar_estado_pedido('Estado Pedido Entregado')
                    when PEDIDO_ESTADO = 'Estado Mensajeria Cancelado' then CARPINCHO_LOVERS.buscar_estado_pedido('Estado Pedido Cancelado')
                end,
                pedido_nro,
                pedido_fecha_entrega
        from gd_esquema.Maestra
        where PEDIDO_NRO is not null
    )
end

go

create proc CARPINCHO_LOVERS.migrar_trazabilidad_envio_mensajeria as
begin
    insert CARPINCHO_LOVERS.trazabilidad_envio_mensajeria(trazabilidad_mensajeria_estado, trazabilidad_mensajeria_nro, trazabilidad_mensajeria_fecha)
    (
        select CARPINCHO_LOVERS.buscar_estado_envio_mensajeria('Estado Mensajeria Realizado'), envio_mensajeria_nro, envio_mensajeria_fecha from gd_esquema.Maestra
        where ENVIO_MENSAJERIA_NRO is not null
        union
        select CARPINCHO_LOVERS.buscar_estado_envio_mensajeria(ENVIO_MENSAJERIA_ESTADO),
                envio_mensajeria_nro,
                envio_mensajeria_fecha_entrega
        from gd_esquema.Maestra
        where ENVIO_MENSAJERIA_NRO is not null
    )
end

go

------------------------------------------------- EXECUTE PROCEDURES -------------------------------------------------

exec CARPINCHO_LOVERS.migrar_tipo_local 
exec CARPINCHO_LOVERS.migrar_provincia 
exec CARPINCHO_LOVERS.migrar_localidad 
exec CARPINCHO_LOVERS.migrar_usuarios 
exec CARPINCHO_LOVERS.migrar_local
exec CARPINCHO_LOVERS.migrar_direccion_usuario
exec CARPINCHO_LOVERS.migrar_dias
exec CARPINCHO_LOVERS.migrar_horario
exec CARPINCHO_LOVERS.migrar_productos
exec CARPINCHO_LOVERS.migrar_local_x_producto
exec CARPINCHO_LOVERS.migrar_marca_tarjeta
exec CARPINCHO_LOVERS.migrar_tipo_medio_de_pago
exec CARPINCHO_LOVERS.migrar_medio_de_pago
exec CARPINCHO_LOVERS.migrar_estado_pedido
exec CARPINCHO_LOVERS.migrar_estado_envio
exec CARPINCHO_LOVERS.migrar_estado_reclamo
exec CARPINCHO_LOVERS.migrar_tipo_movilidad
exec CARPINCHO_LOVERS.migrar_repartidor
exec CARPINCHO_LOVERS.migrar_operador_reclamo
exec CARPINCHO_LOVERS.migrar_reclamo_tipo
exec CARPINCHO_LOVERS.migrar_tipo_cupon
exec CARPINCHO_LOVERS.migrar_tipo_paquete
exec CARPINCHO_LOVERS.migrar_pedido
exec CARPINCHO_LOVERS.migrar_envio_mensajeria
exec CARPINCHO_LOVERS.migrar_envio_pedido
exec CARPINCHO_LOVERS.migrar_reclamo
exec CARPINCHO_LOVERS.migrar_producto_x_pedido
exec CARPINCHO_LOVERS.migrar_cupon
exec CARPINCHO_LOVERS.migrar_cupon_reclamo
exec CARPINCHO_LOVERS.migrar_paquete
exec CARPINCHO_LOVERS.migrar_cupon_x_pedido
exec CARPINCHO_LOVERS.migrar_categoria
exec CARPINCHO_LOVERS.migrar_trazabilidad_envio_mensajeria
exec CARPINCHO_LOVERS.migrar_trazabilidad_pedido
exec CARPINCHO_LOVERS.migrar_trazabilidad_reclamo
exec CARPINCHO_LOVERS.migrar_repartidor_x_localidad
