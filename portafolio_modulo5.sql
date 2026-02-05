-- ============================================
-- PORTAFOLIO MODULO 5 - BASE DE DATOS TIENDA
-- ============================================

-- ============================================
-- CREACIÓN DE TABLAS (DDL)
-- ============================================

CREATE TABLE usuarios (
    id_usuario SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    fecha_registro DATE NOT NULL
);

CREATE TABLE productos (
    id_producto_
