
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



INSERT INTO academia.profesores (
    id_departamento,
    nombre,
    correo
)
VALUES (
    1,
    'Profesor Correcto',
    'correcto@correo.com'
);



SELECT
    p.id_profesor,
    p.nombre AS profesor,
    p.correo,
    d.nombre AS departamento
FROM academia.profesores p
JOIN academia.departamentos d
    ON p.id_departamento = d.id_departamento;



UPDATE academia.profesores
SET correo = 'nuevo_correo@correo.com'
WHERE id_profesor = 1;



DELETE FROM academia.profesores
WHERE id_profesor = 2;



\d academia.profesores
