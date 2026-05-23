
CREATE TABLE estudiantes (
    id_estudiante SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE
);



CREATE TABLE cursos (
    id_curso SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);



CREATE TABLE matriculas (
    id_matricula SERIAL PRIMARY KEY,
    id_estudiante INT NOT NULL,
    id_curso INT NOT NULL,
    fecha_matricula DATE NOT NULL DEFAULT CURRENT_DATE,

    
    FOREIGN KEY (id_estudiante)
    REFERENCES estudiantes(id_estudiante),

    
    FOREIGN KEY (id_curso)
    REFERENCES cursos(id_curso)
);



INSERT INTO estudiantes (nombre, correo)
VALUES
('Juan Perez', 'juan@gmail.com'),
('Ana Gomez', 'ana@gmail.com'),
('Carlos Ruiz', 'carlos@gmail.com');



INSERT INTO cursos (nombre)
VALUES
('Matematicas'),
('Programacion'),
('Historia');



INSERT INTO matriculas (id_estudiante, id_curso)
VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 1);



SELECT * FROM estudiantes;


SELECT * FROM cursos;


SELECT * FROM matriculas;

SELECT
    e.nombre AS estudiante,
    c.nombre AS curso,
    m.fecha_matricula
FROM matriculas m
INNER JOIN estudiantes e
    ON m.id_estudiante = e.id_estudiante
INNER JOIN cursos c
    ON m.id_curso = c.id_curso;
  

  