
CREATE SCHEMA IF NOT EXISTS academia;

CREATE TABLE academia.estudiantes (
    id_estudiante SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    fecha_registro DATE NOT NULL DEFAULT CURRENT_DATE
);


CREATE TABLE academia.cursos (
    id_curso SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    codigo VARCHAR(20) NOT NULL UNIQUE,
    creditos INT NOT NULL CHECK (creditos > 0)
);


CREATE TABLE academia.matriculas (
    id_matricula SERIAL PRIMARY KEY,
    id_estudiante INT NOT NULL,
    id_curso INT NOT NULL,
    fecha_matricula DATE NOT NULL DEFAULT CURRENT_DATE,

    -- CLAVE FORÁNEA ESTUDIANTE
    CONSTRAINT fk_estudiante
        FOREIGN KEY (id_estudiante)
        REFERENCES academia.estudiantes(id_estudiante)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    -- CLAVE FORÁNEA CURSO
    CONSTRAINT fk_curso
        FOREIGN KEY (id_curso)
        REFERENCES academia.cursos(id_curso)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


/
*/

CREATE INDEX idx_estudiantes_correo
ON academia.estudiantes(correo);

CREATE INDEX idx_cursos_codigo
ON academia.cursos(codigo);

CREATE INDEX idx_matriculas_estudiante
ON academia.matriculas(id_estudiante);


INSERT INTO academia.estudiantes (nombre, correo)
VALUES
('Juan Pérez', 'juan.perez@example.com'),
('Ana Gómez', 'ana.gomez@example.com'),
('María Rodríguez', 'maria.rodriguez@example.com');


INSERT INTO academia.cursos (nombre, codigo, creditos)
VALUES
('Matemáticas', 'MAT101', 4),
('Historia', 'HIS201', 3),
('Programación', 'PROG301', 5);


INSERT INTO academia.matriculas (id_estudiante, id_curso)
VALUES
(1, 1),
(1, 3),
(2, 2),
(3, 1),
(3, 2),
(3, 3);



SELECT * FROM academia.estudiantes;

SELECT * FROM academia.cursos;


SELECT * FROM academia.matriculas;


SELECT
    e.nombre AS estudiante,
    c.nombre AS curso,
    m.fecha_matricula
FROM academia.matriculas m
INNER JOIN academia.estudiantes e
    ON m.id_estudiante = e.id_estudiante
INNER JOIN academia.cursos c
    ON m.id_curso = c.id_curso;



UPDATE academia.estudiantes
SET correo = 'juan.actualizado@example.com'
WHERE id_estudiante = 1;

UPDATE academia.cursos
SET creditos = 6
WHERE id_curso = 3;




DELETE FROM academia.matriculas
WHERE id_matricula = 2;



SELECT COUNT(*) AS total_estudiantes
FROM academia.estudiantes;

SELECT COUNT(*) AS total_cursos
FROM academia.cursos;

SELECT COUNT(*) AS total_matriculas
FROM academia.matriculas;