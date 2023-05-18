use GD1C2023
go

create schema CARPINCHO_LOVERS
go

create table CARPINCHO_LOVERS.usuario(
    usuario_id decimal(18, 0) not null identity(1,1),
    usuario_dni decimal(18, 0) not null,
    usuario_nombre nvarchar(255) not null,
    usuario_apellido nvarchar(255) not null,
    usuario_telefono decimal(18, 0) not null,
    usuario_mail nvarchar(255) not null,
    usuario_fecha_nac date not null,
    usuario_fecha_registro datetime not null,
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
    repartidor_tipo_movilidad decimal(18, 0) not null,
    repartidor_localidad nvarchar(255) not null,
)

create table CARPINCHO_LOVERS.repartido_x_localidad(
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
    direccion_usuario_localidad date not null
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

create table CARPINCHO_LOVERS.cupor_reclamo(
    cupon_reclamo_nro decimal(18, 0) not null,
    cupon_nro decimal(18, 0) not null
)

create table CARPINCHO_LOVERS.cupon_x_pedido(
    cupon_nro decimal(18, 0) not null,
    pedido_nro decimal(18 0) not null
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
    provincia_id decimal(18 ,0) not null identity(1, 1),
    provincia_nombre nvarchar(30) not null
)

create table CARPINCHO_LOVERS.local(
    local_id decimal(18, 0) not null identity(1, 1),
    local_nombre nvarchar(100) not null,
    local_descripcion nvarchar(255) not null,
    local_direccion nvarchar(255) not null,
    local_localidad decimal(18, 0) not null,
    local_provincia nvarchar(255) not null,
    local_categoria_id decimal(18, 0) not null
)

create table CARPINCHO_LOVERS.horario(
    dia_id decimal(18, 0) not null,
    local_id decimal(18, 0) not null,
    horario_apertura time not null,
    horario_cierre time not null
)

create table CARPINCHO_LOVERS.dia(
    dia_id decimal(18, 0) not null identity(1, 1),
    dia_nombre nvarchar(15)
)

create table CARPINCHO_LOVERS.envio(
    envio_id decimal(18, 0) not null identity(1, 1),
    envio_precio decimal(18, 2) not null,
    envio_propina decimal(18, 2) not null,
    envio_direccion_id decimal(18, 0) not null,
    envio_repartidor_id decimal(18, 0) not null,
    envio_total decimal(18, 2) not null
)

create table CARPINCHO_LOVERS.pedido(
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

create table CARPINCHO_LOVERS.estado_pedido(
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
    medio_pago_marca_tarjeta nvarchar(100) not null,
    medio_pago_usuario_id decimal(18, 0) not null
)

create table CARPINCHO_LOVERS.marca_tarjeta(
    marca_tarjeta_id decimal(18, 0) not null identity(1,1),
    marca_tarjeta_nombre nvarchar(50) not null
)

create table CARPINCHO_LOVERS.tipo_medio_de_pago(
    medio_pago_tipo_id decimal(18, 0) not null identity(1,1),
    medio_pago_tipo_descripcion nvarchar(50) not null
)

create table CARPINCHO_LOVERS.producto(
    producto_local_codigo nvarchar(50) not null,
    producto_local_nombre nvarchar(50) not null,
    producto_local_descripcion nvarchar(255)
)

create table CARPINCHO_LOVERS.producto_pedido(
    producto_pedido_producto_id decimal(18, 0) not null,
    producto_pedido_local_id decimal(18, 0) not null,
    producto_pedido_codigo decimal(18, 0) not null,
    producto_pedido_cantidad decimal(18, 0) not null,
    producto_precio decimal(18, 2) not null
)

create table CARPINCHO_LOVERS.localXproducto(
    producto_local_codigo nvarchar(50) not null,
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
    paquete_id decimal(18, 0) not null identity(1, 1),
    paquete_tipo decimal(18, 0) not null,
    paquete_alto_max decimal(18, 2) not null,
    paquete_ancho_max decimal(18, 2) not null,
    paquete_largo_max decimal(18, 2) not null,
    paquete_peso_max decimal(18, 2) not null,
    paquete_tipo_precio decimal(18, 0) not null
)

create table CARPINCHO_LOVERS.paquete_tipo(
    paquete_tipo_id decimal(18, 0) not null identity(1, 1),
    paquete_tipo_descripcion nvarchar(50) not null
)

create table CARPINCHO_LOVERS.paquete_precio_tipo(
    paquete_precio_tipo_id decimal(18, 0) not null identity(1, 1),
    paquete_precio_tipo_descripcion decimal(18, 2)
)

create table CARPINCHO_LOVERS.envio_mensajeria(
    envio_mensajeria_id decimal(18 ,0) not null identity(1, 1),
    envio_mesajeria_direccion_origen decimal(18 ,0) not null,
    envio_mesajeria_direccion_destino decimal(18 ,0) not null,
    envio_mesajeria_km decimal(18 ,2) not null,
    envio_mesajeria_valor_asegurado decimal(18 ,2) not null,
    envio_mesajeria_precio_envio decimal(18 ,2) not null,
    envio_mesajeria_precio_seguro decimal(18 ,2) not null,
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