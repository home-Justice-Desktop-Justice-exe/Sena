CREATE TABLE Materia_Aula (
id_materia INT PRIMARY KEY,
nombre_materia VARCHAR(50),
creditos INT
);

CREATE TABLE Nota_Aula (
id_nota INT PRIMARY KEY,
id_materia INT,
estudiante VARCHAR(80),
calificacion DECIMAL (3,1),
FOREIGN KEY (id_materia) REFERENCES Materia_Aula(id_materia)
);

ALTER TABLE Nota_Aula
MODIFY COLUMN calificacion DECIMAL(3,1) NOT NULL;

INSERT INTO Materia_Aula (id_materia, nombre_materia, creditos) VALUES
(1, 'Bases de datos', 3),
(2, 'Programacion web', 4);

INSERT INTO Nota_Aula (id_nota, id_materia, estudiante, calificacion) VALUES
(101, 1, 'Juan', 4.5),
(102, 1, 'Taco', 3.0),
(103, 2, 'Juan', 3.8),
(104, 2, 'Mati', 2.5);

UPDATE Nota_Aula
SET calificacion = 4.0
WHERE id_nota = 102;

SELECT estudiante, AVG(calificacion) AS promedio
FROM Nota_Aula
GROUP BY estudiante
HAVING AVG(calificacion) >= 3.5;

INSERT INTO Nota_Aula (id_nota, id_materia, estudiante, calificacion)
VALUES (105, 1, 'Estudiante prueba', 4.55);

SELECT * FROM Nota_Aula WHERE id_nota = 105;
