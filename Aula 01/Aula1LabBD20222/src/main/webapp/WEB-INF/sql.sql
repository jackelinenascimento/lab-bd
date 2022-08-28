CREATE DATABASE aulaservlets
GO
USE aulaservlets
GO
CREATE TABLE produto (
id			INT				NOT NULL,
nome		VARCHAR(50)		NOT NULL,
preco		DECIMAL(7,2)	NOT NULL
PRIMARY KEY(id)
)

SELECT * FROM produto