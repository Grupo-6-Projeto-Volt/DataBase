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
    on delete cascade
);

-- Login
create table if not exists tb_login
(
	id VARCHAR(36) primary key,
	email varchar(255) unique,
	senha varchar(255) not null unique,
	fk_usuario int,
	foreign key(fk_usuario) references tb_usuario(id)
    on delete cascade
); 

-- Clique produto
create table if not exists tb_click_produto
(
	id int primary key auto_increment,
	data_hora_click datetime,
	possivel_compra tinyint(1),
	fk_usuario int,
	foreign key(fk_usuario) references tb_usuario(id)
	on delete set null,
	fk_produto int,
	foreign key(fk_produto) references tb_produto(id)
    on delete cascade
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
	foreign key(fk_tag_produto) references tb_tag_produto(id)
    on delete set null,
	fk_produto int,
	foreign key(fk_produto) references tb_produto(id)
    on delete cascade
);

create table if not exists tb_favoritos
(
	id int primary key auto_increment,
    dt_hora_insercao datetime,
    fk_usuario int,
    foreign key(fk_usuario) references tb_usuario(id)
    on delete cascade,
	fk_produto int,
    foreign key(fk_produto) references tb_produto(id)
    on delete cascade
);

create table if not exists tb_produto_chamado
(
	id int primary key auto_increment,
    status_chamado tinyint(2) not null,
    data_hora_abertura datetime not null,
    data_hora_fechamento datetime,
	fk_usuario int,
	foreign key(fk_usuario) references tb_usuario(id)
    on delete cascade,
	fk_produto int,
	foreign key(fk_produto) references tb_produto(id)
    on delete cascade
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
(UUID(), 'joao@example.com', '9aG?&Ld3G6!1Qr@JvP#Yw*2Nz$oiXsU%KjTmW?LX!7qpI&G8Q@v8V2bPdW^G9H)DrU1TxJ6X9PlN^7MC?vYzMwzIx1yT)g', 1),
(UUID(), 'maria@example.com', 'K@tT5D#0M3Ozg7JkR@lS!vL6!9W$ip1Xf*N%Iu4Z7bY9GvE2nQhDdA@#y^qHxJpXsT&oC9VlE7R3PfZ&kN5W3U4^e6jR', 2),
(UUID(), 'pedro@example.com', '6S2vE^Qh4T3r@j8LsF&ZnR1$M9oH%iY!u6A*p5N2xP@dG7XcL1y#DkZ8R6gJ?5TmWfUjX3pV7K^oA4qYtW!ePbC2lH7nR', 3),
(UUID(), 'ana@example.com', 'H6yP%4^L9nO?0s&X!gM#7NzA$5KlV3vF9WjG*p@eBcZdR2T1J?tQrD&3kU&YwI5uS2m^A@x6QlE8Cn7XzG4fV^J1oP@6', 4),
(UUID(), 'lucas@example.com', 'L^uV4y#Z1fB$eWpM&2N3T9G0vJb@kR^PcS6DlK5s7Q@xOaH?rY%9wI2nA8dFtX!gU&iE1mJ3qC7^oG6Xz#h^9Q*8^pNt', 5),
(UUID(), 'fernanda@example.com', 'R2YqN8Dl5ZpU@e7!mXc9L^w?IvJjEiK%zHd?Q6rPnB5oGyMf@W^sA3T7V#1S!4O&t0^g^2K6k$uP*1H8Cx3Ql@9@b4^h', 6),
(UUID(), 'gabriel@example.com', 'PnLrS5U4I#q%z2dF1jT&vX3h@*g^WcO9VxJ?lNw^6oKpA8s^Q0e7R6^MmBkE#y1@G9YtD2^f^Zi3b$7#u@H@4^9G8c^a', 7),
(UUID(), 'laura@example.com', '9N!wD4gA%3ZoT&f@j@qY7H#8Kc^sXr1^M*e?V0L?J@I2vEzB5y@tPd^u6Q@G^l$S^pO6x2W8i3bF1r^7n^h#Km6U9C', 8),
(UUID(), 'rafaela@example.com', 'B6A9T3x^4N*oQz#7&f$KlRt1M8WuJpV@Dc^w?I2q@5Xn7e$S6!i^HvGjZr#Ld%yP0^sY^E8g^3mFk@U2#V4^9b1@o^h', 9),
(UUID(), 'marcos@example.com', '8UfT4^N1mDv6gBzJ&Y?E@wX9x0#H5?iR$G^lW2n@qL#rA!PpS7^K*6^yMjO3t%ZcQ&dV^uI7s3#^oC9b@4h2^G8^e@k', 10);

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

-- Inserts para tabela tb_favoritos
INSERT INTO tb_favoritos (dt_hora_insercao, fk_usuario, fk_produto) VALUES
('2024-04-12 08:00:00', 1, 2), -- Usuario 1, Produto 2
('2024-04-12 08:10:00', 2, 4), -- Usuario 3, Produto 4
('2024-04-12 08:20:00', 3, 6), -- Usuario 5, Produto 6
('2024-04-12 08:30:00', 4, 8), -- Usuario 7, Produto 8
('2024-04-12 08:40:00', 5, 10), -- Usuario 9, Produto 10
('2024-04-12 08:50:00', 6, 1), -- Usuario 2, Produto 1
('2024-04-12 09:00:00', 7, 3), -- Usuario 4, Produto 3
('2024-04-12 09:10:00', 8, 5), -- Usuario 6, Produto 5
('2024-04-12 09:20:00', 9, 7), -- Usuario 8, Produto 7
('2024-04-12 09:30:00', 10, 9); -- Usuario 10, Produto 9

-- Inserts para tabela tb_produto_chamado
INSERT INTO tb_produto_chamado (status_chamado, data_hora_abertura, fk_usuario, fk_produto) VALUES
(0, '2024-04-12 10:00:00', 1, 2), -- Chamado aberto pelo usuário 1 para o produto 2
(1, '2024-04-12 10:10:00', 3, 4), -- Chamado aberto pelo usuário 3 para o produto 4
(2, '2024-04-12 10:20:00', 5, 6), -- Chamado aberto pelo usuário 5 para o produto 6
(0, '2024-04-12 10:30:00', 7, 8), -- Chamado aberto pelo usuário 7 para o produto 8
(1, '2024-04-12 10:40:00', 9, 10), -- Chamado aberto pelo usuário 9 para o produto 10
(2, '2024-04-12 10:50:00', 2, 1), -- Chamado aberto pelo usuário 2 para o produto 1
(0, '2024-04-12 11:00:00', 4, 3), -- Chamado aberto pelo usuário 4 para o produto 3
(1, '2024-04-12 11:10:00', 6, 5), -- Chamado aberto pelo usuário 6 para o produto 5
(2, '2024-04-12 11:20:00', 8, 7), -- Chamado aberto pelo usuário 8 para o produto 7
(0, '2024-04-12 11:30:00', 10, 9); -- Chamado aberto pelo usuário 10 para o produto


-- Selects ------------------------------------------------------------
select * from tb_usuario;
select * from tb_login;
select * from tb_produto;
select * from tb_click_produto;
select * from tb_imagem_produto;
select * from tb_tag_produto;
select * from tb_classificacao_produto;
select * from tb_favoritos;


-- Views --------------------------------------------------------------
-- Procedures ---------------------------------------------------------