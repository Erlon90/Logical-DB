use bdex1_hospital;


#1. Quais são os pacientes agendados para consulta com um determinado médico,incluindo informações do médico, em uma determinada data?
select c cpf_paciente ,CRM c,c data_consulta from consultas c 
join paciente p on p cpf_paciente = c pac_cons

;


#2. Quais são os médicos e seus respectivos departamentos, incluindo aqueles que não estão associados a nenhum departamento?
select m.nome, m.depto_cod_espec, d.nome_especialidade from medicos m 
left join departamentos d on d.cod_especialidade = m.depto_cod_espec;


#3. Quais são os pacientes que já passaram por consulta com um determinado médico, incluindo informações do médico, mesmo que não tenham sido atendidos?
select p.nome , m.nome from pacientes p
left join medicos on depto_cod_especialidade =
