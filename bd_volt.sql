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
	id_usuario int primary key auto_increment,
    nome_usuario varchar(100),
    email_usuario varchar(100) unique,
    telefone_usuario varchar(14),
    cep_usuario char(9),
    categoria_usuario binary
);
select * from tb_usuario;

-- Produto
create table if not exists tb_produto
(
	id_produto int primary key auto_increment,
    nome_produto varchar(80),
    desc_produto varchar(300),
    categ_produto varchar(100),
    preco_produto decimal(8,2),
    qnt_estoque int
);
select * from tb_produto;

-- Imagem produto
create table if not exists tb_imagem_produto
(
	id_imagem_produto int primary key auto_increment,
    nome_produto varchar(100),
    codigo_imagem blob,
    fk_produto int,
    foreign key(fk_produto) references tb_produto(id_produto)
);
select * from tb_imagem_produto	;

-- Login
create table if not exists tb_login
(
	id_login int primary key auto_increment,
    email_login varchar(100) unique,
    senha_login varchar(100) unique,
    fk_usuario int,
    foreign key(fk_usuario) references tb_usuario(id_usuario)
); 
select * from tb_login;

-- Clique produto
create table if not exists tb_click_produto
(
	id_click_produto int primary key auto_increment,
    data_hora_click datetime,
    possivel_compra binary,
	fk_usuario int,
    foreign key(fk_usuario) references tb_usuario(id_usuario),
	fk_produto int,
    foreign key(fk_produto) references tb_produto(id_produto)
);
select * from tb_click_produto;

-- Tag produto
create table if not exists tb_tag_produto
(
	id_tag_produto int primary key auto_increment,
    tag_produto varchar(50)
);
select * from tb_tag_produto;

-- Classificação produto
create table if not exists tb_classificacao_produto
(
	id_classificacao_produto int primary key auto_increment,
    fk_produto int,
    foreign key(fk_produto) references tb_produto(id_produto),
    fk_tag_produto int,
    foreign key(fk_tag_produto) references tb_tag_produto(id_tag_produto)
);
select * from tb_classificacao_produto;


-- Views --------------------------------------------------------------
-- Procedures ---------------------------------------------------------
>>>>>>> d710be9fc106e285dce7a4820c7954544be6f2d3
