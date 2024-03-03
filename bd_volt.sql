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
    desc_produto varchar(300)
);
select * from tb_produto;

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

-- Chamado
create table if not exists tb_chamado
(
	id_chamado int primary key auto_increment,
    titulo_chamado varchar(60),
    mensagem_chamado varchar(150),
    data_hora_chamado datetime,
    fk_solicitante int,
    fk_produto int,
    foreign key(fk_solicitante) references tb_usuario(id_usuario),
    foreign key(fk_produto) references tb_produto(id_produto)
);
select * from tb_chamado;

-- Procedimento
create table if not exists tb_procedimento
(
	id_procedimento int primary key auto_increment,
    valor_procedimento decimal(8,2),
    tipo_procedimento tinyint check(tipo_procedimento in (0,1,2)),
    data_hora_procedimento datetime,
    fk_chamado int, 
    fk_destinatario int,
    fk_solicitante int,
    foreign key(fk_chamado) references tb_chamado(id_chamado),
    foreign key(fk_destinatario) references tb_usuario(id_usuario),
    foreign key(fk_solicitante) references tb_usuario(id_usuario)
);
select * from tb_procedimento;

-- Views --------------------------------------------------------------
-- Procedures ---------------------------------------------------------