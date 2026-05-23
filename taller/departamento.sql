
CREATE SCHEMA IF NOT EXISTS academia;


CREATE TABLE academia.departamentos (
    id_departamento SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
);


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


INSERT INTO academia.profesores (id_departamento, nombre, correo)
VALUES
(1, 'Carlos Pérez', 'carlos@correo.com'),
(2, 'Ana Gómez', 'ana@correo.com'),
(3, 'Luis Martínez', 'luis@correo.com'),
(4, 'María Rodríguez', 'maria@correo.com');


SELECT
    p.nombre AS profesor,
    p.correo,
    d.nombre AS departamento
FROM academia.profesores p
JOIN academia.departamentos d
    ON p.id_departamento = d.id_departamento;


SELECT *
FROM academia.profesores
WHERE correo = 'ana@correo.com';


UPDATE academia.profesores
SET id_departamento = 1
WHERE id_profesor = 2;


DELETE FROM academia.profesores
WHERE id_profesor = 4;


SELECT * FROM academia.departamentos;


CREATE INDEX idx_profesores_correo
ON academia.profesores(correo);


EXPLAIN
SELECT *
FROM academia.profesores
WHERE correo = 'carlos@correo.com';
