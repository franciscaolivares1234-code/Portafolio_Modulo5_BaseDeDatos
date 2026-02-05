# Diccionario de Datos - Portafolio Módulo 5

## Tabla: usuarios
| Columna      | Tipo de dato | Descripción                        |
|-------------|-------------|-----------------------------------|
| id_usuario  | SERIAL      | Identificador único del usuario    |
| nombre      | VARCHAR(50) | Nombre del usuario                 |
| correo      | VARCHAR(50) | Correo electrónico del usuario     |
| fecha_crea  | DATE        | Fecha de registro del usuario      |

## Tabla: productos
| Columna      | Tipo de dato | Descripción                          |
|-------------|-------------|-------------------------------------|
| id_producto | SERIAL      | Identificador único del producto     |
| nombre      | VARCHAR(50) | Nombre del producto                  |
| precio      | NUMERIC(10,2)| Precio actual del producto          |
| stock       | INT         | Cantidad disponible en inventario   |

## Tabla: compras
| Columna      | Tipo de dato | Descripción                          |
|-------------|-------------|-------------------------------------|
| id_compra   | SERIAL      | Identificador único de la compra     |
| id_usuario  | INT         | Usuario que realizó la compra        |
| fecha_compra| DATE        | Fecha de la compra                   |

## Tabla: detalle_compra
| Columna      | Tipo de dato | Descripción                          |
|-------------|-------------|-------------------------------------|
| id_detalle  | SERIAL      | Identificador único del detalle      |
| id_compra   | INT         | Relación con la compra               |
| id_producto | INT         | Producto comprado                     |
| cantidad    | INT         | Cantidad del producto comprado        |
| subtotal    | NUMERIC(10,2)| Subtotal por producto               |
