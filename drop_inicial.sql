use GD1C2023
go

--DROP TABLE
drop table CARPINCHO_LOVERS.estado_posible_envio
drop table CARPINCHO_LOVERS.estado_posible_pedido
drop table CARPINCHO_LOVERS.estado_posible_reclamo
drop table CARPINCHO_LOVERS.cupon_x_pedido
drop table CARPINCHO_LOVERS.cupon_reclamo
drop table CARPINCHO_LOVERS.estado_mensajeria
drop table CARPINCHO_LOVERS.estado_pedido
drop table CARPINCHO_LOVERS.estado_reclamo
drop table CARPINCHO_LOVERS.horario
drop table CARPINCHO_LOVERS.producto_pedido
drop table CARPINCHO_LOVERS.reclamo
drop table CARPINCHO_LOVERS.reclamo_tipo
drop table CARPINCHO_LOVERS.repartidor_x_localidad
drop table CARPINCHO_LOVERS.cupon
drop table CARPINCHO_LOVERS.cupon_tipo
drop table CARPINCHO_LOVERS.dia
drop table CARPINCHO_LOVERS.envio_mensajeria
drop table CARPINCHO_LOVERS.local_x_producto
drop table CARPINCHO_LOVERS.operador_reclamo
drop table CARPINCHO_LOVERS.paquete
drop table CARPINCHO_LOVERS.pedido
drop table CARPINCHO_LOVERS.direccion_envio
drop table CARPINCHO_LOVERS.envio
drop table CARPINCHO_LOVERS.direccion_usuario
drop table CARPINCHO_LOVERS.local
drop table CARPINCHO_LOVERS.categoria
drop table CARPINCHO_LOVERS.medio_de_pago
drop table CARPINCHO_LOVERS.marca_tarjeta
drop table CARPINCHO_LOVERS.producto
drop table CARPINCHO_LOVERS.localidad
drop table CARPINCHO_LOVERS.provincia
drop table CARPINCHO_LOVERS.repartidor
drop table CARPINCHO_LOVERS.movilidad_tipo
drop table CARPINCHO_LOVERS.tipo_local
drop table CARPINCHO_LOVERS.tipo_medio_de_pago
drop table CARPINCHO_LOVERS.tipo_paquete
drop table CARPINCHO_LOVERS.usuario

--DROP PROCEDURE
drop proc CARPINCHO_LOVERS.migrar_usuarios
drop proc CARPINCHO_LOVERS.migrar_tipo_paquete
drop proc CARPINCHO_LOVERS.migrar_marca_tarjeta
drop proc CARPINCHO_LOVERS.migrar_tipo_medio_de_pago
drop proc CARPINCHO_LOVERS.migrar_estado_posible_envio
drop proc CARPINCHO_LOVERS.migrar_estado_posible_pedido
drop proc CARPINCHO_LOVERS.migrar_estado_posible_reclamo
drop proc CARPINCHO_LOVERS.migrar_reclamo_tipo
drop proc CARPINCHO_LOVERS.migrar_tipo_local
drop proc CARPINCHO_LOVERS.migrar_tipo_movilidad
drop proc CARPINCHO_LOVERS.migrar_tipo_cupon
drop proc CARPINCHO_LOVERS.migrar_medio_de_pago
drop proc CARPINCHO_LOVERS.migrar_provincia
drop proc CARPINCHO_LOVERS.migrar_localidad 
drop proc CARPINCHO_LOVERS.migrar_direccion_usuario

go
drop schema CARPINCHO_LOVERS