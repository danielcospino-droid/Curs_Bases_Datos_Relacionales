EXPLAIN
SELECT *
FROM academia.profesores
WHERE correo = 'profesor1@correo.com';

CREATE INDEX idx_profesores_correo
ON academia.profesores(correo);

EXPLAIN
SELECT *
FROM academia.profesores
WHERE correo = 'profesor1@correo.com';

INSERT INTO academia.profesores (
    id_departamento,
    nombre,
    correo
)
VALUES (
    999,
    'Profesor Inválido',
    'invalido@correo.com'
);