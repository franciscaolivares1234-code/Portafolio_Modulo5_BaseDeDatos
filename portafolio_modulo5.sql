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
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio NUMERIC(10,2) NOT NULL,
    stock INTEGER NOT NULL
);

CREATE TABLE compras (
    id_compra SERIAL PRIMARY KEY,
    id_usuario INTEGER NOT NULL,
    fecha_compra DATE NOT NULL,
    total NUMERIC(10,2),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

CREATE TABLE detalle_compra (
    id_detalle SERIAL PRIMARY KEY,
    id_compra INTEGER NOT NULL,
    id_producto INTEGER NOT NULL,
    cantidad INTEGER NOT NULL,
    precio_unitario NUMERIC(10,2) NOT NULL,
    subtotal NUMERIC(10,2) NOT NULL,
    FOREIGN KEY (id_compra) REFERENCES compras(id_compra),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- ============================================
-- INSERTAR DATOS (DML)
-- MINIMO 5 REGISTROS POR TABLA
-- ============================================

-- Usuarios
INSERT INTO usuarios (nombre, correo, password, fecha_registro) VALUES
('Ana Lopez', 'ana@mail.com', '1234', '2025-01-10'),
('Pedro Diaz', 'pedro@mail.com', '1234', '2025-02-15'),
('Camila Soto', 'camila@mail.com', '1234', '2025-03-20'),
('Luis Torres', 'luis@mail.com', '1234', '2025-04-05'),
('Maria Rojas', 'maria@mail.com', '1234', '2025-05-12');

-- Productos
INSERT INTO productos (nombre, descripcion, precio, stock) VALUES
('Notebook', 'Notebook 15 pulgadas', 500000, 10),
('Mouse', 'Mouse inalámbrico', 15000, 5),
('Teclado', 'Teclado mecánico', 45000, 3),
('Monitor', 'Monitor 24 pulgadas', 120000, 8),
('Audifonos', 'Audifonos Bluetooth', 30000, 2);

-- Compras
INSERT INTO compras (id_usuario, fecha_compra, total) VALUES
(1, '2025-11-05', 0),
(2, '2025-11-10', 0),
(1, '2025-11-15', 0),
(3, '2025-10-10', 0),
(1, '2025-09-20', 0);

-- Detalle compra
INSERT INTO detalle_compra (id_compra, id_producto, cantidad, precio_unitario, subtotal) VALUES
(1, 1, 1, 500000, 500000),
(1, 2, 2, 15000, 30000),
(2, 3, 1, 45000, 45000),
(3, 5, 2, 30000, 60000),
(4, 4, 1, 120000, 120000);

-- ============================================
-- CONSULTAS SOLICITADAS
-- ============================================

-- 1. Actualizar precio -20% oferta verano
UPDATE productos
SET precio = precio * 0.8;

-- 2. Productos con stock critico (<=5)
SELECT * FROM productos
WHERE stock <= 5;

-- 3. Simular compra de 3 productos
-- Subtotal
SELECT SUM(subtotal) AS subtotal
FROM detalle_compra
WHERE id_compra = 1;

-- Total con IVA (19%)
SELECT 
    SUM(subtotal) AS subtotal,
    SUM(subtotal) * 0.19 AS iva,
    SUM(subtotal) * 1.19 AS total_con_iva
FROM detalle_compra
WHERE id_compra = 1;

-- 4. Total ventas noviembre 2025
SELECT SUM(d.subtotal) AS total_noviembre
FROM detalle_compra d
JOIN compras c ON d.id_compra = c.id_compra
WHERE c.fecha_compra BETWEEN '2025-11-01' AND '2025-11-30';

-- 5. Usuario que mas compro en 2025
SELECT u.nombre, COUNT(c.id_compra) AS total_compras
FROM usuarios u
JOIN compras c ON u.id_usuario = c.id_usuario
WHERE c.fecha_compra BETWEEN '2025-01-01' AND '2025-12-31'
GROUP BY u.nombre
ORDER BY total_compras DESC
LIMIT 1;
