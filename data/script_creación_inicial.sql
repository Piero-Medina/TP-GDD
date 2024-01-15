USE GD2C2023;
GO

-- DROPS FOREIGN KEY
DECLARE @DropFKs NVARCHAR(max) = ''
SELECT @DropFKs += 'ALTER TABLE ' + QUOTENAME(OBJECT_SCHEMA_NAME(parent_object_id)) + '.'
                        +  QUOTENAME(OBJECT_NAME(parent_object_id)) + ' ' + 'DROP CONSTRAINT' + QUOTENAME(name)
FROM sys.foreign_keys

EXEC sp_executesql @DropFKs;
PRINT 'Constraints eliminadas correctamente';
GO

-- DROPS TABLAS
DECLARE @DropTables NVARCHAR(max) = ''
SELECT @DropTables += 'DROP TABLE Los_Magios. ' + QUOTENAME(TABLE_NAME)
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'LOS_MAGIOS' and TABLE_TYPE = 'BASE TABLE'

EXEC sp_executesql @DropTables;
PRINT 'Tablas eliminadas';
GO

-- DROP SCHEMA
IF EXISTS(SELECT NAME FROM sys.schemas WHERE name = 'LOS_MAGIOS')
	DROP SCHEMA LOS_MAGIOS;
GO

-- CREACION SCHEMA
CREATE SCHEMA LOS_MAGIOS;
GO


-- CREACION DE TABLAS

-- Modulo 1
CREATE TABLE LOS_MAGIOS.anuncio(
	id INT IDENTITY NOT NULL PRIMARY KEY,
	codigo NUMERIC(19, 0) NOT NULL, 
	fecha_publicacion DATETIME NOT NULL, 
	agente_id INT NOT NULL,
	tipo_operacion_id INT NOT NULL,
	inmueble_id INT NULL,
	precio_publicado NUMERIC(18,2) NOT NULL,
	moneda_id INT NOT NULL,
	tipo_periodo_id INT NOT NULL,
	estado_anuncio_id INT NOT NULL,
	fecha_finalizacion_anuncio DATETIME NOT NULL,
	costo_publicacion NUMERIC(18,2) NOT NULL
);

CREATE TABLE LOS_MAGIOS.tipo_operacion(
	id INT IDENTITY PRIMARY KEY,
	nombre NVARCHAR(100)
)

CREATE TABLE LOS_MAGIOS.tipo_periodo(
	id INT IDENTITY PRIMARY KEY,
	nombre NVARCHAR(100)
)

CREATE TABLE LOS_MAGIOS.estado_anuncio(
	id INT IDENTITY PRIMARY KEY,
	nombre NVARCHAR(100)
)

CREATE TABLE LOS_MAGIOS.agente(
	id INT IDENTITY NOT NULL PRIMARY KEY,
	nombre NVARCHAR(100),
	apellido NVARCHAR(100),
	dni NUMERIC(18,2) NOT NULL,
	fecha_registro DATETIME NOT NULL,
	telefono NUMERIC(18,2) NOT NULL,
	mail NVARCHAR(100) NOT NULL,
	fecha_nacimiento DATETIME NOT NULL,
	sucursal_id INT NOT NULL
);

CREATE TABLE LOS_MAGIOS.sucursal(
	id INT IDENTITY PRIMARY KEY,
	codigo NUMERIC(18,0) NOT NULL,
	nombre NVARCHAR(100) NOT NULL,
	direccion NVARCHAR(100) NOT NULL,
	telefono NVARCHAR(100) NOT NULL,
	localidad_id INT NOT NULL, 
	provincia_id INT NOT NULL
)

CREATE TABLE LOS_MAGIOS.moneda(
	id INT IDENTITY PRIMARY KEY,
	nombre NVARCHAR(100) NOT NULL
);

CREATE TABLE LOS_MAGIOS.inmueble(
  id INT IDENTITY PRIMARY KEY,
  codigo NUMERIC(18, 0) NOT NULL,
  nombre NVARCHAR(100) NOT NULL,
  tipo_inmueble_id INT NOT NULL,
  descripcion NVARCHAR(100) NOT NULL,
  propietario_id INT NOT NULL,
  direccion NVARCHAR(100) NOT NULL,
  cant_ambientes_id INT NOT NULL,
  superficieTotal NUMERIC(18,2) NOT NULL,
  disposicion_id INT NOT NULL,
  orientacion_id INT NOT NULL,
  estado_inmueble_id INT NOT NULL,
  antiguedad NUMERIC(18,0) NOT NULL,
  expensas NUMERIC(18,2) NOT NULL,
  barrio_id INT NOT NULL,
  provincia_id INT NOT NULL,
  localidad_id INT NOT NULL
);

CREATE TABLE LOS_MAGIOS.inmueble_x_caracteristicas(
	inmueble_id INT NOT NULL,
	caracteristicas_id INT NOT NULL,
	PRIMARY KEY (inmueble_id, caracteristicas_id)
);

CREATE TABLE LOS_MAGIOS.tipoInmueble(
  id INT IDENTITY PRIMARY KEY,
  nombre NVARCHAR(100) NOT NULL
);

CREATE TABLE LOS_MAGIOS.propietario(
  id INT IDENTITY PRIMARY KEY,
  nombre NVARCHAR(100) NOT NULL,
  apellido NVARCHAR(100) NOT NULL,
  dni NUMERIC(18,0) NOT NULL,
  fecha_de_registro DATETIME NOT NULL,
  telefono NUMERIC(18,0) NOT NULL,
  fecha_de_nacimiento DATETIME NOT NULL
);


CREATE TABLE LOS_MAGIOS.barrio(
  id INT IDENTITY PRIMARY KEY,
  nombre NVARCHAR(100) not null,
);

CREATE TABLE LOS_MAGIOS.localidad(
  id INT IDENTITY PRIMARY KEY,
  nombre NVARCHAR(100) not null,
);

CREATE TABLE LOS_MAGIOS.provincia(
  id INT IDENTITY PRIMARY KEY,
  nombre NVARCHAR(50) not null
);

CREATE TABLE LOS_MAGIOS.ambientes(
  id INT IDENTITY PRIMARY KEY,
  nombre NVARCHAR(50) not null
);

CREATE TABLE LOS_MAGIOS.disposicion(
  id INT IDENTITY PRIMARY KEY,
  nombre NVARCHAR(50) not null
);

CREATE TABLE LOS_MAGIOS.orientacion(
  id INT IDENTITY PRIMARY KEY,
  nombre NVARCHAR(50) not null
);

CREATE TABLE LOS_MAGIOS.estado_inmueble(
  id INT IDENTITY PRIMARY KEY,
  nombre NVARCHAR(50) not null
);

CREATE TABLE LOS_MAGIOS.caracteristicas(
  id INT IDENTITY PRIMARY KEY,
  wifi NUMERIC(18,0) not null,
  cable NUMERIC(18,0) not null,
  calefaccion NUMERIC(18,0) not null,
  gas NUMERIC(18,0) not null
);

-- Modulo 2
CREATE TABLE LOS_MAGIOS.alquiler(
	id INT IDENTITY PRIMARY KEY,
	codigo NUMERIC(18,0) NOT NULL,
	anuncio_id INT NOT NULL,
	cantidad_periodos NUMERIC(18,0) NOT NULL,
	inquilino_id INT NOT NULL,
	fecha_inicio DATETIME NOT NULL,
	fecha_fin DATETIME NOT NULL, 
	deposito NUMERIC(18,2) NOT NULL,
	comision NUMERIC(18,2) NOT NULL,
	gasto_averiguaciones NUMERIC(18,2) NOT NULL,
	estado_alquiler_id INT NOT NULL
)

CREATE TABLE LOS_MAGIOS.detalle_importe(
	id INT IDENTITY PRIMARY KEY,
	alquiler_id INT NOT NULL,
	nro_pedido_inicio NUMERIC(18,0),
	nro_pedido_fin NUMERIC(18,0),
	precio NUMERIC(18,2)  
)

CREATE TABLE LOS_MAGIOS.inquilino(
	id INT IDENTITY PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	apellido VARCHAR(50) NOT NULL,
	dni NUMERIC(18,0) NOT NULL,
	fecha_registro DATETIME NOT NULL,
	telefono NUMERIC(18,0) NOT NULL,
	mail NVARCHAR(100) NOT NULL,
	fecha_de_nacimiento DATETIME NOT NULL
)

CREATE TABLE LOS_MAGIOS.estado_alquiler(
	id INT IDENTITY PRIMARY KEY,
	nombre VARCHAR(100)
)

-- Modulo 3 --
CREATE TABLE LOS_MAGIOS.pago_alquiler(
	id INT IDENTITY PRIMARY KEY,
	codigo NUMERIC(18,0) NOT NULL,
	alquiler_id INT NOT NULL,
	fecha_pago DATETIME NOT NULL,
	fecha_vencimiento_pago DATETIME NOT NULL,
	nro_periodo_pago NUMERIC(18,0) NOT NULL,
	descripcion NVARCHAR(100) NOT NULL,
	fecha_inicio_periodo DATETIME NOT NULL,
	fecha_fin_periodo DATETIME NOT NULL,
	importe NUMERIC(18,0) NOT NULL,
	medio_de_pago_id INT NOT NULL
)

CREATE TABLE LOS_MAGIOS.medio_de_pago(
	id INT IDENTITY PRIMARY KEY,
	nombre NVARCHAR(100) NOT NULL
)

-- modulo 4
CREATE TABLE LOS_MAGIOS.venta(
	id INT IDENTITY PRIMARY KEY,
	codigo NUMERIC(18,0) NOT NULL,
	anuncio_id INT NOT NULL,
	comprador_id INT NOT NULL,
	fecha_venta DATETIME NOT NULL,
	precio_venta NUMERIC(18,2) NOT NULL,
	moneda_id INT NOT NULL,
	comision NUMERIC(18,2) NOT NULL
)

CREATE TABLE LOS_MAGIOS.comprador(
	id INT IDENTITY PRIMARY KEY,
	nombre NVARCHAR(100) NOT NULL,
	apellido NVARCHAR(100) NOT NULL,
	dni NUMERIC(18,2) NOT NULL,
	fecha_registro DATETIME NOT NULL,
	telefono NUMERIC(18,0) NOT NULL,
	mail NVARCHAR(100) NOT NULL,
	fecha_nacimiento DATETIME NOT NULL
)

CREATE TABLE LOS_MAGIOS.pago(
	id INT IDENTITY PRIMARY KEY,
	venta_id INT NOT NULL,
	importe NUMERIC(18,2) NOT NULL,
	moneda_id INT NOT NULL,
	cotizacion NUMERIC(18,2) NOT NULL, 
	medio_de_pago_id INT NOT NULL
)

-- FOREIGN KEY
ALTER TABLE LOS_MAGIOS.anuncio
ADD CONSTRAINT FK_agente_id FOREIGN KEY (agente_id) REFERENCES LOS_MAGIOS.agente(id),
	CONSTRAINT FK_inmueble_id FOREIGN KEY (inmueble_id) REFERENCES LOS_MAGIOS.inmueble(id),
	CONSTRAINT FK_moneda_id FOREIGN KEY (moneda_id) REFERENCES LOS_MAGIOS.moneda(id),
	CONSTRAINT FK_estado_anuncio_id FOREIGN KEY (estado_anuncio_id) REFERENCES LOS_MAGIOS.estado_anuncio(id),
	CONSTRAINT FK_tipo_periodo_id FOREIGN KEY (tipo_periodo_id) REFERENCES LOS_MAGIOS.tipo_periodo(id),
	CONSTRAINT FK_tipo_operacion_id FOREIGN KEY (tipo_operacion_id) REFERENCES LOS_MAGIOS.tipo_operacion(id)

ALTER TABLE LOS_MAGIOS.inmueble
ADD CONSTRAINT FK_tipo_inmueble_id FOREIGN KEY (tipo_inmueble_id) REFERENCES LOS_MAGIOS.tipoInmueble(id),
	CONSTRAINT FK_propietario_id FOREIGN KEY (propietario_id) REFERENCES LOS_MAGIOS.propietario(id),
	CONSTRAINT FK_cant_ambientes_id FOREIGN KEY (cant_ambientes_id) REFERENCES LOS_MAGIOS.ambientes(id),
	CONSTRAINT FK_disposicion_id FOREIGN KEY (disposicion_id) REFERENCES LOS_MAGIOS.disposicion(id),
	CONSTRAINT FK_orientacion_id FOREIGN KEY (orientacion_id) REFERENCES LOS_MAGIOS.orientacion(id),
	CONSTRAINT FK_estado_inmueble_id FOREIGN KEY (estado_inmueble_id) REFERENCES LOS_MAGIOS.estado_inmueble(id),
	CONSTRAINT FK_barrio_id_inmueble FOREIGN KEY (barrio_id) REFERENCES LOS_MAGIOS.barrio(id),
	CONSTRAINT FK_localidad_id_inmueble FOREIGN KEY (localidad_id) REFERENCES LOS_MAGIOS.localidad(id),
	CONSTRAINT FK_provincia_id_inmueble FOREIGN KEY (provincia_id) REFERENCES LOS_MAGIOS.provincia(id)
	
ALTER TABLE LOS_MAGIOS.agente
ADD CONSTRAINT FK_sucursal_id FOREIGN KEY (sucursal_id) REFERENCES LOS_MAGIOS.sucursal(id)

ALTER TABLE LOS_MAGIOS.sucursal
ADD CONSTRAINT FK_localidad_id_sucursal FOREIGN KEY (localidad_id) REFERENCES LOS_MAGIOS.localidad(id),	
	CONSTRAINT FK_provincia_id_sucursal FOREIGN KEY (provincia_id) REFERENCES LOS_MAGIOS.provincia(id)


ALTER TABLE LOS_MAGIOS.alquiler
ADD CONSTRAINT FK_anuncio_id_alquiler FOREIGN KEY (anuncio_id) REFERENCES LOS_MAGIOS.anuncio(id),
	CONSTRAINT FK_inquilino_id FOREIGN KEY (inquilino_id) REFERENCES LOS_MAGIOS.inquilino(id),
	CONSTRAINT FK_estado_alquiler_id FOREIGN KEY (estado_alquiler_id) REFERENCES LOS_MAGIOS.estado_alquiler(id)

ALTER TABLE LOS_MAGIOS.pago_alquiler
ADD CONSTRAINT FK_alquiler_id FOREIGN KEY (alquiler_id) REFERENCES LOS_MAGIOS.alquiler(id),
	CONSTRAINT FK_medio_de_pago_id_pago_alquiler FOREIGN KEY (medio_de_pago_id) REFERENCES LOS_MAGIOS.medio_de_pago(id)

ALTER TABLE LOS_MAGIOS.venta
ADD CONSTRAINT FK_anuncio_id_venta FOREIGN KEY (anuncio_id) REFERENCES LOS_MAGIOS.anuncio(id),
	CONSTRAINT FK_comprador_id FOREIGN KEY (comprador_id) REFERENCES LOS_MAGIOS.comprador(id),
	CONSTRAINT FK_moneda_id_venta FOREIGN KEY (moneda_id) REFERENCES LOS_MAGIOS.moneda(id)

ALTER TABLE LOS_MAGIOS.pago
ADD CONSTRAINT FK_medio_de_pago_id_pago FOREIGN KEY (medio_de_pago_id) REFERENCES LOS_MAGIOS.medio_de_pago(id),
	CONSTRAINT FK_venta_id_pago FOREIGN KEY (venta_id) REFERENCES LOS_MAGIOS.venta(id)

ALTER TABLE LOS_MAGIOS.inmueble_x_caracteristicas
	ADD CONSTRAINT FK_inmueble_id_x_caracteristica FOREIGN KEY (inmueble_id) REFERENCES LOS_MAGIOS.inmueble(id),
		CONSTRAINT FK_caracteristicas_id FOREIGN KEY (caracteristicas_id) REFERENCES LOS_MAGIOS.caracteristicas(id)

ALTER TABLE LOS_MAGIOS.detalle_importe
	ADD CONSTRAINT FK_alquiler_id_detalle FOREIGN KEY (alquiler_id) REFERENCES LOS_MAGIOS.alquiler(id)

-- CREACION DE STORED PROCEDURES PARA MIGRACION
IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_tipo_operacion_anuncio')
	DROP PROCEDURE migrar_tipo_operacion_anuncio
GO

CREATE PROCEDURE migrar_tipo_operacion_anuncio
 AS
  BEGIN
	 INSERT INTO LOS_MAGIOS.tipo_operacion
	 (nombre)
	 SELECT DISTINCT m.ANUNCIO_TIPO_OPERACION
	 FROM gd_esquema.Maestra AS m 
	 WHERE m.ANUNCIO_TIPO_OPERACION IS NOT NULL
  END
GO

IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_tipo_periodo_anuncio')
	DROP PROCEDURE migrar_tipo_periodo_anuncio
GO

CREATE PROCEDURE migrar_tipo_periodo_anuncio
 AS
  BEGIN
	 INSERT INTO LOS_MAGIOS.tipo_periodo
	 (nombre)
	 SELECT DISTINCT m.ANUNCIO_TIPO_PERIODO
	 FROM gd_esquema.Maestra AS m 
	 WHERE m.ANUNCIO_TIPO_PERIODO IS NOT NULL
  END
GO

IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_estado_anuncio')
	DROP PROCEDURE migrar_estado_anuncio
GO

CREATE PROCEDURE migrar_estado_anuncio
 AS
  BEGIN
	 INSERT INTO LOS_MAGIOS.estado_anuncio
	 (nombre)
	 SELECT DISTINCT m.ANUNCIO_ESTADO 
	 FROM gd_esquema.Maestra AS m
	 WHERE m.ANUNCIO_ESTADO IS NOT NULL
  END
GO


IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_estado_inmueble')
	DROP PROCEDURE migrar_estado_inmueble
GO

CREATE PROCEDURE migrar_estado_inmueble
 AS
  BEGIN
	 INSERT INTO LOS_MAGIOS.estado_inmueble
	(nombre)
	 SELECT DISTINCT m.INMUEBLE_ESTADO 
	 FROM gd_esquema.Maestra AS m
	 WHERE m.INMUEBLE_ESTADO IS NOT NULL
  END
GO

IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_estado_alquiler')
	DROP PROCEDURE migrar_estado_alquiler
GO

CREATE PROCEDURE migrar_estado_alquiler
 AS
  BEGIN
	 INSERT INTO LOS_MAGIOS.estado_alquiler
	(nombre)
	 SELECT DISTINCT m.ALQUILER_ESTADO
	 FROM gd_esquema.Maestra AS m
	 WHERE m.ALQUILER_ESTADO IS NOT NULL
  END
GO

IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_provincia')
	DROP PROCEDURE migrar_provincia
GO

CREATE PROCEDURE migrar_provincia
 AS
  BEGIN
	 INSERT INTO LOS_MAGIOS.provincia 
	 (nombre)
	 SELECT DISTINCT m.INMUEBLE_PROVINCIA 
	 FROM gd_esquema.Maestra AS m
	 WHERE m.INMUEBLE_PROVINCIA IS NOT NULL
  END
GO

IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_localidad')
	DROP PROCEDURE migrar_localidad
GO
CREATE PROCEDURE migrar_localidad
 AS
  BEGIN
	 INSERT INTO LOS_MAGIOS.localidad (nombre)
	 (SELECT DISTINCT m.INMUEBLE_LOCALIDAD
	 FROM gd_esquema.Maestra AS m
	 WHERE m.INMUEBLE_LOCALIDAD IS NOT NULL
	 UNION
	 SELECT DISTINCT m.SUCURSAL_LOCALIDAD 
	 FROM gd_esquema.Maestra AS m
	 WHERE m.SUCURSAL_LOCALIDAD IS NOT NULL) 
  END
GO

IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_barrio')
	DROP PROCEDURE migrar_barrio
GO

CREATE PROCEDURE migrar_barrio
 AS
  BEGIN
     INSERT INTO LOS_MAGIOS.barrio (nombre)
	 SELECT DISTINCT m.INMUEBLE_BARRIO
	 FROM gd_esquema.Maestra AS m 
	 WHERE m.INMUEBLE_BARRIO IS NOT NULL
  END
GO

IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_moneda')
	DROP PROCEDURE migrar_moneda
GO

CREATE PROCEDURE migrar_moneda
 AS
  BEGIN
     INSERT INTO LOS_MAGIOS.moneda(nombre)
	 SELECT DISTINCT m.ANUNCIO_MONEDA
	 FROM gd_esquema.Maestra AS m
	 WHERE m.ANUNCIO_MONEDA IS NOT NULL
  END
GO

IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_medio_de_pago')
	DROP PROCEDURE migrar_medio_de_pago
GO

CREATE PROCEDURE migrar_medio_de_pago
 AS
  BEGIN
     INSERT INTO LOS_MAGIOS.medio_de_pago(nombre)
	 SELECT DISTINCT m.PAGO_ALQUILER_MEDIO_PAGO
	 FROM gd_esquema.Maestra AS m
	 WHERE m.PAGO_ALQUILER_MEDIO_PAGO IS NOT NULL
  END
GO


IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_ambientes')
	DROP PROCEDURE migrar_ambientes
GO

CREATE PROCEDURE migrar_ambientes
 AS
  BEGIN
     INSERT INTO LOS_MAGIOS.ambientes(nombre)
	 SELECT DISTINCT m.INMUEBLE_CANT_AMBIENTES
	 FROM gd_esquema.Maestra AS m
	 WHERE m.INMUEBLE_CANT_AMBIENTES IS NOT NULL
  END
GO

IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_disposicion')
	DROP PROCEDURE migrar_disposicion
GO

CREATE PROCEDURE migrar_disposicion
 AS
  BEGIN
     INSERT INTO LOS_MAGIOS.disposicion(nombre)
	 SELECT DISTINCT m.INMUEBLE_DISPOSICION
	 FROM gd_esquema.Maestra AS m
	 WHERE m.INMUEBLE_DISPOSICION IS NOT NULL
  END
GO

IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_orientacion')
	DROP PROCEDURE migrar_orientacion
GO

CREATE PROCEDURE migrar_orientacion
 AS
  BEGIN
     INSERT INTO LOS_MAGIOS.orientacion(nombre)
	 SELECT DISTINCT m.INMUEBLE_ORIENTACION
	 FROM gd_esquema.Maestra AS m
	 WHERE m.INMUEBLE_ORIENTACION IS NOT NULL
  END
GO

IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_sucursal')
	DROP PROCEDURE migrar_sucursal
GO

CREATE PROCEDURE migrar_sucursal
 AS
  BEGIN
     INSERT INTO LOS_MAGIOS.sucursal
	 (codigo, nombre, direccion, telefono, localidad_id, provincia_id)
	 SELECT DISTINCT SUCURSAL_CODIGO, SUCURSAL_NOMBRE, SUCURSAL_DIRECCION, SUCURSAL_TELEFONO, l.id, p.id
	 FROM gd_esquema.Maestra AS m
	  JOIN LOS_MAGIOS.localidad l ON m.SUCURSAL_LOCALIDAD = l.nombre
	  JOIN LOS_MAGIOS.provincia p ON m.SUCURSAL_PROVINCIA = p.nombre
	 WHERE m.SUCURSAL_CODIGO IS NOT NULL 
  END
GO

IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_agente')
	DROP PROCEDURE migrar_agente
GO

CREATE PROCEDURE migrar_agente
 AS
  BEGIN
     INSERT INTO LOS_MAGIOS.agente
	 (nombre, apellido, dni, fecha_registro, telefono, mail, fecha_nacimiento, sucursal_id)
	 SELECT DISTINCT AGENTE_NOMBRE, AGENTE_APELLIDO, AGENTE_DNI, AGENTE_FECHA_REGISTRO, AGENTE_TELEFONO, AGENTE_MAIL, AGENTE_FECHA_NAC, s.id
	 FROM gd_esquema.Maestra AS m
	  LEFT JOIN LOS_MAGIOS.sucursal s ON s.codigo = m.SUCURSAL_CODIGO
	 WHERE m.AGENTE_DNI IS NOT NULL
  END
GO

IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_inquilino')
	DROP PROCEDURE migrar_inquilino
GO

CREATE PROCEDURE migrar_inquilino
 AS
  BEGIN
     INSERT INTO LOS_MAGIOS.inquilino
	 (nombre, apellido, dni, fecha_registro, telefono, mail, fecha_de_nacimiento)
	 SELECT DISTINCT INQUILINO_NOMBRE, INQUILINO_APELLIDO, INQUILINO_DNI, INQUILINO_FECHA_REGISTRO, INQUILINO_TELEFONO, INQUILINO_MAIL, INQUILINO_FECHA_NAC
	 FROM gd_esquema.Maestra AS m
	 WHERE m.INQUILINO_DNI IS NOT NULL
  END
GO



IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_comprador')
	DROP PROCEDURE migrar_comprador
GO

CREATE PROCEDURE migrar_comprador
 AS
  BEGIN
     INSERT INTO LOS_MAGIOS.comprador
	 (nombre, apellido, dni, fecha_registro, telefono, mail, fecha_nacimiento)
	 SELECT DISTINCT COMPRADOR_NOMBRE, COMPRADOR_APELLIDO, COMPRADOR_DNI, COMPRADOR_FECHA_REGISTRO, AGENTE_TELEFONO, COMPRADOR_MAIL, COMPRADOR_FECHA_NAC
	 FROM gd_esquema.Maestra AS m
	 WHERE m.COMPRADOR_DNI IS NOT NULL
  END
GO



IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_pago_alquiler')
	DROP PROCEDURE migrar_pago_alquiler
GO

CREATE PROCEDURE migrar_pago_alquiler
 AS
  BEGIN
     INSERT INTO LOS_MAGIOS.pago_alquiler
	 (codigo,alquiler_id, fecha_pago, fecha_vencimiento_pago, nro_periodo_pago, descripcion, fecha_inicio_periodo, fecha_fin_periodo, importe, medio_de_pago_id)
	 SELECT DISTINCT PAGO_ALQUILER_CODIGO, MIN(a.id), PAGO_ALQUILER_FECHA, PAGO_ALQUILER_FECHA_VENCIMIENTO, PAGO_ALQUILER_NRO_PERIODO, PAGO_ALQUILER_DESC, PAGO_ALQUILER_FEC_INI, PAGO_ALQUILER_FEC_FIN,
	 PAGO_ALQUILER_IMPORTE, mp.id
	 FROM gd_esquema.Maestra AS m
	  JOIN LOS_MAGIOS.medio_de_pago mp ON mp.nombre = PAGO_ALQUILER_MEDIO_PAGO
	  JOIN LOS_MAGIOS.alquiler a ON a.codigo = m.ALQUILER_CODIGO
	 WHERE m.PAGO_ALQUILER_CODIGO IS NOT NULL
	 GROUP BY PAGO_ALQUILER_CODIGO, PAGO_ALQUILER_FECHA, PAGO_ALQUILER_FECHA_VENCIMIENTO, PAGO_ALQUILER_NRO_PERIODO, PAGO_ALQUILER_DESC, 
	 PAGO_ALQUILER_FEC_INI, PAGO_ALQUILER_FEC_FIN, PAGO_ALQUILER_IMPORTE, mp.id;
  END
GO


IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_propietario')
	DROP PROCEDURE migrar_propietario
GO

CREATE PROCEDURE migrar_propietario
 AS
  BEGIN
     INSERT INTO LOS_MAGIOS.propietario
	 (nombre, apellido, dni, fecha_de_registro, telefono, fecha_de_nacimiento)
	 SELECT DISTINCT PROPIETARIO_NOMBRE, PROPIETARIO_APELLIDO, PROPIETARIO_DNI, PROPIETARIO_FECHA_REGISTRO, PROPIETARIO_TELEFONO, PROPIETARIO_FECHA_NAC
	 FROM gd_esquema.Maestra AS m
	 WHERE m.PROPIETARIO_DNI IS NOT NULL
  END
GO

IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_caracteristicas')
	DROP PROCEDURE migrar_caracteristicas
GO

CREATE PROCEDURE migrar_caracteristicas
 AS
  BEGIN
     INSERT INTO LOS_MAGIOS.caracteristicas
	 (cable, calefaccion, gas, wifi)
	 SELECT DISTINCT INMUEBLE_CARACTERISTICA_CABLE, INMUEBLE_CARACTERISTICA_CALEFACCION, INMUEBLE_CARACTERISTICA_GAS, INMUEBLE_CARACTERISTICA_WIFI
	 FROM gd_esquema.Maestra AS m
	 WHERE m.INMUEBLE_CARACTERISTICA_CABLE IS NOT NULL 
	 AND INMUEBLE_CARACTERISTICA_CALEFACCION IS NOT NULL
	 AND INMUEBLE_CARACTERISTICA_GAS IS NOT NULL
	 AND INMUEBLE_CARACTERISTICA_WIFI IS NOT NULL
  END
GO


IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_tipo_inmueble')
	DROP PROCEDURE migrar_tipo_inmueble
GO

CREATE PROCEDURE migrar_tipo_inmueble
 AS
  BEGIN
     INSERT INTO LOS_MAGIOS.tipoInmueble
	 (nombre)
	 SELECT DISTINCT INMUEBLE_TIPO_INMUEBLE
	 FROM gd_esquema.Maestra AS m
	 WHERE m.INMUEBLE_TIPO_INMUEBLE IS NOT NULL
  END
GO


IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_inmueble')
	DROP PROCEDURE migrar_inmueble
GO

CREATE PROCEDURE migrar_inmueble
 AS
  BEGIN
     INSERT INTO LOS_MAGIOS.inmueble
	 (codigo,nombre, tipo_inmueble_id, descripcion, propietario_id, direccion ,cant_ambientes_id, superficieTotal, disposicion_id, orientacion_id, 
	 estado_inmueble_id, antiguedad, expensas, barrio_id, provincia_id, localidad_id)
	 SELECT DISTINCT INMUEBLE_CODIGO ,INMUEBLE_NOMBRE, ti.id, INMUEBLE_DESCRIPCION, p.id, INMUEBLE_DIRECCION, a.id, INMUEBLE_SUPERFICIETOTAL, d.id, o.id,
	 ei.id, INMUEBLE_ANTIGUEDAD, INMUEBLE_EXPESAS, b.id, pro.id, l.id
	 FROM gd_esquema.Maestra AS m
	  JOIN LOS_MAGIOS.tipoInmueble ti ON ti.nombre = m.INMUEBLE_TIPO_INMUEBLE
	  JOIN LOS_MAGIOS.ambientes a ON a.nombre = m.INMUEBLE_CANT_AMBIENTES
	  JOIN LOS_MAGIOS.disposicion d ON d.nombre = m.INMUEBLE_DISPOSICION
	  JOIN LOS_MAGIOS.orientacion o ON o.nombre = m.INMUEBLE_ORIENTACION
	  JOIN LOS_MAGIOS.estado_inmueble ei ON ei.nombre = m.INMUEBLE_ESTADO 
	  JOIN LOS_MAGIOS.barrio b ON b.nombre = m.INMUEBLE_BARRIO
	  JOIN LOS_MAGIOS.provincia pro ON pro.nombre = m.INMUEBLE_PROVINCIA
	  JOIN LOS_MAGIOS.localidad l ON l.nombre = m.INMUEBLE_LOCALIDAD
	  JOIN LOS_MAGIOS.propietario p ON p.dni = m.PROPIETARIO_DNI
	 WHERE m.INMUEBLE_CODIGO IS NOT NULL 
  END
GO

IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_anuncio')
	DROP PROCEDURE migrar_anuncio
GO


CREATE PROCEDURE migrar_anuncio
 AS
  BEGIN
     INSERT INTO LOS_MAGIOS.anuncio
	 (codigo, fecha_publicacion, agente_id, tipo_operacion_id, inmueble_id, precio_publicado, moneda_id, tipo_periodo_id, 
	 estado_anuncio_id, fecha_finalizacion_anuncio, costo_publicacion)
	 SELECT DISTINCT m.ANUNCIO_CODIGO, m.ANUNCIO_FECHA_PUBLICACION, a.id, tp.id, i.id, ANUNCIO_PRECIO_PUBLICADO, mo.id,
	 tipo_p.id, ea.id, ANUNCIO_FECHA_FINALIZACION, ANUNCIO_COSTO_ANUNCIO
	 FROM gd_esquema.Maestra AS m
	  JOIN LOS_MAGIOS.tipo_operacion tp ON m.ANUNCIO_TIPO_OPERACION = tp.nombre
	  JOIN LOS_MAGIOS.moneda mo ON m.ANUNCIO_MONEDA = mo.nombre
	  JOIN LOS_MAGIOS.tipo_periodo tipo_p ON m.ANUNCIO_TIPO_PERIODO = tipo_p.nombre
	  JOIN LOS_MAGIOS.estado_anuncio ea ON m.ANUNCIO_ESTADO = ea.nombre
	  JOIN LOS_MAGIOS.agente a ON  a.dni = m.AGENTE_DNI
	  JOIN LOS_MAGIOS.inmueble i ON i.codigo = INMUEBLE_CODIGO
	 WHERE m.ANUNCIO_CODIGO IS NOT NULL 
  END
GO


IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_venta')
	DROP PROCEDURE migrar_venta
GO

CREATE PROCEDURE migrar_venta
 AS
  BEGIN
     INSERT INTO LOS_MAGIOS.venta
	 (codigo, anuncio_id, comprador_id, fecha_venta, precio_venta, moneda_id, comision)
	SELECT DISTINCT VENTA_CODIGO, a.id, c.id, VENTA_FECHA, VENTA_PRECIO_VENTA, mo.id, VENTA_COMISION
	FROM gd_esquema.Maestra AS m
	JOIN LOS_MAGIOS.moneda mo ON mo.nombre = VENTA_MONEDA
	JOIN LOS_MAGIOS.anuncio a ON a.codigo = m.ANUNCIO_CODIGO
	JOIN LOS_MAGIOS.comprador c ON c.dni = COMPRADOR_DNI
	WHERE m.VENTA_CODIGO IS NOT NULL
  END
GO

IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_alquiler')
	DROP PROCEDURE migrar_alquiler
GO

CREATE PROCEDURE migrar_alquiler
 AS
  BEGIN
     INSERT INTO LOS_MAGIOS.alquiler
	 (codigo, anuncio_id, cantidad_periodos, inquilino_id, fecha_inicio, fecha_fin, deposito, comision, gasto_averiguaciones, estado_alquiler_id)
	 SELECT DISTINCT ALQUILER_CODIGO, a.id, ALQUILER_CANT_PERIODOS, i.id, ALQUILER_FECHA_INICIO, ALQUILER_FECHA_FIN, ALQUILER_DEPOSITO, 
	 ALQUILER_COMISION, ALQUILER_GASTOS_AVERIGUA, ea.id	 
	  FROM gd_esquema.Maestra AS m												   
	  JOIN LOS_MAGIOS.estado_alquiler ea ON ea.nombre = ALQUILER_ESTADO
	  JOIN LOS_MAGIOS.anuncio a ON a.codigo = m.ANUNCIO_CODIGO
	  JOIN LOS_MAGIOS.inquilino i ON i.dni = m.INQUILINO_DNI
	 WHERE ALQUILER_CODIGO IS NOT NULL;
  END
GO

IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_detalle_importe')
	DROP PROCEDURE migrar_detalle_importe
GO

CREATE PROCEDURE migrar_detalle_importe
 AS
  BEGIN
     INSERT INTO LOS_MAGIOS.detalle_importe	
	 (alquiler_id, nro_pedido_fin, nro_pedido_inicio, precio)
	SELECT DISTINCT a.id, DETALLE_ALQ_NRO_PERIODO_FIN, DETALLE_ALQ_NRO_PERIODO_INI, DETALLE_ALQ_PRECIO
	FROM gd_esquema.Maestra AS m
	JOIN LOS_MAGIOS.alquiler a ON a.codigo = ALQUILER_CODIGO
	WHERE DETALLE_ALQ_NRO_PERIODO_FIN IS NOT NULL AND 
	      DETALLE_ALQ_NRO_PERIODO_INI IS NOT NULL AND 
		  DETALLE_ALQ_PRECIO IS NOT NULL
    END
GO

IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_pago_venta')
	DROP PROCEDURE migrar_pago_venta
GO

CREATE PROCEDURE migrar_pago_venta
 AS
  BEGIN
     INSERT INTO LOS_MAGIOS.pago
	 (venta_id, importe, moneda_id, cotizacion, medio_de_pago_id)
	 SELECT DISTINCT v.id, PAGO_VENTA_IMPORTE, mo.id, PAGO_VENTA_COTIZACION, mp.id
	 FROM gd_esquema.Maestra AS m
	  JOIN LOS_MAGIOS.moneda mo ON m.PAGO_VENTA_MONEDA = mo.nombre
	  JOIN LOS_MAGIOS.medio_de_pago mp ON mp.nombre = m.PAGO_VENTA_MEDIO_PAGO
	  JOIN LOS_MAGIOS.venta v ON v.codigo = VENTA_CODIGO
	 WHERE m.COMPRADOR_DNI IS NOT NULL
  END
GO

IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_inmueble_x_caracteristicas')
	DROP PROCEDURE migrar_inmueble_x_caracteristicas
GO

CREATE PROCEDURE migrar_inmueble_x_caracteristicas
 AS
  BEGIN
     INSERT INTO LOS_MAGIOS.inmueble_x_caracteristicas
	 (inmueble_id, caracteristicas_id)
	 SELECT DISTINCT  i.id, c.id
	 FROM gd_esquema.Maestra AS m
	  JOIN LOS_MAGIOS.inmueble i ON i.codigo = INMUEBLE_CODIGO
	  JOIN LOS_MAGIOS.caracteristicas c ON (c.cable = INMUEBLE_CARACTERISTICA_CABLE AND
											c.calefaccion = INMUEBLE_CARACTERISTICA_CALEFACCION AND
											c.gas = INMUEBLE_CARACTERISTICA_GAS AND
											c.wifi = INMUEBLE_CARACTERISTICA_WIFI
											)
	 WHERE m.INMUEBLE_CODIGO IS NOT NULL
  END
GO

-- EJECUCION DE STORED PROCEDURES PARA LA MIGRACION
BEGIN TRANSACTION

BEGIN TRY 
	EXECUTE migrar_tipo_operacion_anuncio
	EXECUTE migrar_tipo_periodo_anuncio
	EXECUTE migrar_estado_anuncio
	EXECUTE migrar_provincia
	EXECUTE migrar_estado_inmueble
	EXECUTE migrar_estado_alquiler
	EXECUTE migrar_localidad
	EXECUTE migrar_barrio
	EXECUTE migrar_moneda
	EXECUTE migrar_medio_de_pago
	EXECUTE migrar_tipo_inmueble
	EXECUTE migrar_ambientes
	EXECUTE migrar_disposicion
	EXECUTE migrar_orientacion
	EXECUTE migrar_sucursal
	EXECUTE migrar_agente
	EXECUTE migrar_propietario
	EXECUTE migrar_inquilino
	EXECUTE migrar_comprador
	EXECUTE migrar_caracteristicas
	EXECUTE migrar_inmueble
	EXECUTE migrar_anuncio
	EXECUTE migrar_alquiler
	EXECUTE migrar_detalle_importe
	EXECUTE migrar_venta
	EXECUTE migrar_pago_venta
	EXECUTE migrar_pago_alquiler
	EXECUTE migrar_inmueble_x_caracteristicas
END TRY 

BEGIN CATCH  
	ROLLBACK TRANSACTION;
	THROW 50000, 'Error al migrar', 1;
END CATCH  

COMMIT TRANSACTION


-- ELIMICAION DE PROCEDURES
/*
DROP PROCEDURE IF EXISTS migrar_tipo_operacion_anuncio;
DROP PROCEDURE IF EXISTS migrar_tipo_periodo_anuncio;
DROP PROCEDURE IF EXISTS migrar_estado_anuncio;
DROP PROCEDURE IF EXISTS migrar_provincia;
DROP PROCEDURE IF EXISTS migrar_estado_inmueble;
DROP PROCEDURE IF EXISTS migrar_estado_alquiler;
DROP PROCEDURE IF EXISTS migrar_localidad;
DROP PROCEDURE IF EXISTS migrar_barrio;
DROP PROCEDURE IF EXISTS migrar_moneda;
DROP PROCEDURE IF EXISTS migrar_medio_de_pago;
DROP PROCEDURE IF EXISTS migrar_tipo_inmueble;
DROP PROCEDURE IF EXISTS migrar_ambientes;
DROP PROCEDURE IF EXISTS migrar_disposicion;
DROP PROCEDURE IF EXISTS migrar_orientacion;
DROP PROCEDURE IF EXISTS migrar_sucursal;
DROP PROCEDURE IF EXISTS migrar_agente;
DROP PROCEDURE IF EXISTS migrar_propietario;
DROP PROCEDURE IF EXISTS migrar_inquilino;
DROP PROCEDURE IF EXISTS migrar_comprador;
DROP PROCEDURE IF EXISTS migrar_pago_venta;
DROP PROCEDURE IF EXISTS migrar_caracteristicas;
DROP PROCEDURE IF EXISTS migrar_inmueble;
DROP PROCEDURE IF EXISTS migrar_anuncio;
DROP PROCEDURE IF EXISTS migrar_alquiler;
DROP PROCEDURE IF EXISTS migrar_pago_alquiler;
DROP PROCEDURE IF EXISTS migrar_venta;
*/

-- SELECT'S DE TABLAS
/*
SELECT * FROM LOS_MAGIOS.agente;
SELECT * FROM LOS_MAGIOS.alquiler;
SELECT * FROM LOS_MAGIOS.ambientes;
SELECT * FROM LOS_MAGIOS.anuncio;
SELECT * FROM LOS_MAGIOS.barrio;
SELECT * FROM LOS_MAGIOS.caracteristicas;
SELECT * FROM LOS_MAGIOS.comprador;
SELECT * FROM LOS_MAGIOS.detalle_importe;
SELECT * FROM LOS_MAGIOS.disposicion;
SELECT * FROM LOS_MAGIOS.estado_alquiler;
SELECT * FROM LOS_MAGIOS.estado_anuncio;
SELECT * FROM LOS_MAGIOS.estado_inmueble;
SELECT * FROM LOS_MAGIOS.inmueble;
SELECT * FROM LOS_MAGIOS.inquilino;
SELECT * FROM LOS_MAGIOS.localidad;
SELECT * FROM LOS_MAGIOS.medio_de_pago;
SELECT * FROM LOS_MAGIOS.moneda;
SELECT * FROM LOS_MAGIOS.orientacion;
SELECT * FROM LOS_MAGIOS.pago;
SELECT * FROM LOS_MAGIOS.pago_alquiler;
SELECT * FROM LOS_MAGIOS.propietario;
SELECT * FROM LOS_MAGIOS.provincia;
SELECT * FROM LOS_MAGIOS.sucursal;
SELECT * FROM LOS_MAGIOS.tipo_operacion;
SELECT * FROM LOS_MAGIOS.tipo_periodo;
SELECT * FROM LOS_MAGIOS.tipoInmueble;
SELECT * FROM LOS_MAGIOS.venta;
SELECT * FROM LOS_MAGIOS.inmueble_x_caracteristicas;
*/
