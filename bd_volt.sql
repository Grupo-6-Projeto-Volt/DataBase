drop database if exists bd_volt;
create database if not exists bd_volt;
use bd_volt;

-- Tabelas --------------------------------------------------

-- Usuario
create table if not exists tb_usuario 
(
	id int primary key auto_increment,
	nome varchar(100) not null,
	email varchar(100) not null unique,
	telefone varchar(14) not null unique,
	categoria tinyint(1)
);

-- Produto
create table if not exists tb_produto
(
	id int primary key auto_increment,
	nome varchar(80) not null,
	descricao varchar(300) not null,
	categoria varchar(100) not null,
	preco decimal(8,2) not null,
	qtd_estoque int,
    estado_geral varchar(45) not null,
    desconto int
);

-- Imagem produto
create table if not exists tb_imagem_produto
(
	id int primary key auto_increment,
	nome varchar(100),
	codigo_imagem blob,
	fk_produto int,
	foreign key(fk_produto) references tb_produto(id)
);

-- Login
create table if not exists tb_login
(
	id VARCHAR(36) primary key,
	email varchar(255) unique,
	senha varchar(16) not null unique,
	fk_usuario int,
	foreign key(fk_usuario) references tb_usuario(id)
); 

-- Clique produto
create table if not exists tb_click_produto
(
	id int primary key auto_increment,
	data_hora_click datetime,
	possivel_compra tinyint(1),
	fk_usuario int,
	foreign key(fk_usuario) references tb_usuario(id),
	fk_produto int,
	foreign key(fk_produto) references tb_produto(id)
);

-- Tag produto
create table if not exists tb_tag_produto
(
	id int primary key auto_increment,
	tag varchar(50)
);

-- Classificação produto
create table if not exists tb_classificacao_produto
(
	id int primary key auto_increment,
	fk_tag_produto int,
	foreign key(fk_tag_produto) references tb_tag_produto(id),
	fk_produto int,
	foreign key(fk_produto) references tb_produto(id)
);

create table if not exists tb_favoritos
(
	id int primary key auto_increment,
    fk_usuario int,
    foreign key(fk_usuario) references tb_usuario(id)
);

create table if not exists tb_lista_favoritos
(
	id int primary key auto_increment,
    dt_hora_insercao datetime,
    fk_favoritos int,
    foreign key(fk_favoritos) references tb_favoritos(id),
	fk_produto int,
    foreign key(fk_produto) references tb_produto(id)
);


-- Inserts ------------------------------------------------------------

-- Inserts para tabela tb_usuario
INSERT INTO tb_usuario (nome, email, telefone, categoria) VALUES
('João Silva', 'joao@example.com', '123456789', 0),
('Maria Santos', 'maria@example.com', '987654321', 0),
('Pedro Oliveira', 'pedro@example.com', '111111111', 1),
('Ana Souza', 'ana@example.com', '222222222', 0),
('Lucas Fernandes', 'lucas@example.com', '333333333', 1),
('Fernanda Lima', 'fernanda@example.com', '444444444', 0),
('Gabriel Martins', 'gabriel@example.com', '555555555', 1),
('Laura Oliveira', 'laura@example.com', '666666666', 0),
('Rafaela Pereira', 'rafaela@example.com', '777777777', 1),
('Marcos Almeida', 'marcos@example.com', '888888888', 0);

-- Inserts para tabela tb_login
INSERT INTO tb_login (id, email, senha, fk_usuario) VALUES
(UUID(), 'joao@example.com', 'senha123', 1),
(UUID(), 'maria@example.com', 'senha456', 2),
(UUID(), 'pedro@example.com', 'senha789', 3),
(UUID(), 'ana@example.com', 'senha101112', 4),
(UUID(), 'lucas@example.com', 'senha131415', 5),
(UUID(), 'fernanda@example.com', 'senha161718', 6),
(UUID(), 'gabriel@example.com', 'senha192021', 7),
(UUID(), 'laura@example.com', 'senha222324', 8),
(UUID(), 'rafaela@example.com', 'senha252627', 9),
(UUID(), 'marcos@example.com', 'senha282930', 10);

-- Inserts para tabela tb_produto
INSERT INTO tb_produto (nome, descricao, categoria, preco, qtd_estoque, estado_geral, desconto) VALUES
('Notebook Dell', 'Notebook Dell Inspiron 15', 'Computador', 2500.00, 10, "Novo", 15),
('Smartphone Samsung', 'Smartphone Samsung Galaxy S21', 'Celular', 1800.00, 15, "Semi novo", 4),
('Teclado mecânico', 'Teclado mecânico para jogos', 'Acessório', 150.00, 20, "Novo", 0),
('Mouse gamer', 'Mouse gamer com sensor óptico', 'Acessório', 80.00, 30, "Semi novo", 0),
('Monitor LG', 'Monitor LG UltraWide 29', 'Acessório', 600.00, 5, "Novo", 10),
('iPhone 13', 'Smartphone Apple iPhone 13', 'Celular', 2000.00, 12, "Novo", 7),
('Headset Bluetooth', 'Headset Bluetooth JBL', 'Acessório', 120.00, 25, "Semi novo", 10),
('Tablet Samsung', 'Tablet Samsung Galaxy Tab A7', 'Acessório', 400.00, 18, "Semi novo", 2),
('Câmera Canon', 'Câmera digital Canon EOS Rebel T7', 'Acessório', 700.00, 8, "Novo", 12),
('Notebook HP', 'Notebook HP Pavilion 14', 'Computador', 1800.00, 10, "Semi novo", 5);

-- Inserts para tabela tb_imagem_produto
INSERT INTO tb_imagem_produto (nome, codigo_imagem, fk_produto) VALUES
('Imagem Notebook Dell', 'https://raw.communitydragon.org/pbe/plugins/rcp-be-lol-game-data/global/default/v1/champion-tiles/35/35015.jpg', 1),
('Imagem Smartphone Samsung', 'https://raw.communitydragon.org/pbe/plugins/rcp-be-lol-game-data/global/default/v1/champion-tiles/35/35015.jpg', 2),
('Imagem Teclado mecânico', 'https://raw.communitydragon.org/pbe/plugins/rcp-be-lol-game-data/global/default/v1/champion-tiles/35/35015.jpg', 3),
('Imagem Mouse gamer', 'https://raw.communitydragon.org/pbe/plugins/rcp-be-lol-game-data/global/default/v1/champion-tiles/35/35015.jpg', 4),
('Imagem Monitor LG', 'https://raw.communitydragon.org/pbe/plugins/rcp-be-lol-game-data/global/default/v1/champion-tiles/35/35015.jpg', 5),
('Imagem iPhone 13', 'https://raw.communitydragon.org/pbe/plugins/rcp-be-lol-game-data/global/default/v1/champion-tiles/35/35015.jpg', 6),
('Imagem Headset Bluetooth', 'https://raw.communitydragon.org/pbe/plugins/rcp-be-lol-game-data/global/default/v1/champion-tiles/35/35015.jpg', 7),
('Imagem Tablet Samsung', 'https://raw.communitydragon.org/pbe/plugins/rcp-be-lol-game-data/global/default/v1/champion-tiles/35/35015.jpg', 8),
('Imagem Câmera Canon', 'https://raw.communitydragon.org/pbe/plugins/rcp-be-lol-game-data/global/default/v1/champion-tiles/35/35015.jpg', 9),
('Imagem Notebook HP', 'https://raw.communitydragon.org/pbe/plugins/rcp-be-lol-game-data/global/default/v1/champion-tiles/35/35015.jpg', 10);

-- Inserts para tabela tb_click_produto
INSERT INTO tb_click_produto (data_hora_click, possivel_compra, fk_usuario, fk_produto) VALUES
('2024-04-01 10:00:00', 1, 1, 1),
('2024-04-01 11:00:00', 1, 2, 2),
('2024-04-01 12:00:00', 0, 3, 3),
('2024-04-02 13:00:00', 1, 4, 4),
('2024-04-02 14:00:00', 0, 5, 5),
('2024-04-02 15:00:00', 1, 6, 6),
('2024-04-03 16:00:00', 0, 7, 7),
('2024-04-03 17:00:00', 1, 8, 8),
('2024-04-03 18:00:00', 0, 9, 9),
('2024-04-04 19:00:00', 1, 10, 10),
('2024-04-01 10:00:00', 1, 1, 1),
('2024-04-01 11:00:00', 1, 2, 1),
('2024-04-01 12:00:00', 0, 3, 3),
('2024-04-02 13:00:00', 1, 4, 2),
('2024-04-02 14:00:00', 0, 5, 6),
('2024-04-02 15:00:00', 1, 6, 9),
('2024-04-03 16:00:00', 0, 7, 1),
('2024-04-03 17:00:00', 1, 8, 2),
('2024-04-03 18:00:00', 0, 9, 10),
('2024-04-04 19:00:00', 1, 10, 10);

-- Inserts para tabela tb_tag_produto
INSERT INTO tb_tag_produto (tag) VALUES
('Ofertas'),
('Lançamento'),
('Popular'),
('Promoção'),
('Novidade');

-- Inserts para tabela tb_classificacao_produto
INSERT INTO tb_classificacao_produto (fk_produto, fk_tag_produto) VALUES
(1, 1), -- Notebook Dell é uma oferta
(2, 2), -- Smartphone Samsung é um lançamento
(3, 3), -- Teclado mecânico é popular
(4, 4), -- Mouse gamer é uma promoção
(5, 5), -- Monitor LG é uma novidade
(6, 1), -- iPhone 13 é uma oferta
(7, 2), -- Headset Bluetooth é um lançamento
(8, 3), -- Tablet Samsung é popular
(9, 4), -- Câmera Canon é uma promoção
(10, 5); -- Notebook HP é uma novidade

INSERT INTO tb_favoritos (fk_usuario) VALUES 
(1), 
(3), 
(5), 
(7), 
(9), 
(2), 
(4), 
(6), 
(8), 
(10);

INSERT INTO tb_lista_favoritos (dt_hora_insercao, fk_favoritos, fk_produto) VALUES
('2024-04-12 08:00:00', 1, 2), -- Favorito 1, Produto 2
('2024-04-12 08:10:00', 2, 4), -- Favorito 3, Produto 4
('2024-04-12 08:20:00', 3, 6), -- Favorito 5, Produto 6
('2024-04-12 08:30:00', 4, 8), -- Favorito 7, Produto 8
('2024-04-12 08:40:00', 5, 10), -- Favorito 9, Produto 10
('2024-04-12 08:50:00', 6, 1), -- Favorito 2, Produto 1
('2024-04-12 09:00:00', 7, 3), -- Favorito 4, Produto 3
('2024-04-12 09:10:00', 8, 5), -- Favorito 6, Produto 5
('2024-04-12 09:20:00', 9, 7), -- Favorito 8, Produto 7
('2024-04-12 09:30:00', 10, 9); -- Favorito 10, Produto 9



-- Selects ------------------------------------------------------------
select * from tb_usuario;
select * from tb_login;
select * from tb_produto;
select * from tb_click_produto;
select * from tb_imagem_produto;
select * from tb_tag_produto;
select * from tb_classificacao_produto;
select * from tb_favoritos;
select * from tb_lista_favoritos;


-- Views --------------------------------------------------------------
-- Procedures ---------------------------------------------------------
