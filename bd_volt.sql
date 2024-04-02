<<<<<<< HEAD
create database bd_volt;
use bd_volt;

-- Tabelas
-- Views
-- Procedures
=======
create database if not exists bd_volt;
use bd_volt;

-- Tabelas --------------------------------------------------

-- Usuario
create table if not exists tb_usuario 
(
	id int primary key auto_increment,
    nome varchar(100),
    email varchar(100) unique,
    telefone varchar(14),
    cep char(9),
    categoria binary
);
select * from tb_usuario;

-- Produto
create table if not exists tb_produto
(
	id int primary key auto_increment,
    nome varchar(80),
    descricao varchar(300),
    categoria varchar(100),
    preco decimal(8,2),
    qtd_estoque int
);
select * from tb_produto;

-- Imagem produto
create table if not exists tb_imagem_produto
(
	id int primary key auto_increment,
    nome varchar(100),
    codigo_imagem blob,
    fk_produto int,
    foreign key(fk_produto) references tb_produto(id)
);
select * from tb_imagem_produto	;

-- Login
create table if not exists tb_login
(
	id int primary key auto_increment,
    email varchar(100) unique,
    senha varchar(100) unique,
    fk_usuario int,
    foreign key(fk_usuario) references tb_usuario(id)
); 
select * from tb_login;

-- Clique produto
create table if not exists tb_click_produto
(
	id int primary key auto_increment,
    data_hora_click datetime,
    possivel_compra binary,
	fk_usuario int,
    foreign key(fk_usuario) references tb_usuario(id),
	fk_produto int,
    foreign key(fk_produto) references tb_produto(id)
);
select * from tb_click_produto;

-- Tag produto
create table if not exists tb_tag_produto
(
	id int primary key auto_increment,
    tag varchar(50)
);
select * from tb_tag_produto;

-- Classificação produto
create table if not exists tb_classificacao_produto
(
	id int primary key auto_increment,
    fk_produto int,
    foreign key(fk_produto) references tb_produto(id),
    fk_tag_produto int,
    foreign key(fk_tag_produto) references tb_tag_produto(id)
);
select * from tb_classificacao_produto;


-- Views --------------------------------------------------------------
-- Procedures ---------------------------------------------------------
>>>>>>> d710be9fc106e285dce7a4820c7954544be6f2d3
