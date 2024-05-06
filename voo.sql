CREATE DATABASE IF NOT EXISTS PASSAGENS_AEREAS;
USE PASSAGENS_AEREAS;

CREATE TABLE IF NOT EXISTS PASSAGEIROS(
COD_PASSAGEIRO INT PRIMARY KEY,
NOME VARCHAR(100) NOT NULL,
SOBRENOME VARCHAR(100) NOT NULL,
DATA_NASC DATE NOT NULL,
NACIONALIDADE VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS AEROPORTOS(
ID_AEROPORTO INT PRIMARY KEY,
NOME VARCHAR(100) NOT NULL,
CIDADE VARCHAR(100) NOT NULL,
ESTADO VARCHAR(100) NOT NULL,
PAIS VARCHAR(100) NOT NULL,
LATITUDE VARCHAR(50) NOT NULL,
LONGITUDE VARCHAR(50) NOT NULL,
TAMANHO_PISTA DECIMAL(20,1) NOT NULL
);

CREATE TABLE IF NOT EXISTS CIA_AEREAS(
ID_CIA INT PRIMARY KEY,
CNPJ VARCHAR(20) NOT NULL,
NOME_FANTASIA VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS RESERVAS(
ID_RESERVA INT PRIMARY KEY,
DATA_RESERVA DATE NOT NULL,
FORMA_PGTO ENUM("DINHEIRO","PIX","DEBITO","CREDITO") NOT NULL,
VALOR_RESERVA DECIMAL(10,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS AERONAVES(
PFX_AERO VARCHAR(20) PRIMARY KEY,
MODELO VARCHAR(50) NOT NULL,
ANO_FABR YEAR NOT NULL,
FABRICANTE VARCHAR(50) NOT NULL,
POLTRONAS INT NOT NULL,
CIA_AEREA INT NOT NULL,
CONSTRAINT CIA_AERO FOREIGN KEY(CIA_AEREA) REFERENCES CIA_AEREAS(ID_CIA));

CREATE TABLE IF NOT EXISTS VOOS(
ID_VOO INT,
ASSENTO VARCHAR(10),
AERO_PART INT NOT NULL,
DATA_PART DATE NOT NULL,
HORA_PART TIME NOT NULL,
AERO_CHEG INT NOT NULL,
DATA_CHEG DATE NOT NULL,
HORA_CHEG TIME NOT NULL,
AERONAVE VARCHAR(20) NOT NULL,
CIA_AEREA INT NOT NULL,
PRIMARY KEY(ID_VOO,ASSENTO),
CONSTRAINT AEROP_VOO1 FOREIGN KEY(AERO_PART) REFERENCES AEROPORTOS(ID_AEROPORTO),
CONSTRAINT AEROP_VOO2 FOREIGN KEY(AERO_CHEG) REFERENCES AEROPORTOS(ID_AEROPORTO),  
CONSTRAINT AERON_VOO FOREIGN KEY(AERONAVE) REFERENCES AERONAVES(PFX_AERO),
CONSTRAINT CIA_VOO FOREIGN KEY(CIA_AEREA) REFERENCES CIA_AEREAS(ID_CIA)
);

CREATE TABLE IF NOT EXISTS VOOS_RESERVAS(
ID_VOO INT,
ASSENTO VARCHAR(10),
ID_RESERVA INT,
PRIMARY KEY(ID_VOO,ASSENTO,ID_RESERVA),
CONSTRAINT VR1 FOREIGN KEY(ID_VOO,ASSENTO) REFERENCES VOOS(ID_VOO,ASSENTO),
CONSTRAINT VR2 FOREIGN KEY(ID_RESERVA) REFERENCES RESERVAS(ID_RESERVA)
);

CREATE TABLE IF NOT EXISTS PASSAGEIROS_RESERVAS(
PASSAGEIRO INT,
ID_RESERVA INT,
PRIMARY KEY(PASSAGEIRO,ID_RESERVA),
CONSTRAINT PR1 FOREIGN KEY(PASSAGEIRO) REFERENCES PASSAGEIROS(COD_PASSAGEIRO),
CONSTRAINT PR2 FOREIGN KEY(ID_RESERVA) REFERENCES RESERVAS(ID_RESERVA));


INSERT INTO PASSAGEIROS (COD_PASSAGEIRO, NOME, SOBRENOME, DATA_NASC, NACIONALIDADE) VALUES 
(1, 'Maria', 'Ferreira', '1992-11-25', 'Espanhola'),
(2, 'Luiz', 'Rodrigues', '1980-07-12', 'Brasileiro'),
(3, 'Carla', 'Gomes', '2000-04-30', 'Brasileira'),
(4, 'André', 'Martins', '1975-09-18', 'Português'),
(5, 'Ana', 'Lima', '1995-03-20', 'Brasileira');

INSERT INTO AEROPORTOS (ID_AEROPORTO, NOME, CIDADE, ESTADO, PAIS, LATITUDE, LONGITUDE, TAMANHO_PISTA) VALUES 
(1, 'Aeroporto Internacional de Dubai', 'Dubai', "n/a", 'Emirados Árabes Unidos', '25.252', '55.364', 4000.0),
(2, 'Aeroporto de Tóquio-Haneda', 'Tóquio', "n/a", 'Japão', '35.548', '139.785', 3800.0),
(3, 'Aeroporto Internacional de Heathrow', 'Londres', "n/a", 'Reino Unido', '51.470', '-0.454', 4200.0),
(4, 'Aeroporto Internacional de Los Angeles', 'Los Angeles', 'California', 'Estados Unidos', '33.942', '-118.408', 4400.0),
(5, 'Aeroporto de Sydney', 'Sydney', 'Nova Gales do Sul', 'Austrália', '-33.946', '151.177', 4100.0);

INSERT INTO CIA_AEREAS (ID_CIA, CNPJ, NOME_FANTASIA) VALUES 
(1, '98765432109876', 'Sky Airlines'),
(2, '56789012345678', 'Air Canada'),
(3, '34567890123456', 'Singapore Airlines'),
(4, '67890123456789', 'Qatar Airways'),
(5, '45678901234567', 'Emirates');

INSERT INTO RESERVAS (ID_RESERVA, DATA_RESERVA, FORMA_PGTO, VALOR_RESERVA) VALUES 
(1, '2024-04-29', 'CREDITO', 500.00),
(2, '2024-05-01', 'DEBITO', 700.00),
(3, '2024-05-03', 'DINHEIRO', 600.00),
(4, '2024-05-05', 'PIX', 450.00),
(5, '2024-05-07', 'CREDITO', 800.00);

INSERT INTO AERONAVES (PFX_AERO, MODELO, ANO_FABR, FABRICANTE, POLTRONAS, CIA_AEREA) VALUES 
('ABC123', 'Boeing 737', 2018, 'Boeing', 180, 1),
('DEF456', 'Airbus A320', 2019, 'Airbus', 150, 2),
('GHI789', 'Boeing 787', 2017, 'Boeing', 250, 3),
('JKL012', 'Airbus A350', 2016, 'Airbus', 200, 4),
('MNO345', 'Embraer E190', 2015, 'Embraer', 100, 5);

INSERT INTO VOOS (ID_VOO, ASSENTO, AERO_PART, DATA_PART, HORA_PART, AERO_CHEG, DATA_CHEG, HORA_CHEG, AERONAVE, CIA_AEREA) VALUES 
(1, 'A1', 1, '2024-05-10', '08:00:00', 2, '2024-05-10', '10:00:00', 'ABC123', 1),
(2, 'B2', 2, '2024-05-12', '10:30:00', 3, '2024-05-12', '12:30:00', 'DEF456', 2),
(3, 'C3', 3, '2024-05-14', '12:00:00', 4, '2024-05-14', '14:00:00', 'GHI789', 3),
(4, 'D4', 4, '2024-05-16', '14:30:00', 5, '2024-05-16', '16:30:00', 'JKL012', 4),
(5, 'E5', 5, '2024-05-18', '16:00:00', 1, '2024-05-18', '18:00:00', 'MNO345', 5);

INSERT INTO VOOS_RESERVAS (ID_VOO, ASSENTO, ID_RESERVA) VALUES 
(1, 'A1', 1),
(2, 'B2', 2),
(3, 'C3', 3),
(4, 'D4', 4),
(5, 'E5', 5);

INSERT INTO PASSAGEIROS_RESERVAS (PASSAGEIRO, ID_RESERVA) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

UPDATE PASSAGEIROS SET NACIONALIDADE = 'Mexicano' WHERE COD_PASSAGEIRO = 1;
UPDATE PASSAGEIROS SET SOBRENOME = 'Alves' WHERE COD_PASSAGEIRO = 2;

UPDATE AEROPORTOS SET CIDADE = 'Abu Dhabi' WHERE ID_AEROPORTO = 1;
UPDATE AEROPORTOS SET PAIS = 'Japão' WHERE ID_AEROPORTO = 2;

UPDATE CIA_AEREAS SET NOME_FANTASIA = 'United Airlines' WHERE ID_CIA = 1;
UPDATE CIA_AEREAS SET CNPJ = '98765432109877' WHERE ID_CIA = 2;

UPDATE RESERVAS SET FORMA_PGTO = 'DEBITO' WHERE ID_RESERVA = 1;
UPDATE RESERVAS SET VALOR_RESERVA = 600.00 WHERE ID_RESERVA = 2;

UPDATE AERONAVES SET POLTRONAS = 200 WHERE PFX_AERO = 'ABC123';
UPDATE AERONAVES SET FABRICANTE = 'Boeing' WHERE PFX_AERO = 'DEF456';

UPDATE VOOS SET DATA_PART = '2024-05-15' WHERE ID_VOO = 1;
UPDATE VOOS SET HORA_PART = '09:30:00' WHERE ID_VOO = 2;

UPDATE VOOS_RESERVAS SET ID_RESERVA = 3 WHERE ID_VOO = 2 AND ID_RESERVA = 2;

UPDATE PASSAGEIROS_RESERVAS SET PASSAGEIRO = 3 WHERE PASSAGEIRO = 2 AND ID_RESERVA = 2;
UPDATE PASSAGEIROS_RESERVAS SET ID_RESERVA = 1 WHERE PASSAGEIRO = 3 AND ID_RESERVA = 3;

#COMANDOS DE SELECT
SELECT NOME,CIDADE FROM AEROPORTOS;

SELECT CA.NOME_FANTASIA, COUNT(V.CIA_AEREA) FROM VOOS V
JOIN CIA_AEREAS CA ON CA.ID_CIA = V.CIA_AEREA
GROUP BY CA.NOME_FANTASIA;

SELECT AVG(POLTRONAS) FROM AERONAVES;
