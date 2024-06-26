CREATE DATABASE if not exists HOSPITAL;
USE HOSPITAL;

CREATE TABLE IF NOT EXISTS PACIENTES(
CPF_PACIENTE VARCHAR(15) PRIMARY KEY,
NOME VARCHAR(45) NOT NULL,
DATA_NASC DATE NOT NULL,
TELEFONE VARCHAR(45) NOT NULL,
EMAIL VARCHAR(45));

CREATE TABLE IF NOT EXISTS DEPARTAMENTOS(
COD_ESPECIALIDADE INT PRIMARY KEY,
NOME_ESPECIALIDADE VARCHAR(45));

CREATE TABLE IF NOT EXISTS MEDICOS(
CRM INT,
UF CHAR(2),
PRIMARY KEY(CRM,UF),
NOME VARCHAR(45) NOT NULL,
EMAIL VARCHAR(45) NOT NULL,
TELEFONE VARCHAR(45) NOT NULL,
DEPTO_COD_ESPEC INT NOT NULL,
CONSTRAINT DEPTO_MED FOREIGN KEY(DEPTO_COD_ESPEC)REFERENCES DEPARTAMENTOS(COD_ESPECIALIDADE));

CREATE TABLE IF NOT EXISTS CONSULTAS(
ID_CONSULTA INT PRIMARY KEY,
ANAMNESE TEXT NOT NULL,
DATA_CONS DATE NOT NULL,
HORA_CONS TIME NOT NULL,
CRM INT NOT NULL,
UF CHAR(2) NOT NULL,
CPF_PACIENTE VARCHAR(15) NOT NULL,
CONSTRAINT MED_CONS FOREIGN KEY(CRM,UF) REFERENCES MEDICOS(CRM,UF),
CONSTRAINT PAC_CONS FOREIGN KEY(CPF_PACIENTE)REFERENCES PACIENTES(CPF_PACIENTE));


insert into PACIENTES
(CPF_PACIENTE, NOME, DATA_NASC, TELEFONE, EMAIL)
VALUES
("111.111.111-22", "ANON NONONON","1970-12-24", "+55999991111", "ANONNONONON@EMAIL.COM"),
("222.222.222-22", "ANAN NANANAN","1975-05-14", "+55999992222", "ANANNANANAN@EMAIL.COM"),
("333.333.333-22", "NONNO NONONON","1970-12-24", "+55999991111", "NONNONONONON@EMAIL.COM");

INSERT INTO DEPARTAMENTOS
(COD_ESPECIALIDADE, NOME, NOME_ESPECIALIDADE)
VALUES
(1,"CARDIOLOGIA"),
(2,"PEDIATRIA"),
(3,"GINECOLOGIA");

INSERT INTO MEDICOS
(CRM,UF,NOME,EMAIL,TELEFONE,DEPTO_COD_ESPEC)
VALUES
("001","AAAAAA","AAAAAA@EMAIL.COM","+55999111111","121212"),
("002","BBBBBB","BBBBBB@EMAIL.COM","+55999222222","222222"),
("003","CCCCCC","CCCCCC@EMAIL.COM","+55999333333","323232");

INSERT INTO CONSULTAS
(ID_CONSULTA,
ANAMNESE,
DATA_CONS,
HORA_CONS,
CRM,
UF,
CPF_PACIENTE)
VALUES
("123",
"Aids",
"01/03",
"10:30",
"001",
"ES",
"822.204.301.32");

SELECT * FROM MEDICO;
UPDATE MEDICOS SET NOME = "MARIA JOAO"
WHERE CRM = "001"


