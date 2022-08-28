CREATE DATABASE AULA02

CREATE TABLE Motorista(
	codigo int,
	nome varchar(255),
	naturalidade varchar(20),
	PRIMARY KEY (codigo)
)

CREATE TABLE Onibus(
	placa varchar(8),
	marca varchar(10),
	ano int,
	descricao varchar(15),
	PRIMARY KEY (placa)
)

CREATE TABLE Viagem(
	codigo int,
	onibus varchar(8),
	motorista int,
	horaSaida int,
	horaChegada int,
	partida varchar(20),
	destino varchar(20),
	PRIMARY KEY (codigo),
	FOREIGN KEY (onibus) REFERENCES Onibus(placa),
	FOREIGN KEY (motorista) REFERENCES Motorista(codigo),
	CHECK (horaSaida>=0),
	CHECK (horaChegada>=0)
)


--1
SELECT CAST(codigo AS varchar) AS id, nome As nome from Motorista
UNION
SELECT placa AS id, marca AS nome from Onibus

--2
CREATE VIEW v_motorista_onibus
AS
SELECT CAST(codigo AS varchar) AS id, nome As nome from Motorista
UNION
SELECT placa AS id, marca AS nome from Onibus

--3
CREATE VIEW v_descricao_onibus
AS
SELECT V.codigo, M.nome, V.onibus, O.marca, O.ano, O.descricao
FROM Viagem V, Onibus O, Motorista M
WHERE 
V.onibus = O.placa
AND V.motorista = M.codigo

--4
CREATE VIEW v_descricao_viagem
AS 
SELECT codigo, onibus,horaSaida, horaChegada, partida, destino
FROM Viagem
