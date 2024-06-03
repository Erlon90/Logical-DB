CREATE DATABASE IF NOT EXISTS REDESOCIAL;
USE REDESOCIAL;

CREATE TABLE IF NOT EXISTS GRUPOS(
ID_GROUP INT PRIMARY KEY,
NOME_GRUPO VARCHAR(100) NOT NULL,
DESCRICAO TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS USUARIOS(
ID_USUARIO INT PRIMARY KEY,
NOME VARCHAR(100) NOT NULL,
SOBRENOME VARCHAR(100) NOT NULL,
EMAIL VARCHAR(45) NOT NULL
);
CREATE TABLE IF NOT EXISTS POSTAGENS(
ID_POST INT PRIMARY KEY,
TEXTO TEXT NOT NULL,
IMAGEM BLOB,
DATA_HORA TIMESTAMP NOT NULL,
USUARIO INT,
CONSTRAINT USER_POST FOREIGN KEY(USUARIO) REFERENCES USUARIOS(ID_USUARIO)
);
CREATE TABLE IF NOT EXISTS COMENTARIOS(
ID_COMMENT INT PRIMARY KEY,
TEXTO TEXT NOT NULL,
DATA_HORA TIMESTAMP NOT NULL,
USUARIO INT,
POST INT,
CONSTRAINT USER_COMM FOREIGN KEY(USUARIO) REFERENCES USUARIOS(ID_USUARIO),
CONSTRAINT POST_COMM FOREIGN KEY(POST) REFERENCES POSTAGENS(ID_POST)
);
CREATE TABLE IF NOT EXISTS USUARIOS_GRUPOS(
SEGUIDOR INT,
GRUPO INT,
PRIMARY KEY(SEGUIDOR,GRUPO),
CONSTRAINT USER_GROU FOREIGN KEY(SEGUIDOR) REFERENCES USUARIOS(ID_USUARIO),
CONSTRAINT GROU_USER FOREIGN KEY(GRUPO) REFERENCES GRUPOS(ID_GROUP)
);
CREATE TABLE IF NOT EXISTS SEGUIDORES_USUARIOS(
SEGUIDOR INT,
SEGUIDO INT,
PRIMARY KEY(SEGUIDOR,SEGUIDO),
CONSTRAINT USER_1 FOREIGN KEY(SEGUIDOR) REFERENCES USUARIOS(ID_USUARIO),
CONSTRAINT USER_2 FOREIGN KEY(SEGUIDO) REFERENCES USUARIOS(ID_USUARIO)
);

#ALTERANDO O TIPO E RESTRIÇÃO DAS COLUNAS
ALTER TABLE COMENTARIOS
MODIFY COLUMN USUARIO INT NOT NULL;

ALTER TABLE COMENTARIOS
MODIFY COLUMN POST INT NOT NULL;

INSERT INTO USUARIOS (ID_USUARIO, NOME_USUARIO, SOBRENOME, EMAIL) VALUES
    (1, 'Joao', 'Silva', 'joao@example.com'),
    (2, 'Maria', 'Santos', 'maria@example.com'),
    (3, 'Pedro', 'Almeida', 'pedro@example.com'),
    (4, 'Ana', 'Lima', 'ana@example.com'),
    (5, 'Carlos', 'Oliveira', 'carlos@example.com');

INSERT INTO GRUPOS (ID_GRUPO, NOME_GRUPO, DESCRICAO) VALUES
    (1, 'Amigos', 'Grupo de amigos próximos'),
    (2, 'Trabalho', 'Grupo de colegas de trabalho'),
    (3, 'Família', 'Grupo de familiares'),
    (4, 'Esportes', 'Grupo para discutir sobre esportes'),
    (5, 'Música', 'Grupo para compartilhar músicas favoritas');

INSERT INTO POSTAGENS (ID_POST, TEXTO, DATA_HORA, USUARIO) VALUES
    (1, 'Primeira postagem!', '2024-04-29 10:00:00', 1),
    (2, 'Olá pessoal!', '2024-04-30 15:30:00', 2),
    (3, 'Bom dia!', '2024-05-01 08:45:00', 3),
    (4, 'Que dia lindo!', '2024-05-02 11:20:00', 4),
    (5, 'Compartilhando uma foto...', '2024-05-03 18:00:00', 5);

INSERT INTO COMENTARIOS (ID_COMENTARIO, TEXTO, DATAHORA, USUARIO, POST) VALUES
    (1, 'Ótima postagem!', '2024-04-29 10:15:00', 2, 1),
    (2, 'Parabéns!', '2024-04-30 15:45:00', 3, 2),
    (3, 'Bom dia para você também!', '2024-05-01 09:00:00', 4, 3),
    (4, 'Realmente!', '2024-05-02 11:30:00', 5, 4),
    (5, 'Que foto incrível!', '2024-05-03 18:15:00', 1, 5);

INSERT INTO SEGUIDORES_USUARIOS (USUARIO, SEGUIDOR) VALUES
    (1, 2),
    (1, 3),
    (2, 1),
    (3, 1),
    (4, 1);

INSERT INTO USUARIOS_GRUPOS (USUARIO, GRUPO) VALUES
    (1, 1),
    (1, 2),
    (2, 1),
    (2, 3),
    (3, 2);

UPDATE USUARIOS SET NOME_USUARIO = 'João Silva' WHERE ID_USUARIO = 1;
UPDATE USUARIOS SET SOBRENOME = 'Santana' WHERE ID_USUARIO = 2;

UPDATE GRUPOS SET NOME_GRUPO = 'Amigos Próximos' WHERE ID_GRUPO = 1;
UPDATE GRUPOS SET DESCRICAO = 'Grupo de colegas de trabalho próximos' WHERE ID_GRUPO = 2;

UPDATE POSTAGENS SET TEXTO = 'Nova postagem!' WHERE ID_POST = 1;
UPDATE POSTAGENS SET DATA_HORA = '2024-05-01 12:00:00' WHERE ID_POST = 2;

UPDATE COMENTARIOS SET TEXTO = 'Bela foto!' WHERE ID_COMENTARIO = 1;
UPDATE COMENTARIOS SET DATAHORA = '2024-05-02 10:00:00' WHERE ID_COMENTARIO = 2;

UPDATE SEGUIDORES_USUARIOS SET SEGUIDOR = 3 WHERE USUARIO = 1;
UPDATE SEGUIDORES_USUARIOS SET USUARIO = 4 WHERE SEGUIDOR = 1;

UPDATE USUARIOS_GRUPOS SET GRUPO = 3 WHERE USUARIO = 1;
UPDATE USUARIOS_GRUPOS SET USUARIO = 2 WHERE GRUPO = 1;


SELECT NOME_USUARIO,SOBRENOME FROM USUARIO;

SELECT COUNT(*) FROM GRUPOS;

SELECT AVG(CONTAGEM) AS MEDIA_COMENTARIOS_POR_POSTAGEM FROM(SELECT COUNT(*) AS CONTAGEM FROM COMENTARIOS group by POST) AS CONTADOR;
