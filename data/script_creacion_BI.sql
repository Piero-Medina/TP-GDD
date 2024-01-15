USE GD2C2023;
GO

-- DROPS DE FKS

-- FKS SUCURSAL
IF EXISTS(SELECT 1 
		  FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
		  WHERE CONSTRAINT_NAME = 'FK_BI_ubicacion_id')
BEGIN    -- Eliminar la clave foránea si existe
    ALTER TABLE LOS_MAGIOS.BI_sucursal
    DROP CONSTRAINT FK_BI_ubicacion_id;
END

-- FKS AGENTE
IF EXISTS(SELECT 1 
		  FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
		  WHERE CONSTRAINT_NAME = 'FK_BI_sucursal_id_agente')
BEGIN    -- Eliminar la clave foránea si existe
    ALTER TABLE LOS_MAGIOS.BI_agente
    DROP CONSTRAINT FK_BI_sucursal_id_agente;
END


-- FKS ANUNCIO
IF EXISTS(SELECT 1 
		  FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
		  WHERE CONSTRAINT_NAME = 'FK_BI_tipo_operacion_id')
BEGIN    -- Eliminar la clave foránea si existe
    ALTER TABLE LOS_MAGIOS.BI_anuncio
    DROP CONSTRAINT FK_BI_tipo_operacion_id;
END

IF EXISTS(SELECT 1 
		  FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
		  WHERE CONSTRAINT_NAME = 'FK_BI_moneda_id')
BEGIN    -- Eliminar la clave foránea si existe
    ALTER TABLE LOS_MAGIOS.BI_anuncio
    DROP CONSTRAINT FK_BI_moneda_id;
END

IF EXISTS(SELECT 1 
		  FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
		  WHERE CONSTRAINT_NAME = 'FK_BI_estado_anuncio_id')
BEGIN    -- Eliminar la clave foránea si existe
    ALTER TABLE LOS_MAGIOS.BI_anuncio
    DROP CONSTRAINT FK_BI_estado_anuncio_id;
END

IF EXISTS(SELECT 1 
		  FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
		  WHERE CONSTRAINT_NAME = 'FK_BI_inmueble_')
BEGIN    -- Eliminar la clave foránea si existe
    ALTER TABLE LOS_MAGIOS.BI_anuncio
    DROP CONSTRAINT FK_BI_inmueble_;
END

-- FKS INMUEBLE
IF EXISTS(SELECT 1 
		  FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
		  WHERE CONSTRAINT_NAME = 'FK_BI_tipo_inmueble_id')
BEGIN    -- Eliminar la clave foránea si existe
    ALTER TABLE LOS_MAGIOS.BI_inmueble
    DROP CONSTRAINT FK_BI_tipo_inmueble_id;
END

IF EXISTS(SELECT 1 
		  FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
		  WHERE CONSTRAINT_NAME = 'FK_BI_ambientes')
BEGIN    -- Eliminar la clave foránea si existe
    ALTER TABLE LOS_MAGIOS.BI_inmueble
    DROP CONSTRAINT FK_BI_ambientes;
END

IF EXISTS(SELECT 1 
		  FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
		  WHERE CONSTRAINT_NAME = 'FK_BI_rango_m2_id')
BEGIN    -- Eliminar la clave foránea si existe
    ALTER TABLE LOS_MAGIOS.BI_inmueble
    DROP CONSTRAINT FK_BI_rango_m2_id;
END

IF EXISTS(SELECT 1 
		  FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
		  WHERE CONSTRAINT_NAME = 'FK_BI_estado_inmueble_id')
BEGIN    -- Eliminar la clave foránea si existe
    ALTER TABLE LOS_MAGIOS.BI_inmueble
    DROP CONSTRAINT FK_BI_estado_inmueble_id;
END

-- FKS COMPRADOR

IF EXISTS(SELECT 1 
		  FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
		  WHERE CONSTRAINT_NAME = 'FK_BI_rango_etario_id_comprador')
BEGIN    -- Eliminar la clave foránea si existe
    ALTER TABLE LOS_MAGIOS.BI_comprador
    DROP CONSTRAINT FK_BI_rango_etario_id_comprador;
END

IF EXISTS(SELECT 1 
		  FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
		  WHERE CONSTRAINT_NAME = 'FK_BI_fecha_registro_id_comprador')
BEGIN    -- Eliminar la clave foránea si existe
    ALTER TABLE LOS_MAGIOS.BI_comprador
    DROP CONSTRAINT FK_BI_fecha_registro_id_comprador;
END

-- FKS PAGO

IF EXISTS(SELECT 1 
		  FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
		  WHERE CONSTRAINT_NAME = 'FK_BI_moneda_id_pago')
BEGIN    -- Eliminar la clave foránea si existe
    ALTER TABLE LOS_MAGIOS.BI_pago
    DROP CONSTRAINT FK_BI_moneda_id_pago;
END

IF EXISTS(SELECT 1 
		  FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
		  WHERE CONSTRAINT_NAME = 'FK_BI_medio_de_pago_id_pago')
BEGIN    -- Eliminar la clave foránea si existe
    ALTER TABLE LOS_MAGIOS.BI_pago
    DROP CONSTRAINT FK_BI_medio_de_pago_id_pago;
END

-- FKS VENTA

IF EXISTS(SELECT 1 
		  FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
		  WHERE CONSTRAINT_NAME = 'FK_BI_anuncio_id_venta')
BEGIN    -- Eliminar la clave foránea si existe
    ALTER TABLE LOS_MAGIOS.BI_venta
    DROP CONSTRAINT FK_BI_anuncio_id_venta;
END

IF EXISTS(SELECT 1 
		  FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
		  WHERE CONSTRAINT_NAME = 'FK_BI_comprador_id')
BEGIN    -- Eliminar la clave foránea si existe
    ALTER TABLE LOS_MAGIOS.BI_venta
    DROP CONSTRAINT FK_BI_comprador_id;
END

IF EXISTS(SELECT 1 
		  FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
		  WHERE CONSTRAINT_NAME = 'FK_BI_moneda_id_venta')
BEGIN    -- Eliminar la clave foránea si existe
    ALTER TABLE LOS_MAGIOS.BI_venta
    DROP CONSTRAINT FK_BI_moneda_id_venta;
END

IF EXISTS(SELECT 1 
		  FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
		  WHERE CONSTRAINT_NAME = 'FK_BI_pago_id')
BEGIN    -- Eliminar la clave foránea si existe
    ALTER TABLE LOS_MAGIOS.BI_venta
    DROP CONSTRAINT FK_BI_pago_id;
END

-- FKS INQUILINO

IF EXISTS(SELECT 1 
		  FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
		  WHERE CONSTRAINT_NAME = 'FK_BI_rango_etario_id_inquilino')
BEGIN    -- Eliminar la clave foránea si existe
    ALTER TABLE LOS_MAGIOS.BI_inquilino
    DROP CONSTRAINT FK_BI_rango_etario_id_inquilino;
END


IF EXISTS(SELECT 1 
		  FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
		  WHERE CONSTRAINT_NAME = 'FK_BI_fecha_registro_id_inquilino')
BEGIN    -- Eliminar la clave foránea si existe
    ALTER TABLE LOS_MAGIOS.BI_inquilino
    DROP CONSTRAINT FK_BI_fecha_registro_id_inquilino;
END

-- FKS ALQUILER

IF EXISTS(SELECT 1 
		  FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
		  WHERE CONSTRAINT_NAME = 'FK_BI_anuncio_id_alquiler')
BEGIN    -- Eliminar la clave foránea si existe
    ALTER TABLE LOS_MAGIOS.BI_alquiler
    DROP CONSTRAINT FK_BI_anuncio_id_alquiler;
END

IF EXISTS(SELECT 1 
		  FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
		  WHERE CONSTRAINT_NAME = 'FK_BI_inquilino_id_alquiler')
BEGIN    -- Eliminar la clave foránea si existe
    ALTER TABLE LOS_MAGIOS.BI_alquiler
    DROP CONSTRAINT FK_BI_inquilino_id_alquiler;
END

IF EXISTS(SELECT 1 
		  FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
		  WHERE CONSTRAINT_NAME = 'FK_BI_estado_alquiler_id')
BEGIN    -- Eliminar la clave foránea si existe
    ALTER TABLE LOS_MAGIOS.BI_alquiler
    DROP CONSTRAINT FK_BI_estado_alquiler_id;
END

IF EXISTS(SELECT 1 
		  FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
		  WHERE CONSTRAINT_NAME = 'FK_BI_detalle_importe_id')
BEGIN    -- Eliminar la clave foránea si existe
    ALTER TABLE LOS_MAGIOS.BI_alquiler
    DROP CONSTRAINT FK_BI_detalle_importe_id;
END

-- FKS PAGO ALQUILER

IF EXISTS(SELECT 1 
		  FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
		  WHERE CONSTRAINT_NAME = 'FK_BI_alquiler_id')
BEGIN    -- Eliminar la clave foránea si existe
    ALTER TABLE LOS_MAGIOS.BI_pago_alquiler
    DROP CONSTRAINT FK_BI_alquiler_id;
END

IF EXISTS(SELECT 1 
		  FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
		  WHERE CONSTRAINT_NAME = 'FK_BI_medio_de_pago_id_pago_alquiler')
BEGIN    -- Eliminar la clave foránea si existe
    ALTER TABLE LOS_MAGIOS.BI_pago_alquiler
    DROP CONSTRAINT FK_BI_medio_de_pago_id_pago_alquiler;
END


-- FUNCIONES AUXILIARES
IF EXISTS(SELECT [name] FROM sys.objects WHERE [name] = 'obtenerCuatrimestre')
	DROP FUNCTION LOS_MAGIOS.obtenerCuatrimestre
GO 

CREATE FUNCTION LOS_MAGIOS.obtenerCuatrimestre(@fecha DATE)
RETURNS INT
AS
BEGIN
    DECLARE @cuatrimestre NVARCHAR(20);

    SET @cuatrimestre = 
        CASE
            WHEN MONTH(@fecha) BETWEEN 1 AND 3 THEN 1
            WHEN MONTH(@fecha) BETWEEN 4 AND 6 THEN 2
            WHEN MONTH(@fecha) BETWEEN 7 AND 9 THEN 3
			WHEN MONTH(@fecha) BETWEEN 10 AND 12 THEN 4
            ELSE 0
        END;

    RETURN @cuatrimestre;
END;
GO

IF EXISTS(SELECT [name] FROM sys.objects WHERE [name] = 'obtenerRangoEtario')
	DROP FUNCTION LOS_MAGIOS.obtenerRangoEtario
GO
CREATE FUNCTION LOS_MAGIOS.obtenerRangoEtario(@fechaNacimiento DATE)
RETURNS NVARCHAR(50)
AS
BEGIN
    DECLARE @Edad INT;

    SET @Edad = DATEDIFF(YEAR, @fechaNacimiento, GETDATE());

    RETURN 
        CASE
            WHEN @Edad < 25 THEN '< 25'
            WHEN @Edad BETWEEN 25 AND 35 THEN '25 - 35'
            WHEN @Edad BETWEEN 36 AND 50 THEN '35 - 50'
            WHEN @Edad > 50 THEN '> 50'
            ELSE 'Error'
        END;
END;
GO

IF EXISTS(SELECT [name] FROM sys.objects WHERE [name] = 'ObtenerRangoM2')
	DROP FUNCTION LOS_MAGIOS.ObtenerRangoM2
GO

CREATE FUNCTION LOS_MAGIOS.ObtenerRangoM2(@valor numeric(18,2))
RETURNS NVARCHAR(50)
AS
BEGIN
    RETURN 
        CASE
            WHEN @valor < 35 THEN '< 35'
            WHEN @valor BETWEEN 35 AND 55 THEN '35 - 55'
            WHEN @valor BETWEEN 56 AND 75 THEN '55 - 75'
            WHEN @valor BETWEEN 76 AND 100 THEN '75 - 100'
            WHEN @valor > 100 THEN '> 100'
            ELSE 'Valor no válido'
        END;
END;
GO

-- CREACION DE TABLAS DIMENSIONALES
IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_tiempo')
	DROP TABLE  LOS_MAGIOS.BI_tiempo

CREATE TABLE LOS_MAGIOS.BI_tiempo(
	id INT IDENTITY PRIMARY KEY,
	anio INT, 
	cuatrimestre INT,
	mes INT
)

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_ubicacion')
	DROP TABLE  LOS_MAGIOS.BI_ubicacion

CREATE TABLE LOS_MAGIOS.BI_ubicacion(
	id INT IDENTITY PRIMARY KEY,
	provincia NVARCHAR(100),
	localidad NVARCHAR(100),
	barrio NVARCHAR(100)
)

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_sucursal')
	DROP TABLE  LOS_MAGIOS.BI_sucursal

CREATE TABLE LOS_MAGIOS.BI_sucursal(
	id INT IDENTITY PRIMARY KEY,
	codigo NUMERIC(18,0) NOT NULL,
	nombre NVARCHAR(100) NOT NULL,
	direccion NVARCHAR(100) NOT NULL,
	telefono NVARCHAR(100) NOT NULL,
	ubicacion_id INT NOT NULL
)

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_rango_etario')
	DROP TABLE  LOS_MAGIOS.BI_rango_etario

CREATE TABLE LOS_MAGIOS.BI_rango_etario(
	id INT IDENTITY PRIMARY KEY,
	nombre NVARCHAR(100) NOT NULL
)

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_tipo_inmueble')
	DROP TABLE  LOS_MAGIOS.BI_tipo_inmueble

CREATE TABLE LOS_MAGIOS.BI_tipo_inmueble(
	id INT IDENTITY PRIMARY KEY,
	nombre NVARCHAR(100) NOT NULL
)

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_ambientes')
	DROP TABLE  LOS_MAGIOS.BI_ambientes

CREATE TABLE LOS_MAGIOS.BI_ambientes(
	id INT IDENTITY PRIMARY KEY,
	nombre NVARCHAR(100) NOT NULL
)


IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_rango_m2')
	DROP TABLE  LOS_MAGIOS.BI_rango_m2

CREATE TABLE LOS_MAGIOS.BI_rango_m2(
	id INT IDENTITY PRIMARY KEY,
	nombre NVARCHAR(100) NOT NULL
)

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_tipo_operacion')
	DROP TABLE  LOS_MAGIOS.BI_tipo_operacion

CREATE TABLE LOS_MAGIOS.BI_tipo_operacion(
	id INT IDENTITY PRIMARY KEY,
	nombre NVARCHAR(100) NOT NULL
)

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_estado_anuncio')
	DROP TABLE  LOS_MAGIOS.BI_estado_anuncio

CREATE TABLE LOS_MAGIOS.BI_estado_anuncio(
	id INT IDENTITY PRIMARY KEY,
	nombre NVARCHAR(100) NOT NULL
)

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_comprador')
	DROP TABLE  LOS_MAGIOS.BI_comprador

CREATE TABLE LOS_MAGIOS.BI_comprador(
	id INT IDENTITY PRIMARY KEY,
	nombre NVARCHAR(100) NOT NULL,
	apellido NVARCHAR(100) NOT NULL,
	dni NUMERIC(18,2) NOT NULL,
	fecha_registro_id INT NOT NULL,
	telefono NUMERIC(18,0) NOT NULL,
	mail NVARCHAR(100) NOT NULL,
	rango_etario_id INT NOT NULL
)

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_moneda')
	DROP TABLE  LOS_MAGIOS.BI_moneda

CREATE TABLE LOS_MAGIOS.BI_moneda(
	id INT IDENTITY PRIMARY KEY,
	nombre NVARCHAR(100) NOT NULL
)

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_medio_de_pago')
	DROP TABLE  LOS_MAGIOS.BI_medio_de_pago

CREATE TABLE LOS_MAGIOS.BI_medio_de_pago(
	id INT IDENTITY PRIMARY KEY,
	nombre NVARCHAR(100) NOT NULL
)

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_estado_inmueble')
	DROP TABLE  LOS_MAGIOS.BI_estado_inmueble

CREATE TABLE LOS_MAGIOS.BI_estado_inmueble(
	id INT IDENTITY PRIMARY KEY,
	nombre NVARCHAR(100) NOT NULL
)

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_inmueble')
	DROP TABLE  LOS_MAGIOS.BI_inmueble

CREATE TABLE LOS_MAGIOS.BI_inmueble(
  id INT IDENTITY PRIMARY KEY,
  codigo NUMERIC(18, 0) NOT NULL,
  nombre NVARCHAR(100) NOT NULL,
  tipo_inmueble_id INT NOT NULL,
  descripcion NVARCHAR(100) NOT NULL,
  direccion NVARCHAR(100) NOT NULL,
  ambientes_id INT NOT NULL,
  rango_m2_id INT NOT NULL,
  estado_inmueble_id INT NOT NULL,
  antiguedad NUMERIC(18,0) NOT NULL,
  expensas NUMERIC(18,2) NOT NULL,
  ubicacion_id INT NOT NULL,
  superficie_total INT NOT NULL
);

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_pago')
	DROP TABLE  LOS_MAGIOS.BI_pago

CREATE TABLE LOS_MAGIOS.BI_pago(
	id INT IDENTITY PRIMARY KEY,
	importe NUMERIC(18,2) NOT NULL,
	moneda_id INT NOT NULL,
	cotizacion NUMERIC(18,2) NOT NULL, 
	medio_de_pago_id INT NOT NULL
)
IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_detalle_importe')
	DROP TABLE  LOS_MAGIOS.BI_detalle_importe

CREATE TABLE LOS_MAGIOS.BI_detalle_importe(
	id INT IDENTITY PRIMARY KEY,
	nro_pedido_inicio NUMERIC(18,0),
	nro_pedido_fin NUMERIC(18,0),
	precio NUMERIC(18,2)  
)
IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_inquilino')
	DROP TABLE  LOS_MAGIOS.BI_inquilino

CREATE TABLE LOS_MAGIOS.BI_inquilino(
	id INT IDENTITY PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	apellido VARCHAR(50) NOT NULL,
	dni NUMERIC(18,0) NOT NULL,
	fecha_registro_id INT NOT NULL,
	telefono NUMERIC(18,0) NOT NULL,
	mail NVARCHAR(100) NOT NULL,
	rango_etario_id INT NOT NULL
)
IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_estado_alquiler')
	DROP TABLE  LOS_MAGIOS.BI_estado_alquiler

CREATE TABLE LOS_MAGIOS.BI_estado_alquiler(
	id INT IDENTITY PRIMARY KEY,
	nombre VARCHAR(100)
)

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_agente')
	DROP TABLE  LOS_MAGIOS.BI_agente

CREATE TABLE LOS_MAGIOS.BI_agente(
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

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_pago_alquiler')
	DROP TABLE  LOS_MAGIOS.BI_pago_alquiler

CREATE TABLE LOS_MAGIOS.BI_pago_alquiler(
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
-- CREACION DE TABLAS DE HECHOS

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_anuncio')
	DROP TABLE  LOS_MAGIOS.BI_anuncio

CREATE TABLE LOS_MAGIOS.BI_anuncio(
	id INT IDENTITY NOT NULL PRIMARY KEY,
	codigo NUMERIC(19, 0) NOT NULL, 
	fecha_publicacion DATETIME NOT NULL, 
	agente_id INT NOT NULL,
	tipo_operacion_id INT NOT NULL,
	inmueble_id INT NOT NULL,
	precio_publicado NUMERIC(18,2) NOT NULL,
	moneda_id INT NOT NULL,
	estado_anuncio_id INT NOT NULL,
	fecha_finalizacion_anuncio DATETIME NOT NULL,
	costo_publicacion NUMERIC(18,2) NOT NULL,
)

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_venta')
	DROP TABLE  LOS_MAGIOS.BI_venta

CREATE TABLE LOS_MAGIOS.BI_venta(
	id INT IDENTITY PRIMARY KEY,
	codigo NUMERIC(18,0) NOT NULL,
	anuncio_id INT NOT NULL,
	comprador_id INT NOT NULL,
	fecha_venta_id INT NOT NULL,
	precio_venta NUMERIC(18,2) NOT NULL,
	moneda_id INT NOT NULL,
	pago_id INT NOT NULL,
	comision NUMERIC(18,2) NOT NULL
)

IF EXISTS(SELECT [name] FROM sys.tables WHERE [name] = 'BI_alquiler')
	DROP TABLE  LOS_MAGIOS.BI_alquiler

CREATE TABLE LOS_MAGIOS.BI_alquiler(
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
	estado_alquiler_id INT NOT NULL,
	detalle_importe_id INT NOT NULL
)


-- CONSTRAINTS
ALTER TABLE LOS_MAGIOS.BI_anuncio
	ADD CONSTRAINT FK_BI_tipo_operacion_id FOREIGN KEY (tipo_operacion_id) REFERENCES LOS_MAGIOS.BI_tipo_operacion(id),
		CONSTRAINT FK_BI_moneda_id FOREIGN KEY (moneda_id) REFERENCES LOS_MAGIOS.BI_moneda(id),
		CONSTRAINT FK_BI_estado_anuncio_id FOREIGN KEY (estado_anuncio_id) REFERENCES LOS_MAGIOS.BI_estado_anuncio(id),
		CONSTRAINT FK_BI_inmueble_ FOREIGN KEY (inmueble_id) REFERENCES LOS_MAGIOS.BI_inmueble(id)

ALTER TABLE LOS_MAGIOS.BI_agente
	ADD CONSTRAINT FK_BI_sucursal_id_agente FOREIGN KEY (sucursal_id) REFERENCES LOS_MAGIOS.BI_sucursal(id)

ALTER TABLE LOS_MAGIOS.BI_inmueble
	ADD CONSTRAINT FK_BI_tipo_inmueble_id FOREIGN KEY (tipo_inmueble_id) REFERENCES LOS_MAGIOS.BI_tipo_inmueble(id),
		CONSTRAINT FK_BI_ambientes FOREIGN KEY (ambientes_id) REFERENCES LOS_MAGIOS.BI_ambientes(id),
		CONSTRAINT FK_BI_rango_m2_id FOREIGN KEY (rango_m2_id) REFERENCES LOS_MAGIOS.BI_rango_m2(id),
		CONSTRAINT FK_BI_estado_inmueble_id FOREIGN KEY (estado_inmueble_id) REFERENCES LOS_MAGIOS.BI_estado_inmueble(id)


ALTER TABLE LOS_MAGIOS.BI_sucursal
	ADD CONSTRAINT FK_BI_ubicacion_id FOREIGN KEY (ubicacion_id) REFERENCES LOS_MAGIOS.BI_ubicacion(id)

ALTER TABLE LOS_MAGIOS.BI_comprador
	ADD CONSTRAINT FK_BI_rango_etario_id_comprador FOREIGN KEY (rango_etario_id) REFERENCES LOS_MAGIOS.BI_rango_etario(id),
		CONSTRAINT FK_BI_fecha_registro_id_comprador FOREIGN KEY (fecha_registro_id) REFERENCES LOS_MAGIOS.BI_tiempo(id)

ALTER TABLE LOS_MAGIOS.BI_pago
	ADD CONSTRAINT FK_BI_moneda_id_pago FOREIGN KEY (moneda_id) REFERENCES LOS_MAGIOS.BI_moneda(id),
		CONSTRAINT FK_BI_medio_de_pago_id_pago FOREIGN KEY (medio_de_pago_id) REFERENCES LOS_MAGIOS.BI_medio_de_pago(id)

ALTER TABLE LOS_MAGIOS.BI_venta
	ADD CONSTRAINT FK_BI_anuncio_id_venta FOREIGN KEY (anuncio_id) REFERENCES LOS_MAGIOS.BI_anuncio(id),
		CONSTRAINT FK_BI_comprador_id FOREIGN KEY (comprador_id) REFERENCES LOS_MAGIOS.BI_comprador(id),
		CONSTRAINT FK_BI_moneda_id_venta FOREIGN KEY (moneda_id) REFERENCES LOS_MAGIOS.BI_moneda(id),
		CONSTRAINT FK_BI_pago_id FOREIGN KEY (pago_id) REFERENCES LOS_MAGIOS.BI_pago(id)

ALTER TABLE LOS_MAGIOS.BI_alquiler
	ADD CONSTRAINT FK_BI_anuncio_id_alquiler FOREIGN KEY (anuncio_id) REFERENCES LOS_MAGIOS.BI_anuncio(id),
		CONSTRAINT FK_BI_inquilino_id_alquiler FOREIGN KEY (inquilino_id) REFERENCES LOS_MAGIOS.BI_inquilino(id),
		CONSTRAINT FK_BI_estado_alquiler_id FOREIGN KEY (estado_alquiler_id) REFERENCES LOS_MAGIOS.BI_estado_alquiler(id),
		CONSTRAINT FK_BI_detalle_importe_id FOREIGN KEY (detalle_importe_id) REFERENCES LOS_MAGIOS.BI_detalle_importe(id)

ALTER TABLE LOS_MAGIOS.BI_inquilino
	ADD CONSTRAINT FK_BI_rango_etario_id_inquilino FOREIGN KEY (rango_etario_id) REFERENCES LOS_MAGIOS.BI_rango_etario(id),
		CONSTRAINT FK_BI_fecha_registro_id_inquilino FOREIGN KEY (fecha_registro_id) REFERENCES LOS_MAGIOS.BI_tiempo(id)

ALTER TABLE LOS_MAGIOS.BI_pago_alquiler
	ADD CONSTRAINT FK_BI_alquiler_id FOREIGN KEY (alquiler_id) REFERENCES LOS_MAGIOS.BI_alquiler(id),
		CONSTRAINT FK_BI_medio_de_pago_id_pago_alquiler FOREIGN KEY (medio_de_pago_id) REFERENCES LOS_MAGIOS.BI_medio_de_pago(id)


-- PROCEDURES
IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_BI_tiempo')
	DROP PROCEDURE migrar_BI_tiempo
GO

CREATE PROCEDURE migrar_BI_tiempo
 AS
  BEGIN
	 DECLARE @FechaInicial DATE = '1920-01-01';
	 DECLARE @FechaFinal DATE = '2030-12-31'; 
    
	 WHILE @FechaInicial <= @FechaFinal
		BEGIN
			 INSERT INTO LOS_MAGIOS.BI_tiempo
			 VALUES (YEAR(@FechaInicial), LOS_MAGIOS.obtenerCuatrimestre(@FechaInicial), MONTH(@FechaInicial));
			 SET @FechaInicial = DATEADD(MONTH, 1, @FechaInicial);
END;
  END
GO

IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_BI_ubicacion')
	DROP PROCEDURE migrar_BI_ubicacion
GO

CREATE PROCEDURE migrar_BI_ubicacion
 AS
  BEGIN
     INSERT INTO LOS_MAGIOS.BI_ubicacion
	 (provincia, localidad, barrio)
	 SELECT DISTINCT INMUEBLE_PROVINCIA, INMUEBLE_LOCALIDAD, INMUEBLE_BARRIO FROM gd_esquema.Maestra
			WHERE INMUEBLE_PROVINCIA IS NOT NULL
	 UNION 
	 SELECT DISTINCT SUCURSAL_PROVINCIA, SUCURSAL_LOCALIDAD, NULL AS SUCURSAL_BARRIO  FROM gd_esquema.Maestra
	 WHERE SUCURSAL_LOCALIDAD IS NOT NULL
  END
GO

IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_BI_sucursal')
	DROP PROCEDURE migrar_BI_sucursal
GO

CREATE PROCEDURE migrar_BI_sucursal
 AS
  BEGIN
     INSERT INTO LOS_MAGIOS.BI_sucursal
	 (codigo, direccion, nombre, telefono, ubicacion_id)
	 SELECT DISTINCT s.codigo, s.direccion, l.nombre,telefono, u.id 
	 FROM LOS_MAGIOS.sucursal s
	 JOIN LOS_MAGIOS.localidad l ON l.id = s.localidad_id
	 JOIN LOS_MAGIOS.provincia p ON p.id = s.provincia_id
	 JOIN LOS_MAGIOS.BI_ubicacion u ON (p.nombre = u.provincia AND l.nombre = u.localidad)

  END
GO

IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_BI_detalle_importe')
	DROP PROCEDURE migrar_BI_detalle_importe
GO

CREATE PROCEDURE migrar_BI_detalle_importe
 AS
  BEGIN
     INSERT INTO LOS_MAGIOS.BI_detalle_importe
	 (nro_pedido_fin, nro_pedido_inicio, precio)
	 SELECT DISTINCT nro_pedido_fin, nro_pedido_inicio, precio
	 FROM LOS_MAGIOS.detalle_importe
  END
GO

IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_BI_rango_etario')
	DROP PROCEDURE migrar_BI_rango_etario
GO

CREATE PROCEDURE migrar_BI_rango_etario
 AS
  BEGIN
     INSERT INTO LOS_MAGIOS.BI_rango_etario VALUES
	 ('< 25'),
	 ('25 - 35'),
	 ('35 - 50'),
	 ('> 50')

  END
GO

IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_BI_tipo_inmueble')
	DROP PROCEDURE migrar_BI_tipo_inmueble
GO

CREATE PROCEDURE migrar_BI_tipo_inmueble
 AS
  BEGIN
     INSERT INTO LOS_MAGIOS.BI_tipo_inmueble
	 (nombre)
	 SELECT DISTINCT nombre
	 FROM LOS_MAGIOS.tipoInmueble
  END
GO

IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_BI_estado_inmueble')
	DROP PROCEDURE migrar_BI_estado_inmueble
GO

CREATE PROCEDURE migrar_BI_estado_inmueble
 AS
  BEGIN
     INSERT INTO LOS_MAGIOS.BI_estado_inmueble
	 (nombre)
	 SELECT DISTINCT nombre
	 FROM LOS_MAGIOS.estado_inmueble
  END
GO

IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_BI_estado_anuncio')
	DROP PROCEDURE migrar_BI_estado_anuncio
GO

CREATE PROCEDURE migrar_BI_estado_anuncio
 AS
  BEGIN
     INSERT INTO LOS_MAGIOS.BI_estado_anuncio
	 (nombre)
	 SELECT DISTINCT nombre
	 FROM LOS_MAGIOS.estado_anuncio
  END
GO

IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_BI_medio_de_pago')
	DROP PROCEDURE migrar_BI_medio_de_pago
GO

CREATE PROCEDURE migrar_BI_medio_de_pago
 AS
  BEGIN
     INSERT INTO LOS_MAGIOS.BI_medio_de_pago
	 (nombre)
	 SELECT DISTINCT nombre
	 FROM LOS_MAGIOS.medio_de_pago
  END
GO

IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_BI_comprador')
	DROP PROCEDURE migrar_BI_comprador
GO

CREATE PROCEDURE migrar_BI_comprador
 AS
  BEGIN
     INSERT INTO LOS_MAGIOS.BI_comprador
	 (nombre, apellido, dni, fecha_registro_id, telefono, mail, rango_etario_id)
	 SELECT DISTINCT c.nombre, apellido, dni, t.id, telefono, mail, re.id
	 FROM LOS_MAGIOS.comprador c
	 JOIN LOS_MAGIOS.BI_rango_etario re ON re.nombre = LOS_MAGIOS.obtenerRangoEtario(fecha_nacimiento)
	 JOIN LOS_MAGIOS.BI_tiempo t ON (t.cuatrimestre = LOS_MAGIOS.obtenerCuatrimestre(fecha_registro) AND
									t.anio = YEAR(fecha_registro) AND
									t.mes = MONTH(fecha_registro))
  END
GO

IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_BI_ambientes')
	DROP PROCEDURE migrar_BI_ambientes
GO

CREATE PROCEDURE migrar_BI_ambientes
 AS
  BEGIN
     INSERT INTO LOS_MAGIOS.BI_ambientes
	 (nombre)
	 SELECT DISTINCT nombre
	 FROM LOS_MAGIOS.ambientes
  END
GO

IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_BI_estado_alquiler')
	DROP PROCEDURE migrar_BI_estado_alquiler
GO

CREATE PROCEDURE migrar_BI_estado_alquiler
 AS
  BEGIN
     INSERT INTO LOS_MAGIOS.BI_estado_alquiler
	 (nombre)
	 SELECT DISTINCT nombre
	 FROM LOS_MAGIOS.estado_alquiler
  END
GO

IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_BI_rango_m2')
	DROP PROCEDURE migrar_BI_rango_m2
GO


CREATE PROCEDURE migrar_BI_rango_m2
 AS
  BEGIN
     INSERT INTO LOS_MAGIOS.BI_rango_m2 VALUES
	 ('< 35'),
	 ('35 - 55'),
	 ('55 - 75'),
	 ('75 - 100'),
	 ('> 100')

  END
GO


IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_BI_tipo_operacion')
	DROP PROCEDURE migrar_BI_tipo_operacion
GO

CREATE PROCEDURE migrar_BI_tipo_operacion
 AS
  BEGIN
     INSERT INTO LOS_MAGIOS.BI_tipo_operacion
	 (nombre)
	 SELECT DISTINCT nombre
	 FROM LOS_MAGIOS.tipo_operacion
  END
GO

IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_BI_pago')
	DROP PROCEDURE migrar_BI_pago
GO

CREATE PROCEDURE migrar_BI_pago
 AS
  BEGIN
     INSERT INTO LOS_MAGIOS.BI_pago
	 (importe, moneda_id, cotizacion, medio_de_pago_id)
	 SELECT DISTINCT importe, mo.id, cotizacion, mp.id
	 FROM LOS_MAGIOS.pago p
	 JOIN LOS_MAGIOS.BI_moneda mo ON mo.nombre IN (SELECT nombre FROM LOS_MAGIOS.moneda)
	 JOIN LOS_MAGIOS.BI_medio_de_pago mp ON mp.nombre IN (SELECT nombre FROM LOS_MAGIOS.medio_de_pago)

  END
GO

IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_BI_agente')
	DROP PROCEDURE migrar_BI_agente
GO

CREATE PROCEDURE migrar_BI_agente
 AS
  BEGIN
     INSERT INTO LOS_MAGIOS.BI_agente
	 (nombre, apellido, dni, fecha_registro, fecha_nacimiento, telefono, mail, sucursal_id)
	 SELECT DISTINCT a.nombre, apellido, dni, fecha_registro, fecha_nacimiento, a.telefono, mail, s.id
	 FROM LOS_MAGIOS.agente a
	 JOIN LOS_MAGIOS.BI_sucursal s ON a.sucursal_id = s.id

  END
GO

IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_BI_inquilino')
	DROP PROCEDURE migrar_BI_inquilino
GO

CREATE PROCEDURE migrar_BI_inquilino
 AS
  BEGIN
     INSERT INTO LOS_MAGIOS.BI_inquilino
	 (nombre, apellido, dni, fecha_registro_id, telefono, mail, rango_etario_id)
	 SELECT DISTINCT i.nombre, apellido, dni, t.id, telefono, mail, re.id
	 FROM LOS_MAGIOS.inquilino i
	 JOIN LOS_MAGIOS.BI_rango_etario re ON re.nombre = LOS_MAGIOS.obtenerRangoEtario(i.fecha_de_nacimiento)
	 JOIN LOS_MAGIOS.BI_tiempo t ON (t.cuatrimestre = LOS_MAGIOS.obtenerCuatrimestre(fecha_registro) AND
									t.anio = YEAR(fecha_registro) AND
									t.mes = MONTH(fecha_registro))

  END
GO

IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_BI_moneda')
	DROP PROCEDURE migrar_BI_moneda
GO

CREATE PROCEDURE migrar_BI_moneda
 AS
  BEGIN
     INSERT INTO LOS_MAGIOS.BI_moneda
	 (nombre)
	 SELECT DISTINCT nombre
	 FROM LOS_MAGIOS.moneda
  END
GO


IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_BI_estado_inmueble')
	DROP PROCEDURE migrar_BI_estado_inmueble
GO

CREATE PROCEDURE migrar_BI_estado_inmueble
 AS
  BEGIN
     INSERT INTO LOS_MAGIOS.BI_estado_inmueble
	 (nombre)
	 SELECT DISTINCT nombre
	 FROM LOS_MAGIOS.estado_inmueble
  END
GO

IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_BI_inmueble')
	DROP PROCEDURE migrar_BI_inmueble
GO


CREATE PROCEDURE migrar_BI_inmueble
 AS
  BEGIN
     INSERT INTO LOS_MAGIOS.BI_inmueble
	 (codigo, nombre, tipo_inmueble_id, descripcion, direccion, ambientes_id, rango_m2_id, antiguedad, expensas, ubicacion_id, estado_inmueble_id, superficie_total)
	 SELECT DISTINCT codigo, i.nombre, tipo_inmueble_id, descripcion, direccion, cant_ambientes_id, rm2.id, antiguedad, expensas, u.id, estado_inmueble_id, superficieTotal
	 FROM LOS_MAGIOS.inmueble i
	 JOIN LOS_MAGIOS.localidad l ON i.localidad_id = l.id
	 JOIN LOS_MAGIOS.barrio b ON i.barrio_id = b.id
	 JOIN LOS_MAGIOS.provincia p ON i.provincia_id = p.id
	 JOIN LOS_MAGIOS.BI_ubicacion u ON (u.barrio = b.nombre AND u.localidad = l.nombre AND u.provincia = u.provincia)
	 JOIN LOS_MAGIOS.BI_rango_m2 rm2 ON LOS_MAGIOS.ObtenerRangoM2(superficieTotal) = rm2.nombre
  END
GO


IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_BI_anuncio')
	DROP PROCEDURE migrar_BI_anuncio
GO

CREATE PROCEDURE migrar_BI_anuncio
 AS
  BEGIN
     INSERT INTO LOS_MAGIOS.BI_anuncio
	 (codigo, costo_publicacion, estado_anuncio_id, fecha_finalizacion_anuncio, fecha_publicacion, inmueble_id, moneda_id, precio_publicado, agente_id, tipo_operacion_id)
	 SELECT DISTINCT a.codigo, costo_publicacion, estado_anuncio_id, fecha_finalizacion_anuncio, fecha_publicacion, i2.id, moneda_id, precio_publicado, ag.id, tipo_operacion_id
	 FROM LOS_MAGIOS.anuncio a
	 JOIN LOS_MAGIOS.BI_agente ag ON ag.id = a.agente_id
	 JOIN LOS_MAGIOS.inmueble i ON i.id = inmueble_id
	 JOIN LOS_MAGIOS.BI_inmueble i2 ON i2.codigo = i.codigo
  END
GO

IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_BI_venta')
	DROP PROCEDURE migrar_BI_venta
GO

CREATE PROCEDURE migrar_BI_venta
 AS
  BEGIN 
     INSERT INTO LOS_MAGIOS.BI_venta
	 (codigo, anuncio_id, comprador_id, fecha_venta_id, precio_venta, moneda_id, pago_id, comision)
	 SELECT DISTINCT v.codigo, a.id, c.id, t.id, precio_venta, m.id, p.id, comision
	 FROM LOS_MAGIOS.venta v
	 JOIN LOS_MAGIOS.BI_anuncio a ON a.id = v.anuncio_id 
	 JOIN LOS_MAGIOS.BI_comprador c ON c.id = v.comprador_id
	 JOIN LOS_MAGIOS.BI_moneda m ON m.id = v.moneda_id
	 JOIN LOS_MAGIOS.BI_pago p ON p.id = v.pago_id
	 JOIN LOS_MAGIOS.BI_tiempo t ON (t.cuatrimestre = LOS_MAGIOS.obtenerCuatrimestre(fecha_venta) AND
									t.anio = YEAR(fecha_venta) AND
									t.mes = MONTH(fecha_venta))
  END
GO

IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_BI_alquiler')
	DROP PROCEDURE migrar_BI_alquiler
GO

CREATE PROCEDURE migrar_BI_alquiler
 AS
  BEGIN 
     INSERT INTO LOS_MAGIOS.BI_alquiler
	 (codigo, anuncio_id, cantidad_periodos, inquilino_id, fecha_inicio, fecha_fin, deposito, comision, gasto_averiguaciones, estado_alquiler_id, detalle_importe_id)
	 SELECT DISTINCT a.codigo, a2.id, a.cantidad_periodos, i.id, fecha_inicio, fecha_fin, deposito, comision, gasto_averiguaciones, ea.id, di.id
	 FROM LOS_MAGIOS.alquiler a
	 JOIN LOS_MAGIOS.BI_inquilino i ON i.id = a.inquilino_id
	 JOIN LOS_MAGIOS.BI_estado_alquiler ea ON ea.id = a.estado_alquiler_id
	 JOIN LOS_MAGIOS.BI_detalle_importe di ON di.id = detalle_importe_id
	 JOIN LOS_MAGIOS.BI_anuncio a2 ON a2.id = a.anuncio_id
  END
GO

IF EXISTS (SELECT [name] FROM sys.procedures WHERE [name] = 'migrar_BI_pago_alquiler')
	DROP PROCEDURE migrar_BI_pago_alquiler
GO

CREATE PROCEDURE migrar_BI_pago_alquiler
 AS
  BEGIN 
     INSERT INTO LOS_MAGIOS.BI_pago_alquiler
	 (codigo, alquiler_id, fecha_pago, fecha_vencimiento_pago, nro_periodo_pago, descripcion, fecha_inicio_periodo, fecha_fin_periodo, importe, medio_de_pago_id)
	 SELECT DISTINCT pa.codigo, a.id, fecha_pago, fecha_vencimiento_pago, nro_periodo_pago, descripcion, fecha_inicio_periodo, fecha_fin_periodo, importe, mp.id
	 FROM LOS_MAGIOS.pago_alquiler pa
	 JOIN LOS_MAGIOS.BI_alquiler a ON a.id = alquiler_id 
	 JOIN LOS_MAGIOS.BI_medio_de_pago mp ON mp.id = medio_de_pago_id 
  END
GO

-- EJECUCION DE STORED PROCEDURES PARA LA MIGRACION
BEGIN TRANSACTION

BEGIN TRY 
	EXECUTE migrar_BI_tipo_inmueble
	EXECUTE migrar_BI_ambientes
	EXECUTE migrar_BI_tipo_operacion
	EXECUTE migrar_BI_moneda
	EXECUTE migrar_BI_rango_m2
	EXECUTE migrar_BI_rango_etario
	EXECUTE migrar_BI_ubicacion
	EXECUTE migrar_BI_estado_anuncio
	EXECUTE migrar_BI_estado_inmueble
	EXECUTE migrar_BI_tiempo
	EXECUTE migrar_BI_sucursal
	EXECUTE migrar_BI_agente
	EXECUTE migrar_BI_inmueble
	EXECUTE migrar_BI_anuncio
	EXECUTE migrar_BI_medio_de_pago
	EXECUTE migrar_BI_comprador
	EXECUTE migrar_BI_pago
	EXECUTE migrar_BI_venta
	EXECUTE migrar_BI_estado_inmueble
	EXECUTE migrar_BI_detalle_importe
	EXECUTE migrar_BI_inquilino
	EXECUTE migrar_BI_estado_alquiler
	EXECUTE migrar_BI_alquiler
	EXECUTE migrar_BI_pago_alquiler
END TRY 

BEGIN CATCH  
	ROLLBACK TRANSACTION;
	THROW 50000, 'Error al migrar', 1;
END CATCH  

COMMIT TRANSACTION
GO

-- VISTAS
-- 1. Duración promedio (en días) que se encuentran publicados los anuncios
IF EXISTS (SELECT name FROM sys.objects WHERE name = 'view_duracion_promedio_anuncio') 
	DROP VIEW LOS_MAGIOS.view_duracion_promedio_anuncio
GO

CREATE VIEW LOS_MAGIOS.view_duracion_promedio_anuncio AS
SELECT
    ti.nombre AS tipo_operacion, 
	u.barrio, 
	am.nombre AS ambientes, 
	LOS_MAGIOS.obtenerCuatrimestre(a.fecha_publicacion) AS cuatrimestre,
    YEAR(a.fecha_publicacion) AS anio, AVG(DATEDIFF(DAY, a.fecha_publicacion, a.fecha_finalizacion_anuncio)) AS duracion_promedio
FROM LOS_MAGIOS.BI_anuncio a
	INNER JOIN LOS_MAGIOS.BI_inmueble i ON a.inmueble_id = i.id
	INNER JOIN LOS_MAGIOS.BI_ubicacion u ON i.ubicacion_id = u.id
	INNER JOIN LOS_MAGIOS.BI_tipo_operacion ti ON ti.id = a.tipo_operacion_id
	INNER JOIN LOS_MAGIOS.BI_ambientes am ON am.id = i.ambientes_id
GROUP BY ti.nombre, u.barrio, am.nombre, LOS_MAGIOS.obtenerCuatrimestre(a.fecha_publicacion), YEAR(a.fecha_publicacion);
GO


-- 2. Precio promedio de los anuncios de inmuebles

IF EXISTS (SELECT name FROM sys.objects WHERE name = 'view_precio_promedio_inmuebles') 
	DROP VIEW LOS_MAGIOS.view_precio_promedio_inmuebles 
GO

CREATE VIEW LOS_MAGIOS.view_precio_promedio_inmuebles AS
SELECT 
	t.anio, 
	t.cuatrimestre, 
	o.nombre
	AS tipo_operacion, 
	i.nombre AS tipo_inmueble, 
	m.nombre AS moneda, 
	r.nombre AS rango_M2, 
	AVG(A.precio_publicado) AS precio_promedio
FROM LOS_MAGIOS.BI_anuncio a
	JOIN LOS_MAGIOS.BI_tiempo t ON A.fecha_publicacion 
			BETWEEN DATEADD(MONTH, (t.cuatrimestre - 1) * 4, DATEFROMPARTS(t.anio, 1, 1)) AND DATEADD(MONTH, t.cuatrimestre * 4, DATEFROMPARTS(t.anio, 1, 1))
	JOIN LOS_MAGIOS.BI_tipo_operacion o ON A.tipo_operacion_id = o.id
	JOIN LOS_MAGIOS.BI_inmueble i ON A.inmueble_id = i.id
	JOIN LOS_MAGIOS.BI_moneda m ON A.moneda_id = m.id
	JOIN LOS_MAGIOS.BI_rango_m2 r ON i.rango_m2_id = r.id
GROUP BY t.anio, t.cuatrimestre, o.nombre, i.nombre, m.nombre, r.nombre;
GO

-- 3. Los 5 barrios más elegidos para alquilar
IF EXISTS (SELECT name FROM sys.objects WHERE name = 'view_5_barrios_mas_elegidos_alquilar') 
	DROP VIEW LOS_MAGIOS.view_5_barrios_mas_elegidos_alquilar 
GO

CREATE VIEW LOS_MAGIOS.view_5_barrios_mas_elegidos_alquilar AS
SELECT
    t.anio,
    t.cuatrimestre,
    r.nombre AS rango_etario,
    u.barrio,
    COUNT(*) AS cantidad_alquileres,
	ROW_NUMBER() OVER (PARTITION BY t.anio, t.cuatrimestre, r.nombre ORDER BY COUNT(*) DESC) AS ranking
FROM
    LOS_MAGIOS.BI_alquiler al
	INNER JOIN LOS_MAGIOS.BI_anuncio an ON an.id = al.anuncio_id
	INNER JOIN LOS_MAGIOS.BI_inmueble inm ON inm.id = an.inmueble_id
	INNER JOIN LOS_MAGIOS.BI_ubicacion u ON u.id = inm.ubicacion_id
    INNER JOIN LOS_MAGIOS.BI_tiempo t ON t.anio BETWEEN YEAR(al.fecha_inicio) AND YEAR(al.fecha_fin)
    INNER JOIN LOS_MAGIOS.BI_inquilino inq ON al.inquilino_id = inq.id
    INNER JOIN LOS_MAGIOS.BI_rango_etario r ON inq.rango_etario_id = R.id
GROUP BY t.anio, t.cuatrimestre, r.nombre, u.barrio 
GO

-- 4. Porcentaje de incumplimiento de pagos de alquileres en término
IF EXISTS (SELECT name FROM sys.objects WHERE name = 'view_porcentaje_incumplimiento_pago_alquiler') 
	DROP VIEW LOS_MAGIOS.view_porcentaje_incumplimiento_pago_alquiler 
GO

CREATE VIEW LOS_MAGIOS.view_porcentaje_incumplimiento_pago_alquiler AS
SELECT
    MONTH(pa.fecha_pago) AS Mes,
    YEAR(pa.fecha_pago) AS Anio,
    COUNT(*) AS TotalPagos,
    SUM(CASE WHEN fecha_vencimiento_pago > fecha_pago THEN 1 ELSE 0 END) AS PagosEnTermino,
    SUM(CASE WHEN fecha_vencimiento_pago < fecha_pago THEN 1 ELSE 0 END) AS PagosFueraTermino,
    CAST(SUM(CASE WHEN fecha_vencimiento_pago < fecha_pago THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS PorcentajeIncumplimiento
FROM
    LOS_MAGIOS.BI_pago_alquiler pa
GROUP BY MONTH(pa.fecha_pago), YEAR(pa.fecha_pago);
GO

-- 5. Porcentaje promedio de incremento del valor de los alquileres

-- Creación de la vista para el indicador
IF EXISTS (SELECT name FROM sys.objects WHERE name = 'view_porcentaje_incremento_alquiler') 
	DROP VIEW LOS_MAGIOS.view_porcentaje_incremento_alquiler  
GO

CREATE VIEW LOS_MAGIOS.view_porcentaje_incremento_alquiler AS
SELECT
    a.id AS alquiler_id,
    a.fecha_inicio AS fecha_inicio_alquiler,
    a.fecha_fin AS fecha_fin_alquiler,
    p.codigo AS propiedad_codigo,
    a.cantidad_periodos AS cantidad_periodos,
    p.direccion AS direccion_propiedad,
    pd.importe AS importe_ultimo_pago,
    pd.fecha_pago AS fecha_ultimo_pago,
    pd.nro_periodo_pago AS nro_periodo_ultimo_pago,
    a.detalle_importe_id AS detalle_importe_id
FROM
    LOS_MAGIOS.BI_alquiler AS a
	INNER JOIN LOS_MAGIOS.BI_anuncio an ON an.id = a.anuncio_id
    INNER JOIN LOS_MAGIOS.BI_inmueble AS p ON an.inmueble_id = p.id
    INNER JOIN LOS_MAGIOS.BI_pago_alquiler AS pd ON a.id = pd.alquiler_id
    INNER JOIN LOS_MAGIOS.BI_estado_alquiler AS ea ON a.estado_alquiler_id = ea.id
WHERE
    EA.nombre = 'Activo'; -- Filtra solo los alquileres activos
GO
-- Creación de la vista para calcular el porcentaje de incremento
IF EXISTS (SELECT name FROM sys.objects WHERE name = 'view_porcentaje_incremento_alquiler_mes') 
	DROP VIEW LOS_MAGIOS.view_porcentaje_incremento_alquiler_mes 
GO

CREATE VIEW LOS_MAGIOS.view_porcentaje_incremento_alquiler_mes AS
SELECT
    va.alquiler_id,
    va.fecha_inicio_alquiler,
    va.fecha_fin_alquiler,
    va.propiedad_codigo,
    va.cantidad_periodos,
    va.direccion_propiedad,
    va.importe_ultimo_pago,
    va.fecha_ultimo_pago,
    va.nro_periodo_ultimo_pago,
    di.precio AS precio_inicial,
    (di.precio - va.importe_ultimo_pago) / di.precio * 100 AS porcentaje_incremento
FROM
    LOS_MAGIOS.view_porcentaje_incremento_alquiler AS va
    INNER JOIN LOS_MAGIOS.BI_detalle_importe AS di ON va.detalle_importe_id = di.id;
GO

IF EXISTS (SELECT name FROM sys.objects WHERE name = 'view_porcentaje_promedio_incremento_alquileres') 
	DROP VIEW LOS_MAGIOS.view_porcentaje_promedio_incremento_alquileres 
GO
CREATE VIEW LOS_MAGIOS.view_porcentaje_promedio_incremento_alquileres AS
SELECT
    YEAR(fecha_fin_alquiler) AS anio,
    MONTH(fecha_fin_alquiler) AS mes,
    AVG(porcentaje_incremento) AS porcentaje_promedio_incremento
FROM
    LOS_MAGIOS.view_porcentaje_incremento_alquiler_mes
GROUP BY
    YEAR(fecha_fin_alquiler),
    MONTH(fecha_fin_alquiler);
GO


-- 6. Precio promedio de m2 de la venta

IF EXISTS (SELECT name FROM sys.objects WHERE name = 'view_precio_promedio_m2') 
	DROP VIEW LOS_MAGIOS.view_precio_promedio_m2
GO

CREATE VIEW LOS_MAGIOS.view_precio_promedio_m2 AS
SELECT
    t.anio,
    t.cuatrimestre,
    ti.nombre AS tipo_inmueble,
    u.provincia,
    u.localidad,
    AVG(v.precio_venta / superficie_total) AS PrecioPromedioM2
FROM LOS_MAGIOS.BI_venta v
JOIN LOS_MAGIOS.BI_anuncio a ON v.anuncio_id = a.id
JOIN LOS_MAGIOS.BI_inmueble i ON a.inmueble_id = i.id
JOIN LOS_MAGIOS.BI_tiempo t ON v.fecha_venta_id = t.id
JOIN LOS_MAGIOS.BI_ubicacion u ON i.ubicacion_id = u.id
JOIN LOS_MAGIOS.BI_tipo_inmueble ti ON ti.id = i.tipo_inmueble_id
GROUP BY
    T.anio,
    T.cuatrimestre,
    ti.nombre,
    U.provincia,
    U.localidad;

GO

-- 7. Valor promedio de la comisión
IF EXISTS (SELECT name FROM sys.objects WHERE name = 'view_promedio_comision') 
	DROP VIEW LOS_MAGIOS.view_promedio_comision
GO

CREATE VIEW LOS_MAGIOS.view_promedio_comision AS
SELECT
    t.anio,
    t.cuatrimestre,
    s.nombre AS sucursal,
    t_op.nombre AS tipo_operacion,
    AVG(v.comision) AS comision_promedio
FROM LOS_MAGIOS.BI_anuncio a
	JOIN LOS_MAGIOS.BI_tiempo t ON t.anio BETWEEN  YEAR(a.fecha_publicacion) AND YEAR(a.fecha_finalizacion_anuncio) 
	JOIN LOS_MAGIOS.BI_venta v ON a.id = v.anuncio_id
	JOIN LOS_MAGIOS.BI_agente ag ON a.agente_id = ag.id
	JOIN LOS_MAGIOS.BI_sucursal s ON ag.sucursal_id = s.id
	JOIN LOS_MAGIOS.BI_tipo_operacion t_op ON a.tipo_operacion_id = t_op.id
GROUP BY
    t.anio,
    t.cuatrimestre,
    s.nombre,
    t_op.nombre;
GO

-- 8. Porcentaje de operaciones concretadas
IF EXISTS (SELECT name FROM sys.objects WHERE name = 'view_informacion_operaciones') 
	DROP VIEW LOS_MAGIOS.view_informacion_operaciones
GO

-- Vista que contiene la información necesaria
CREATE VIEW LOS_MAGIOS.view_informacion_operaciones AS
SELECT
    A.id,
    A.fecha_publicacion,
    A.tipo_operacion_id,
    A.estado_anuncio_id,
    A.agente_id,
    S.id AS sucursal_id,
    Ag.fecha_nacimiento AS fecha_nacimiento_agente,
    Ag.fecha_registro AS fecha_registro_agente
FROM
    LOS_MAGIOS.BI_anuncio A
    INNER JOIN LOS_MAGIOS.BI_agente Ag ON A.agente_id = Ag.id
    INNER JOIN LOS_MAGIOS.BI_sucursal S ON Ag.sucursal_id = S.id;
GO

-- Vista que calcula el porcentaje de operaciones concretadas por sucursal, rango etario y año
IF EXISTS (SELECT name FROM sys.objects WHERE name = 'view_porcentaje_operaciones') 
	DROP VIEW LOS_MAGIOS.view_porcentaje_operaciones
GO

CREATE VIEW LOS_MAGIOS.view_porcentaje_operaciones AS
SELECT
    S.id AS sucursal_id,
    Ag.fecha_nacimiento AS fecha_nacimiento_agente,
    YEAR(I.fecha_publicacion) AS ano_publicacion,
    COUNT(*) AS total_anuncios,
    SUM(CASE WHEN (I.estado_anuncio_id = 1 OR I.estado_anuncio_id = 3) THEN 1 ELSE 0 END) AS operaciones_concretadas
FROM
    LOS_MAGIOS.view_informacion_operaciones I
    INNER JOIN LOS_MAGIOS.BI_agente Ag ON I.agente_id = Ag.id
    INNER JOIN LOS_MAGIOS.BI_sucursal S ON I.sucursal_id = S.id
GROUP BY
    S.id,
    Ag.fecha_nacimiento,
    YEAR(I.fecha_publicacion)
GO

-- Vista final que calcula el porcentaje de operaciones concretadas por sucursal, rango etario y año
IF EXISTS (SELECT name FROM sys.objects WHERE name = 'view_porcentaje_operaciones_concretadas') 
	DROP VIEW LOS_MAGIOS.view_porcentaje_operaciones_concretadas
GO

CREATE VIEW LOS_MAGIOS.view_porcentaje_operaciones_concretadas AS
SELECT
    *,
    (operaciones_concretadas * 100.0) / total_anuncios AS porcentaje_operaciones_concretadas
FROM
    LOS_MAGIOS.view_porcentaje_operaciones;
GO

-- 9. Monto total de cierre de contratos por tipo de operación 

IF EXISTS (SELECT name FROM sys.objects WHERE name = 'view_monto_total_por_tipo_operacion') 
	DROP VIEW LOS_MAGIOS.view_monto_total_por_tipo_operacion
GO

CREATE VIEW LOS_MAGIOS.view_monto_total_por_tipo_operacion AS
SELECT
    S.id AS sucursal_id,
    t_op.nombre AS tipo_operacion,
    ti.cuatrimestre AS cuatrimestre,
    m.nombre as moneda,
    SUM(CASE WHEN a.tipo_operacion_id = 1 THEN v.precio_venta
             WHEN a.tipo_operacion_id = 2 THEN P.importe
			 WHEN a.tipo_operacion_id = 3 THEN pa.importe
             ELSE 0 END) AS monto_total_cierre_contratos
FROM
    LOS_MAGIOS.BI_anuncio a
    LEFT JOIN LOS_MAGIOS.BI_venta V ON a.id = V.anuncio_id
    LEFT JOIN LOS_MAGIOS.BI_alquiler al ON a.id = al.anuncio_id
	LEFT JOIN LOS_MAGIOS.BI_pago_alquiler pa ON al.id = pa.alquiler_id
	LEFT JOIN LOS_MAGIOS.BI_agente ag ON a.agente_id = ag.id
    LEFT JOIN LOS_MAGIOS.BI_sucursal s ON ag.sucursal_id = s.id
    LEFT JOIN LOS_MAGIOS.BI_pago P ON P.id = (CASE WHEN a.tipo_operacion_id = 1 THEN V.pago_id
                                                  WHEN a.tipo_operacion_id = 2 THEN V.pago_id
                                                  ELSE NULL END)
	LEFT JOIN LOS_MAGIOS.BI_tiempo ti ON ti.anio BETWEEN YEAR(a.fecha_publicacion) AND YEAR(a.fecha_finalizacion_anuncio)
	JOIN LOS_MAGIOS.BI_moneda m ON m.id = a.moneda_id
	JOIN LOS_MAGIOS.BI_tipo_operacion t_op ON t_op.id = a.tipo_operacion_id
GROUP BY
    S.id,
    t_op.nombre,
    ti.cuatrimestre,
    m.nombre
GO

-- SELECT'S DE VISTAS
/*
SELECT * FROM LOS_MAGIOS.view_duracion_promedio_anuncio;
SELECT * FROM LOS_MAGIOS.view_precio_promedio_inmuebles;
SELECT * FROM LOS_MAGIOS.view_5_barrios_mas_elegidos_alquilar
WHERE ranking <= 5;
SELECT * FROM LOS_MAGIOS.view_porcentaje_incumplimiento_pago_alquiler;
SELECT * FROM LOS_MAGIOS.view_porcentaje_promedio_incremento_alquileres;
SELECT * FROM LOS_MAGIOS.view_precio_promedio_m2;
SELECT * FROM LOS_MAGIOS.view_promedio_comision;
SELECT * FROM LOS_MAGIOS.view_porcentaje_operaciones_concretadas;
SELECT * FROM LOS_MAGIOS.view_monto_total_por_tipo_operacion;
*/

-- SELECT'S
/*
SELECT * FROM LOS_MAGIOS.BI_agente;
SELECT * FROM LOS_MAGIOS.BI_alquiler;
SELECT * FROM LOS_MAGIOS.BI_ambientes;
SELECT * FROM LOS_MAGIOS.BI_anuncio;
SELECT * FROM LOS_MAGIOS.BI_comprador;
SELECT * FROM LOS_MAGIOS.BI_detalle_importe;
SELECT * FROM LOS_MAGIOS.BI_estado_alquiler;
SELECT * FROM LOS_MAGIOS.BI_estado_anuncio;
SELECT * FROM LOS_MAGIOS.BI_estado_inmueble;
SELECT * FROM LOS_MAGIOS.BI_inmueble;
SELECT * FROM LOS_MAGIOS.BI_inquilino;
SELECT * FROM LOS_MAGIOS.BI_medio_de_pago;
SELECT * FROM LOS_MAGIOS.BI_moneda;
SELECT * FROM LOS_MAGIOS.BI_pago;
SELECT * FROM LOS_MAGIOS.BI_pago_alquiler;
SELECT * FROM LOS_MAGIOS.BI_rango_etario;
SELECT * FROM LOS_MAGIOS.BI_rango_m2;
SELECT * FROM LOS_MAGIOS.BI_sucursal;
SELECT * FROM LOS_MAGIOS.BI_tiempo;
SELECT * FROM LOS_MAGIOS.BI_tipo_inmueble;
SELECT * FROM LOS_MAGIOS.BI_tipo_operacion;
SELECT * FROM LOS_MAGIOS.BI_ubicacion;
SELECT * FROM LOS_MAGIOS.BI_venta;
*/