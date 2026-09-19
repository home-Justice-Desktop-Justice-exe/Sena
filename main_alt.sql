CREATE TABLE Pelicula_CIN (
    id_pelicula INT PRIMARY KEY,
    titulo VARCHAR(80),
    clasificacion VARCHAR(10)
);

CREATE TABLE Boleta_CIN (
    id_boleta INT PRIMARY KEY,
    id_pelicula INT,
    num_sala INT,
    precio_boleta DECIMAL(10,2),
    FOREIGN KEY (id_pelicula) REFERENCES Pelicula_CIN(id_pelicula)
);

ALTER TABLE Boleta_CIN 
ADD COLUMN fecha_funcion DATETIME;

INSERT INTO Pelicula_CIN (id_pelicula, titulo, clasificacion) VALUES 
(1, 'Avatar', 'PG-13'),
(2, 'Batman', '15+');

INSERT INTO Boleta_CIN (id_boleta, id_pelicula, num_sala, precio_boleta, fecha_funcion) VALUES 
(501, 1, 2, 12000.00, '2026-07-28 15:30:00'),
(502, 1, 2, 12000.00, '2026-07-28 15:30:00'),
(503, 2, 5, 15000.00, '2026-07-28 18:00:00');

UPDATE Boleta_CIN 
SET precio_boleta = 14000.00 
WHERE id_boleta = 501;

SELECT p.titulo, SUM(b.precio_boleta) AS total_recaudado
FROM Pelicula_CIN p
JOIN Boleta_CIN b ON p.id_pelicula = b.id_pelicula
GROUP BY p.titulo;

INSERT INTO Boleta_CIN (id_boleta, id_pelicula, num_sala, precio_boleta, fecha_funcion) 
VALUES (504, 1, 3, 99999.99, '2026-07-28 20:00:00');
