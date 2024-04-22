create database if not exists sis_evento;
use sis_evento;

create table if not exists locais(
id_local int primary key,
nome varchar(45) not null,
logradouro varchar(45) not null,
numero int,
bairro varchar(45) not null,
cidade varchar(45) not null,
uf varchar(2) not null,
cep varchar(45) not null,
capacidade int not null
);

create table if not exists participantes(
num_inscricao int,
cpf varchar(20) not null,
nome varchar(100) not null,
data_nasc date not null,
empresa varchar(100),
primary key(num_inscricao, cpf)
);

create table if not exists eventos(
id_evento int primary key,
nome_evento varchar(100) not null,
data_evento date not null,
promotor_evento varchar(100) not null,
local_evento int not null,
constraint loc_eve foreign key(local_evento)
references locais(id_local)
);

create table if not exists atividades(
id_atividade int primary key,
nome_atividade varchar(100) not null,
data_atividade date not null,
hora_atividade time not null,
evento_at int not null,
local_at int not null,
constraint evt_atv foreign key(evento_at)
references eventos(id_evento),
constraint lcl_atv foreign key(local_at)
references locais(id_local)
);

create table if not exists participante_evento_atividade(
inscricao int,
cpf varchar(20),
atividade int,
evento int,
primary key(atividade,inscricao,evento,cpf),
constraint prt_atv1 foreign key(inscricao,cpf)
references participantes(num_inscricao, cpf),
constraint prt_atv2 foreign key(atividade)
references atividades(id_atividade),
constraint prt_atv3 foreign key(evento)
references eventos(id_evento)
);

create table if not exists participante_evento(
inscritos int,
cpf varchar(20),
eventos int,
local_evento int,

);