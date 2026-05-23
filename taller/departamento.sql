-- Crear esquema
CREATE SCHEMA IF NOT EXISTS academia;

-- Tabla departamentos
CREATE TABLE academia.departamentos (
    id_departamento SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
);

-- Tabla profesores
CREATE TABLE academia.profesores (
    id_profesor SERIAL PRIMARY KEY,
    id_departamento INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(120) UNIQUE NOT NULL,

    CONSTRAINT fk_profesor_departamento
        FOREIGN KEY (id_departamento)
        REFERENCES academia.departamentos(id_departamento)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- Insertar departamentos
INSERT INTO academia.departamentos (nombre)
VALUES
('Matemáticas'),
('Informática'),
('Física'),
('Idiomas');

-- Insertar profesores
INSERT INTO academia.profesores (id_departamento, nombre, correo)
VALUES
(1, 'Carlos Pérez', 'carlos@correo.com'),
(2, 'Ana Gómez', 'ana@correo.com'),
(3, 'Luis Martínez', 'luis@correo.com'),
(4, 'María Rodríguez', 'maria@correo.com');

-- Consultar profesores con su departamento
SELECT
    p.nombre AS profesor,
    p.correo,
    d.nombre AS departamento
FROM academia.profesores p
JOIN academia.departamentos d
    ON p.id_departamento = d.id_departamento;

-- Buscar un profesor específico
SELECT *
FROM academia.profesores
WHERE correo = 'ana@correo.com';

-- Actualizar departamento de un profesor
UPDATE academia.profesores
SET id_departamento = 1
WHERE id_profesor = 2;

-- Eliminar un profesor
DELETE FROM academia.profesores
WHERE id_profesor = 4;

-- Ver todos los departamentos
SELECT * FROM academia.departamentos;

-- Crear índice para búsquedas rápidas por correo
CREATE INDEX idx_profesores_correo
ON academia.profesores(correo);

-- Verificar uso del índice
EXPLAIN
SELECT *
FROM academia.profesores
WHERE correo = 'carlos@correo.com';
