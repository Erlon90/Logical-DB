USE hospital;


#COMANDOS DE INSERÇÃO
INSERT INTO PACIENTES (CPF_PACIENTE, NOME, DATA_NASC, TELEFONE, EMAIL) VALUES
('12345678900', 'João da Silva', '1980-01-01', '(11) 9999-9999', 'joao.silva@email.com'),
('98765432101', 'Maria Oliveira', '1990-02-02', '(21) 8888-8888', 'maria.oliveira@email.com'),
('00012345678', 'Carlos Santos', '2000-03-03', '(31) 7777-7777', 'carlos.santos@email.com'),
('11122233344', 'Ana Souza', '2010-04-04', '(41) 6666-6666', 'ana.souza@email.com'),
('22233344455', 'Pedro Pereira', '2020-05-05', '(51) 5555-5555', 'pedro.pereira@email.com');

INSERT INTO DEPARTAMENTOS (COD_ESPECIALIDADE, NOME_ESPECIALIDADE) VALUES
(1, 'Cardiologia'),
(2, 'Pediatria'),
(3, 'Oftalmologia'),
(4, 'Neurologia'),
(5, 'Ortopedia');

INSERT INTO MEDICOS (CRM, UF, NOME, EMAIL, TELEFONE, DEPTO_COD_ESPEC) VALUES
(12345, 'SP', 'Dr. Alberto Souza', 'alberto.souza@medico.com', '(19) 9988-7766', 1),
(54321, 'RJ', 'Dra. Beatriz Santos', 'beatriz.santos@medico.com', '(22) 9876-5544', 2),
(98765, 'MG', 'Dr. Carlos Silva', 'carlos.silva@medico.com', '(31) 9765-4322', 3),
(32105, 'BA', 'Dra. Daniela Oliveira', 'daniela.oliveira@medico.com', '(71) 9654-3211', 5),
(76543, 'RS', 'Dr. Eduardo Pereira', 'eduardo.pereira@medico.com', '(53) 9543-2100', 1);

INSERT INTO CONSULTAS (ID_CONSULTA, ANAMNESE, DATA_CONS, HORA_CONS, CRM, UF, CPF_PACIENTE) VALUES
(1, 'Dor de cabeça persistente há 3 dias', '2024-04-25', '10:00:00', 12345, 'SP', '12345678900'),
(2, 'Febre e tosse há 2 dias', '2024-04-26', '14:00:00', 54321, 'RJ', '98765432101'),
(3, 'Consulta de rotina', '2024-04-27', '09:00:00', 98765, 'MG', '00012345678'),
(4, 'Exame oftalmológico', '2024-04-28', '11:30:00', 32105, 'BA', '11122233344'),
(5, 'Retorno ortopédico', '2024-04-29', '15:00:00', 76543, 'RS', '22233344455');



SELECT NOME,DATA_NASC FROM PACIENTES;
SELECT COUNT(*) FROM MEDICOS;
SELECT AVG(timestampdiff(YEAR, DATA_NASC,curdate())) as media_idade FROM PACIENTES;


SELECT * FROM PACIENTES ORDER BY timestampdiff(year,data_nasc,curdate());

SELECT D.NOME_ESPECIALIDADE, COUNT(*) AS QUANTITI from pacientes p JOIN CONSULTAS C ON C.CPF_PACIENTE = P.CPF_PACIENTE JOIN MEDICOS  M ON M.CRM = C.CRM AND C.UF = M.UF
JOIN DEPARTAMENTOS D ON D.COD_ESPECIALIDADE = M.DEPTO_COD_ESPEC
group by D.NOME_ESPECIALIDADE;


SELECT D.cod_especialidade,round(AVG(timestampdiff(YEAR, DATA_NASC,curdate()))) as media_idade from pacientes p 
JOIN CONSULTAS C ON C.CPF_PACIENTE = P.CPF_PACIENTE JOIN MEDICOS  M ON M.CRM = C.CRM AND C.UF = M.UF
JOIN DEPARTAMENTOS D ON D.COD_ESPECIALIDADE = M.DEPTO_COD_ESPEC group by d.cod_especialidade;
