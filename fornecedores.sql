create database if not exists fornecedores;
use fornecedores;

create table if not exists fornecedor(
id_fornecedor int primary key,
cnpj varchar(20) not null,
nome varchar(45) not null,
cidade varchar(45) not null
);

create table if not exists produtos(
id_produto int primary key,
nome varchar(100) not null,
descrição text not null,
preço decimal(10,2) not null,
produtoScol varchar(45) not null
);

create table if not exists armazens(
id_armazem int primary key,
nome_armazem varchar(45) not null,
logradouro varchar(45) not null,
numero int ,
bairro varchar(45) not null,
cidade varchar(45) not null,
cep varchar(10) not null,
uf char(2) not null
);

create table if not exists pedidos_de_compra(
id_pedido int primary key,
data_pedido date,
hora_pedido time not null,
fornecedor int,
constraint fornecedor_pedido foreign key(fornecedor) 
references fornecedor(id_fornecedor)
);

create table if not exists produto_fornecedor(
produto int,
fornecedor int,
primary key(produto,fornecedor),
constraint prod_forn foreign key (produto)
references produtos(id_produto),
constraint forn_prod foreign key (fornecedor)
references fornecedor(id_fornecedor)
);

create table if not exists pedido_produto(
pedido int,
produto int,
primary key(pedido,produto),
constraint ped_prod foreign key(pedido) 
references pedidos_de_compra(id_pedido),
constraint prod_ped foreign key(produto) 
references produtos(id_produto)
);

create table if not exists produto_armazem(
produto int,
armazem int,
primary key(produto,armazem),
constraint prod_armz foreign key (produto) 
references produtos(id_produto),
constraint armz_prod foreign key(armazem) 
references armazens(id_armazem)
);

alter table pedidos_de_compra
modify column fornecedor int not null;

