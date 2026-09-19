CREATE TABLE Mesa_GOUR (
    num_mesa INT PRIMARY KEY,
    capacidad INT,
    ubicacion VARCHAR(30)
);

CREATE TABLE Comanda_GOUR (
    id_comanda INT PRIMARY KEY,
    num_mesa INT,
    mesero VARCHAR(60),
    total_platillos INT,
    FOREIGN KEY (num_mesa) REFERENCES Mesa_GOUR(num_mesa)
);

ALTER TABLE Comanda_GOUR 
ADD COLUMN estado_comanda VARCHAR(20);

INSERT INTO Mesa_GOUR (num_mesa, capacidad, ubicacion) VALUES 
(1, 4, 'Terraza'),
(2, 2, 'Interior'),
(3, 6, 'Terraza');

INSERT INTO Comanda_GOUR (id_comanda, num_mesa, mesero, total_platillos, estado_comanda) VALUES 
(101, 1, 'Carlos Mendoza', 3, 'En Proceso'),
(102, 2, 'Ana Lucía Gómez', 2, 'Entregado'),
(103, 3, 'Carlos Mendoza', 5, 'En Proceso');

UPDATE Comanda_GOUR 
SET mesero = 'Laura Restrepo' 
WHERE id_comanda = 101;

SELECT c.id_comanda, c.num_mesa, c.mesero, c.total_platillos, m.ubicacion
FROM Comanda_GOUR c
JOIN Mesa_GOUR m ON c.num_mesa = m.num_mesa
WHERE m.ubicacion = 'Terraza';

DELETE FROM Mesa_GOUR WHERE num_mesa = 1;
