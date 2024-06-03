create database if not exists BDEX4_ESTOQUE;
use BDEX4_ESTOQUE;

CREATE TABLE IF NOT EXISTS PRODUTOS(
ID_PRODUTO INT PRIMARY KEY,
NOME_PRO VARCHAR(100) NOT NULL,
DESCRICAO TEXT NOT NULL,
PRECO DECIMAL(10,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS FORNECEDORES(
ID_FORNECEDOR INT PRIMARY KEY,
CNPJ VARCHAR(20) NOT NULL,
NOME_FOR VARCHAR(100) NOT NULL,
CIDADE VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS ARMAZENS(
ID_ARMAZEM INT PRIMARY KEY,
NOME_ARMAZEM VARCHAR(100) NOT NULL,
LOG_ARMAZEM VARCHAR(100) NOT NULL,
NUMLOG_ARMAZEM INT,
BAIRRO_ARMAZEM VARCHAR(100) NOT NULL,
CIDADE_ARMAZEM VARCHAR(100) NOT NULL,
UF_ARMAZEM CHAR(2) NOT NULL);

CREATE TABLE IF NOT EXISTS PRODUTOS_FORNECEDORES(
PRODUTO INT,
FORNECEDOR INT,
PRIMARY KEY(PRODUTO,FORNECEDOR),
CONSTRAINT PROD_FORN FOREIGN KEY(PRODUTO) REFERENCES PRODUTOS(ID_PRODUTO),
CONSTRAINT FORN_PROD FOREIGN KEY(FORNECEDOR) REFERENCES FORNECEDORES(ID_FORNECEDOR)
);

CREATE TABLE IF NOT EXISTS PEDIDOS_COMPRA(
ID_PEDIDO INT NOT NULL,
DATA_PEDIDO DATE NOT NULL,
HORA_PEDIDO TIME NOT NULL,
FORNECEDOR INT NOT NULL,
PRODUTO INT NOT NULL,
QUANTIDADE INT NOT NULL,
PRIMARY KEY(ID_PEDIDO,FORNECEDOR,PRODUTO),
CONSTRAINT FORNECEDOR_PEDIDO FOREIGN KEY(FORNECEDOR) REFERENCES FORNECEDORES(ID_FORNECEDOR),
CONSTRAINT PRODUTO_PEDIDO FOREIGN KEY(PRODUTO) REFERENCES PRODUTOS(ID_PRODUTO)
);

CREATE TABLE IF NOT EXISTS PRODUTOS_ARMAZENS(
PRODUTO INT NOT NULL,
ARMAZEM INT NOT NULL,
QUANTIDADE INT NOT NULL,
PRIMARY KEY(PRODUTO, ARMAZEM),
CONSTRAINT PRODUTO_ARMAZEM FOREIGN KEY(PRODUTO) REFERENCES PRODUTOS(ID_PRODUTO),
CONSTRAINT ARMAZEM_PRODUTO FOREIGN KEY(ARMAZEM) REFERENCES ARMAZENS(ID_ARMAZEM)
);

INSERT INTO PRODUTOS (ID_PRODUTO, NOME_PRO, DESCRICAO, PRECO) VALUES
(1, 'Camiseta', 'Camiseta branca de algodão', 25.90),
(2, 'Calça Jeans', 'Calça jeans slim azul', 59.99),
(3, 'Tênis', 'Tênis esportivo preto', 79.50),
(4, 'Relógio', 'Relógio de pulso analógico', 99.00),
(5, 'Mochila', 'Mochila escolar resistente', 39.90),
(6, 'Notebook', 'Notebook Intel Core i5', 1899.99),
(7, 'Smartphone', 'Smartphone Android com câmera de alta resolução', 799.00),
(8, 'Fones de Ouvido', 'Fones de ouvido sem fio', 129.90),
(9, 'Cadeira', 'Cadeira de escritório ergonômica', 199.00),
(10, 'Mesa', 'Mesa de jantar retangular', 299.99),
(11, 'Luminária', 'Luminária de mesa LED', 49.90),
(12, 'Tapete', 'Tapete felpudo para sala', 79.00),
(13, 'Panela', 'Panela de pressão antiaderente', 39.99),
(14, 'Liquidificador', 'Liquidificador potente com várias velocidades', 89.90),
(15, 'Ventilador', 'Ventilador de mesa com 3 velocidades', 69.00),
(16, 'Cama', 'Cama box casal com colchão ortopédico', 799.00),
(17, 'Travesseiro', 'Travesseiro de espuma viscoelástica', 29.90),
(18, 'Toalha de Banho', 'Toalha de banho felpuda', 19.99),
(19, 'Guarda-chuva', 'Guarda-chuva dobrável resistente ao vento', 15.00),
(20, 'Cadeado', 'Cadeado de segredo para bagagem', 9.99);

INSERT INTO FORNECEDORES (ID_FORNECEDOR, CNPJ, NOME_FOR, CIDADE) VALUES
(1, '12345678901', 'MegaTech Distribuidora', 'São Paulo'),
(2, '23456789012', 'Fashion Supplier', 'Rio de Janeiro'),
(3, '34567890123', 'Food King', 'Belo Horizonte'),
(4, '45678901234', 'ElectroParts', 'Curitiba'),
(5, '56789012345', 'Aqua Supplies', 'Porto Alegre'),
(6, '67890123456', 'Natureza & Cia', 'Recife'),
(7, '78901234567', 'PetLove', 'Salvador'),
(8, '89012345678', 'TechWiz', 'Fortaleza'),
(9, '90123456789', 'BioFarm', 'Brasília'),
(10, '01234567890', 'HomeDecor', 'Manaus'),
(11, '98765432109', 'Books & More', 'Belém'),
(12, '87654321098', 'Fit&Fab', 'Goiânia'),
(13, '76543210987', 'Healthy Supplies', 'Porto Velho'),
(14, '65432109876', 'BeautyHub', 'Florianópolis'),
(15, '54321098765', 'PhotoGear', 'Vitória'),
(16, '43210987654', 'GameZone', 'Natal'),
(17, '32109876543', 'EduCorp', 'João Pessoa'),
(18, '21098765432', 'OfficeTech', 'Maceió'),
(19, '10987654321', 'History Emporium', 'Teresina'),
(20, '09876543210', 'Adventure Gear', 'Cuiabá');

INSERT INTO ARMAZENS (ID_ARMAZEM, NOME_ARMAZEM, LOG_ARMAZEM, NUMLOG_ARMAZEM, BAIRRO_ARMAZEM, CIDADE_ARMAZEM, UF_ARMAZEM) VALUES
(1, 'MegaDepot', 'Avenida das Indústrias', 100, 'Industrial', 'São Paulo', 'SP'),
(2, 'FashionHub', 'Rua das Tendências', 200, 'Moda', 'Rio de Janeiro', 'RJ'),
(3, 'Food Central', 'Rua dos Alimentos', 300, 'Culinária', 'Belo Horizonte', 'MG'),
(4, 'ElectroStore', 'Avenida da Tecnologia', 400, 'Tecnopark', 'Curitiba', 'PR'),
(5, 'AquaWarehouse', 'Rua dos Aquários', 500, 'Aquatic', 'Porto Alegre', 'RS'),
(6, 'NatureShed', 'Rua das Plantas', 600, 'Green Valley', 'Recife', 'PE'),
(7, 'PetDepot', 'Avenida dos Pets', 700, 'Animalia', 'Salvador', 'BA'),
(8, 'TechZone', 'Rua da Inovação', 800, 'Techville', 'Fortaleza', 'CE'),
(9, 'BioMarket', 'Avenida da Saúde', 900, 'Health District', 'Brasília', 'DF'),
(10, 'HomeBase', 'Rua dos Lares', 1000, 'Residential', 'Manaus', 'AM'),
(11, 'BookEmporium', 'Avenida das Páginas', 1100, 'Literary', 'Belém', 'PA'),
(12, 'FitWarehouse', 'Rua do Fitness', 1200, 'Active', 'Goiânia', 'GO'),
(13, 'HealthSpot', 'Avenida do Bem-Estar', 1300, 'Healthy Living', 'Porto Velho', 'RO'),
(14, 'BeautyBazaar', 'Rua da Beleza', 1400, 'Glamour', 'Florianópolis', 'SC'),
(15, 'PhotoHouse', 'Avenida das Fotos', 1500, 'Snapshot', 'Vitória', 'ES'),
(16, 'GameEmpire', 'Rua dos Jogos', 1600, 'Gamer District', 'Natal', 'RN'),
(17, 'EduCenter', 'Avenida do Conhecimento', 1700, 'Educational', 'João Pessoa', 'PB'),
(18, 'OfficeHub', 'Rua do Trabalho', 1800, 'Business District', 'Maceió', 'AL'),
(19, 'HistoryHall', 'Avenida da História', 1900, 'Historical', 'Teresina', 'PI'),
(20, 'AdventureBase', 'Rua da Aventura', 2000, 'Explorer', 'Cuiabá', 'MT');

-- Inserção na tabela PRODUTOS_FORNECEDORES
INSERT INTO PRODUTOS_FORNECEDORES (PRODUTO, FORNECEDOR) VALUES
    (1, 1), (3, 1), (5, 1),
    (2, 8), (4, 9), (6, 10),
    (7, 3), (1, 7), (9, 5),
    (10, 4),
    (11, 6), (12, 12),
    (13, 2), (14, 4),
    (15, 10), (16, 11),
    (17, 7), (18, 6),
    (19, 8), (2, 9),
    (20, 1), (2, 3), (13, 5),
    (4, 2), (5, 4), (16, 6),
    (7, 8), (8, 10), (19, 12),
    (3, 11),
    (1, 9), (2, 7),
    (3, 6), (4, 4),
    (5, 2), (6, 1),
    (7, 10), (8, 5),
    (9, 3), (4, 8);

-- Inserção na tabela PRODUTOS_ARMAZENS
INSERT INTO PRODUTOS_ARMAZENS (PRODUTO, ARMAZEM, QUANTIDADE) VALUES
    (1, 1, 50), (3, 1, 80), (5, 1, 120),
    (2, 2, 100), (4, 2, 70), (6, 2, 90),
    (7, 3, 50), (8, 3, 200), (9, 3, 70),
    (10, 4, 80),
    (11, 5, 30), (12, 5, 40),
    (13, 6, 100), (14, 6, 80),
    (15, 8, 150), (16, 8, 60),
    (17, 10, 200), (18, 10, 120),
    (19, 12, 50), (20, 12, 70),
    (2, 1, 25), (12, 2, 45), (13, 3, 65),
    (4, 4, 35), (15, 5, 55), (16, 6, 75),
    (7, 7, 95), (18, 8, 115), (19, 9, 135),
    (3, 10, 155),
    (1, 11, 175), (2, 12, 195),
    (9, 1, 215), (14, 2, 235),
    (5, 3, 255), (6, 4, 275),
    (7, 5, 295), (8, 6, 315),
    (9, 7, 335), (4, 8, 355);

-- Lista de inserções para a tabela PEDIDOS_COMPRA considerando a integridade referencial
INSERT INTO PEDIDOS_COMPRA (ID_PEDIDO, DATA_PEDIDO, HORA_PEDIDO, FORNECEDOR, PRODUTO, QUANTIDADE) VALUES
(1, '2024-05-20', '10:00:00', 1, 1, 50),
(1, '2024-05-21', '11:30:00', 1, 3, 100),
(1, '2024-05-22', '09:45:00', 1, 5, 80),
(2, '2024-05-23', '14:20:00', 8, 2, 70),
(2, '2024-05-24', '16:55:00', 9, 4, 120),
(2, '2024-05-25', '09:00:00', 10, 6, 90),
(3, '2024-05-26', '10:30:00', 3, 7, 50),
(3, '2024-05-27', '13:45:00', 7, 1, 200),
(3, '2024-05-28', '15:20:00', 5, 9, 70),
(3, '2024-05-29', '17:00:00', 4, 10, 80),
(3, '2024-05-30', '08:15:00', 6, 11, 30),
(4, '2024-05-31', '11:10:00', 12, 12, 40),
(4, '2024-06-01', '14:00:00', 2, 13, 100),
(14, '2024-06-02', '16:45:00', 4, 14, 80),
(5, '2024-06-03', '09:30:00', 10, 15, 150),
(6, '2024-06-04', '12:20:00', 11, 16, 60),
(7, '2024-06-05', '15:10:00', 7, 17, 200),
(8, '2024-06-06', '17:30:00', 6, 18, 120),
(8, '2024-06-07', '08:45:00', 8, 19, 50),
(8, '2024-06-08', '10:40:00', 1, 20, 70),
(9, '2024-06-09', '13:20:00', 3, 2, 25),
(9, '2024-06-10', '15:55:00', 5, 13, 45),
(9, '2024-06-11', '09:25:00', 2, 4, 65),
(9, '2024-06-12', '11:50:00', 4, 5, 35),
(9, '2024-06-13', '14:35:00', 6, 16, 55),
(9, '2024-06-14', '16:10:00', 8, 7, 75),
(9, '2024-06-15', '08:20:00', 10, 8, 95),
(10, '2024-06-16', '10:15:00', 12, 19, 115),
(11, '2024-06-17', '13:00:00', 11, 3, 135),
(11, '2024-06-18', '15:40:00', 9, 1, 155),
(12, '2024-06-19', '17:20:00', 7, 2, 175),
(13, '2024-06-20', '08:35:00', 6, 3, 195),
(13, '2024-06-21', '10:25:00', 4, 4, 215),
(14, '2024-06-22', '12:15:00', 2, 5, 235),
(15, '2024-06-23', '14:05:00', 1, 6, 255),
(16, '2024-06-24', '16:45:00', 10, 7, 275),
(17, '2024-06-25', '09:50:00', 5, 8, 295),
(18, '2024-06-26', '11:30:00', 10, 9, 315),
(19, '2024-06-27', '13:20:00', 3, 4, 335),
(20, '2024-06-28', '15:10:00', 4, 5, 355);

-- Atualizar o preço do produto com ID 1 e a descrição do fornecedor com ID 2
UPDATE PRODUTOS
SET PRECO = 29.90
WHERE ID_PRODUTO = 1;

UPDATE FORNECEDORES
SET DESCRICAO = 'Fornecedor de moda contemporânea'
WHERE ID_FORNECEDOR = 2;

-- Atualizar a cidade do armazém com ID 3 e o logradouro do produto com ID 4
UPDATE ARMAZENS
SET CIDADE_ARMAZEM = 'Porto Velho'
WHERE ID_ARMAZEM = 3;

UPDATE PRODUTOS
SET LOG_ARMAZEM = 'Avenida da Tecnologia, 200'
WHERE ID_PRODUTO = 4;

-- Atualizar o preço do produto com ID 5 e a quantidade do produto no armazém com ID 6
UPDATE PRODUTOS
SET PRECO = 49.90
WHERE ID_PRODUTO = 5;

UPDATE PRODUTOS_ARMAZENS
SET QUANTIDADE = 150
WHERE PRODUTO = 6;

-- Atualizar a descrição do fornecedor com ID 7 e a quantidade do produto no armazém com ID 8
UPDATE FORNECEDORES
SET DESCRICAO = 'Distribuidora de produtos para animais de estimação'
WHERE ID_FORNECEDOR = 7;

UPDATE PRODUTOS_ARMAZENS
SET QUANTIDADE = 180
WHERE PRODUTO = 8;

-- Atualizar o nome do produto com ID 9 e o CNPJ do fornecedor com ID 10
UPDATE PRODUTOS
SET NOME = 'Cadeira Ergonômica'
WHERE ID_PRODUTO = 9;

UPDATE FORNECEDORES
SET CNPJ = '109876543210'
WHERE ID_FORNECEDOR = 10;

#1. Exibir todas as informações da tabela `PRODUTOS`.
select * from produtos;
#2. Mostrar os nomes e preços dos produtos que custam mais de 50,00.
select p.nome_pro, p.preco  from produtos p where (p.preco > '50,00');

#3. Listar os nomes e cidades dos fornecedores.
select f.nome_for, f.cidade from fornecedores f order by f.nome_for;

#4. Exibir os detalhes dos pedidos de compra: ID do pedido, data, hora e nome do fornecedor.
select pc.id_pedido, pc.data_pedido , pc.hora_pedido, f.nome_for fornecedores from pedidos_compra pc
join fornecedores f on pc.fornecedor = f.id_fornecedor
group by pc.fornecedor
;
#5. Listar o nome dos produtos e a quantidade disponível em cada armazém.
select p.nome_pro, pa.quantidade from produtos_armazens pa
join produtos p on pa.produto = p.id_produto 
group by pa.produto
order by p.nome_pro;

#6. Mostrar os nomes dos fornecedores que têm produtos no armazém de "São Paulo".
select f.nome_for fornecedores from fornecedores f  
join pedidos_compra pc on pc.fornecedor = f.id_fornecedor
join produtos p on pc.produto = p.id_produto
join produtos_armazens pa on pa.produto = id_produto
join armazens a on pa.armazem = a.id_armazem
where a.cidade_armazem like 'São Paulo';
#7. Listar todos os armazéns, ordenados pelo nome do armazém de A a Z.
#8. Mostrar os nomes dos produtos que têm a palavra "Premium" na descrição.
#9. Exibir os detalhes dos produtos: ID do produto, nome, descrição, preço e nome dos fornecedores.
#10. Para cada pedido de compra, mostrar o ID do pedido e a quantidade total de produtos solicitados.
#11. Contar quantos produtos cada fornecedor oferece.
#12. Listar os nomes dos produtos e a quantidade disponível no armazém "Rio de Janeiro".
#13. Mostrar o nome dos fornecedores e a data e hora do último pedido de compra que eles receberam.
#14. Contar quantos pedidos de compra cada fornecedor recebeu.
#15. Para cada armazém, exibir o nome do armazém e a quantidade total de produtos armazenados nele.