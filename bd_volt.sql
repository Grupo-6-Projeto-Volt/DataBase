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

-- Categoria
create table if not exists tb_categoria
(
	id int primary key auto_increment,
    nome varchar(30)
);

-- Produto
create table if not exists tb_produto
(
	id int primary key auto_increment,
	nome varchar(120) not null,
	descricao varchar(400) not null,
	fk_categoria int,
    foreign key(fk_categoria) references tb_categoria(id)
    on delete cascade,
	preco decimal(8,2) not null,
	qtd_estoque int,
    estado_geral varchar(45) not null,
    desconto int,
    data_inicio_desconto date,
    data_fim_desconto date
);

-- Cor produto
create table if not exists tb_cor_produto
(
	id int primary key auto_increment,
    nome varchar(40),
    hex_id char(7),
	fk_produto int,
    foreign key(fk_produto) references tb_produto(id)
    on delete cascade
);

-- Imagem produto
create table if not exists tb_imagem_produto
(
	id int primary key auto_increment,
	nome varchar(100),
	codigo_imagem blob,
	indice_vt int,
	fk_produto int,
	foreign key(fk_produto) references tb_produto(id)
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

-- Insert para tabela tb_categoria
INSERT INTO tb_categoria(nome) VALUES
('Computador'),
('Celular'),
('Acessório'),
('Caixa de som');

-- Inserts para tabela tb_produto
INSERT INTO tb_produto (nome, descricao, fk_categoria, preco, qtd_estoque, estado_geral, desconto, data_inicio_desconto, data_fim_desconto) VALUES
('Notebook Dell Inspiron 15', 'Notebook Dell Inspiron 15 com tela de 15,6 polegadas, processador Intel Core i5, 8GB de RAM e 256GB de SSD. Ideal para produtividade e entretenimento, com design elegante e bateria de longa duração.', 1, 2500.00, 10, 'Novo', 15, '2024-09-10', '2024-09-20'),
('Smartphone Samsung Galaxy S21', 'Smartphone Samsung Galaxy S21 com câmera tripla de 64MP, tela de 6,2 polegadas AMOLED, 128GB de armazenamento interno e 8GB de RAM. Ótima performance para jogos e multitarefas.', 2, 1800.00, 15, 'Semi novo', 4, NULL, NULL),
('Teclado Mecânico Gamer Husky Gaming Blizzard', 'Teclado mecânico para jogos com switches Gateron, iluminação RGB personalizável e design ergonômico. Ideal para jogadores que buscam precisão e durabilidade.', 3, 150.00, 20, 'Novo', 0, NULL, NULL),
('Mouse Gamer Logitech G203 LIGHTSYNC RGB', 'Mouse gamer com sensor óptico de alta precisão, 6 botões programáveis e DPI ajustável até 7200. Design confortável para longas sessões de jogo.', 3, 80.00, 30, 'Semi novo', 0, NULL, NULL),
('Monitor PCFort Gamer H238F165 23.8'' Led Full Hd 165hz Freesync Hdmi Display Port VESA', 'Monitor LG UltraWide de 29 polegadas com resolução Full HD, taxa de atualização de 75Hz e tecnologia AMD FreeSync. Perfeito para produtividade e jogos imersivos.', 3, 600.00, 5, 'Novo', 10, '2024-09-08', '2024-09-18'),
('Apple iPhone 13 (128 GB)', 'Smartphone Apple iPhone 13 com câmera dupla de 12MP, gravação em 4K, 128GB de armazenamento e processador A15 Bionic. Excelente para fotos, vídeos e desempenho multitarefa.', 2, 2000.00, 12, 'Novo', 7, '2024-09-15', '2024-09-25'),
('QCY H2 PRO Fone de Ouvido Bluetooth', 'Headset Bluetooth JBL com som estéreo de alta qualidade, até 20 horas de duração de bateria e microfone integrado para chamadas nítidas.', 3, 120.00, 25, 'Semi novo', 10, NULL, NULL),
('JBL Partybox 110', 'Caixa de som JBL Partybox Encore Essential com 100W de potência, luzes LED integradas e bateria recarregável com até 6 horas de autonomia. Ideal para festas e eventos.', 4, 1500.00, 11, 'Semi novo', 0, NULL, NULL),
('Câmera digital Canon EOS Rebel T7', 'Câmera digital Canon EOS Rebel T7 com sensor CMOS de 24.1MP, gravação de vídeos em Full HD, e conectividade Wi-Fi para compartilhamento rápido de fotos e vídeos.', 3, 700.00, 8, 'Novo', 12, NULL, NULL),
('Notebook HP Pavilion 14', 'Notebook HP Pavilion 14 com processador Intel Core i7, 16GB de RAM e 512GB de SSD. Equipado com tela Full HD e ótimo desempenho para tarefas profissionais e de entretenimento.', 1, 1800.00, 10, 'Semi novo', 5, NULL, NULL);

-- Inserts para tabela tb_cor_produto
INSERT INTO tb_cor_produto (nome, hex_id, fk_produto) VALUES
('Preto', '#000000', 1),     -- Produto 1 com cor preta
('Branco', '#FFFFFF', 1),    -- Produto 1 com cor branca
('Vermelho', '#FF0000', 2),  -- Produto 2 com cor vermelha
('Preto', '#000000', 2),     -- Produto 2 com cor preta
('Verde', '#00FF00', 3),     -- Produto 3 com cor verde
('Azul', '#0000FF', 4),      -- Produto 4 com cor azul
('Amarelo', '#FFFF00', 4),   -- Produto 4 com cor amarela
('Magenta', '#FF00FF', 5),   -- Produto 5 com cor magenta
('Ciano', '#00FFFF', 6),     -- Produto 6 com cor ciano
('Cinza', '#808080', 7),     -- Produto 7 com cor cinza
('Prata', '#C0C0C0', 8),     -- Produto 8 com cor prata
('Laranja', '#FFA500', 9),   -- Produto 9 com cor laranja
('Roxo', '#800080', 10),     -- Produto 10 com cor roxa
('Marrom', '#8B4513', 10),   -- Produto 10 com cor marrom
('Azul Aço', '#4682B4', 9),  -- Produto 9 com cor azul aço
('Dourado', '#FFD700', 8),   -- Produto 8 com cor dourada
('Azul Marinho', '#000080', 7); -- Produto 7 com cor azul marinho


-- Inserts para tabela tb_imagem_produto
INSERT INTO tb_imagem_produto (nome, codigo_imagem, indice_vt, fk_produto) VALUES
('Imagem Notebook Dell frente', 'https://imgs.casasbahia.com.br/55065342/1g.jpg', 0, 1),
('Imagem Notebook Dell lado', 'https://imgs.casasbahia.com.br/55065342/7g.jpg', 1, 1),
('Imagem Notebook Dell atras', 'https://imgs.casasbahia.com.br/55065342/6g.jpg', 2, 1),
('Imagem Smartphone Samsung frente', 'https://imgs.casasbahia.com.br/55065328/1g.jpg', 0, 2),
('Imagem Smartphone Samsung lado', 'https://imgs.casasbahia.com.br/55065328/2g.jpg', 1, 2),
('Imagem Teclado mecânico frente', 'https://images.kabum.com.br/produtos/fotos/163971/teclado-mecanico-gamer-husky-gaming-blizzard-rgb-switch-gateron-blue-abnt2-branco-hgmo022_1635794160_gg.jpg', 0, 3),
('Imagem Teclado mecânico atras', 'https://resetai.com.br/wp-content/uploads/2022/09/Teclado-Mecanico-Motospeed-CK62-1024x511.png', 1, 3),
('Imagem Mouse gamer frente', 'https://images.kabum.com.br/produtos/fotos/112948/mouse-gamer-logitech-g203-rgb-lightsync-6-botoes-8000-dpi-preto-910-005793_1612880275_g.jpg', 0, 4),
('Imagem Monitor PCFort frente', 'https://images.tcdn.com.br/img/img_prod/740836/monitor_gamer_pcfort_t2701_165_27_led_full_hd_165hz_display_port_hdmi_dvi_vesa_13891_1_41f110c369e18c77abe42f0bfbe24480.jpg', 0, 5),
('Imagem Monitor PCFort lado', 'https://images.tcdn.com.br/img/img_prod/740836/monitor_gamer_pcfort_t2701_165_27_led_full_hd_165hz_display_port_hdmi_dvi_vesa_13891_3_883a52e740b1f8d2f5cd7c7cb7d3b383.jpg', 1, 5),
('Imagem Monitor PCFort detalhe', 'https://images.tcdn.com.br/img/img_prod/740836/90_monitor_gamer_pcfort_t2701_165_27_led_full_hd_165hz_display_port_hdmi_dvi_vesa_13891_4_1f6b1005568d2b5888a9ba6e8920b578.jpg', 2, 5),
('Imagem Monitor PCFort atras', 'https://images.tcdn.com.br/img/img_prod/740836/monitor_gamer_pcfort_t2701_165_27_led_full_hd_165hz_display_port_hdmi_dvi_vesa_13891_2_d5701fd63c3e1c7bc2fc2c9746d68233.jpg', 3, 5),
('Imagem iPhone 13 frente', 'https://imgs.casasbahia.com.br/55048759/1g.jpg', 0, 6),
('Imagem iPhone 13 detalhe', 'https://imgs.casasbahia.com.br/55048759/5g.jpg', 1, 6),
('Imagem Headset Bluetooth frente', 'https://m.media-amazon.com/images/I/61dczD-S7iL._AC_UF1000,1000_QL80_.jpg', 0, 7),
('Imagem JBL Partybox frente', 'https://m.media-amazon.com/images/I/51DIiBDMu0L._AC_SL1000_.jpg', 0, 8),
('Imagem Câmera Canon frente', 'https://m.media-amazon.com/images/I/71Is-Zv6A0L._AC_SY450_.jpg', 0, 9),
('Imagem Câmera Canon detalhe', 'https://m.media-amazon.com/images/I/71IepL5sXRL._AC_SY450_.jpg', 1, 9),
('Imagem Câmera Canon lado', 'https://m.media-amazon.com/images/I/61BjZcbeZJL._AC_SY450_.jpg', 2, 9),
('Imagem Notebook HP frente', 'https://i.zst.com.br/thumbs/12/5/16/-535963089.jpg', 0, 10);

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
('2024-04-12 09:20:00', 9, 7); -- Usuario 8, Produto 7

INSERT INTO tb_favoritos (dt_hora_insercao, fk_usuario, fk_produto) VALUES
('2024-04-12 09:30:00', 11, 2), -- Usuario 10, Produto 9
('2024-04-12 09:30:00', 11, 4), -- Usuario 10, Produto 9
('2024-04-12 09:30:00', 11, 5), -- Usuario 10, Produto 9
('2024-04-12 09:30:00', 11, 9); -- Usuario 10, Produto 9

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
-- view corrigida
create view `vwchamadosgrafico` as 
select qtd, dia, mes, id,status_chamado as status from (
select 
id,
status_chamado,
count(status_chamado) as qtd, 
DATE_FORMAT(data_hora_abertura, '%d') as dia,
DATE_FORMAT(data_hora_abertura, '%m') as mes
from tb_produto_chamado where status_chamado >= 1
and data_hora_abertura >= date_sub(now(), interval 6 month)
group by dia, mes, status_chamado,id
) as viz order by status_chamado;
--
select * from vwchamadosgrafico;

-- view corrigida
create view `vwcategoriasacessos` as 
select dense_rank() over (order by tb_categoria.id) as id, count(data_hora_click) as acessos, tb_categoria.nome as categoria
from tb_click_produto join tb_produto on fk_produto = tb_produto.id join tb_categoria on fk_categoria = tb_categoria.id group by
categoria,tb_categoria.id;
--
select * from vwcategoriasacessos;

-- view corrigida
create view  `vwprodutosmaisacessados` as
select tb_produto.id as id, tb_produto.qtd_estoque as qtd,tb_produto.nome,count(data_hora_click) as acessos,
tb_imagem_produto.codigo_imagem as url from tb_produto join tb_click_produto on tb_produto.id = fk_produto 
join tb_imagem_produto on tb_imagem_produto.fk_produto = tb_produto.id group by nome,qtd,id,url limit 6; 
select * from vwprodutosmaisacessados;

-- kpis
-- view corrigida
create view `vwfaturamento` as
select sum(tb_produto.preco) from tb_produto_chamado join tb_produto on fk_produto = tb_produto.id where status_chamado = 2;
select * from vwfaturamento;

-- view corrigida
create view `vwacessossetedias` as
select qtd,id from (
select 
status_chamado,
id,
count(status_chamado) as qtd
from tb_produto_chamado where status_chamado = 2
and data_hora_fechamento < date_sub(now(), interval 7 day)
group by status_chamado,id
) as viz order by status_chamado;
select * from vwacessossetedias;

-- view corrigida
create view `vwtaxaretorno` as
select tb_usuario.id as id,tb_usuario.nome as usuario,count(tb_click_produto.data_hora_click) as cliques from tb_click_produto
join tb_usuario on fk_usuario = tb_usuario.id group by tb_usuario.id having cliques > 1 order by cliques desc;

select * from vwtaxaretorno;
-- Procedures ---------------------------------------------------------
DELIMITER //
CREATE function `fnRemoveAccents`(`str` TEXT)
	RETURNS text
    LANGUAGE SQL
    DETERMINISTIC
    NO SQL
    SQL SECURITY INVOKER
    COMMENT ''

BEGIN
    SET str = REPLACE(str,'Š','S');
    SET str = REPLACE(str,'š','s');
    SET str = REPLACE(str,'Ð','Dj');
    SET str = REPLACE(str,'Ž','Z');
    SET str = REPLACE(str,'ž','z');
    SET str = REPLACE(str,'À','A');
    SET str = REPLACE(str,'Á','A');
    SET str = REPLACE(str,'Â','A');
    SET str = REPLACE(str,'Ã','A');
    SET str = REPLACE(str,'Ä','A');
    SET str = REPLACE(str,'Å','A');
    SET str = REPLACE(str,'Æ','A');
    SET str = REPLACE(str,'Ç','C');
    SET str = REPLACE(str,'È','E');
    SET str = REPLACE(str,'É','E');
    SET str = REPLACE(str,'Ê','E');
    SET str = REPLACE(str,'Ë','E');
    SET str = REPLACE(str,'Ì','I');
    SET str = REPLACE(str,'Í','I');
    SET str = REPLACE(str,'Î','I');
    SET str = REPLACE(str,'Ï','I');
    SET str = REPLACE(str,'Ñ','N');
    SET str = REPLACE(str,'Ò','O');
    SET str = REPLACE(str,'Ó','O');
    SET str = REPLACE(str,'Ô','O');
    SET str = REPLACE(str,'Õ','O');
    SET str = REPLACE(str,'Ö','O');
    SET str = REPLACE(str,'Ø','O');
    SET str = REPLACE(str,'Ù','U');
    SET str = REPLACE(str,'Ú','U');
    SET str = REPLACE(str,'Û','U');
    SET str = REPLACE(str,'Ü','U');
    SET str = REPLACE(str,'Ý','Y');
    SET str = REPLACE(str,'Þ','B');
    SET str = REPLACE(str,'ß','Ss');
    SET str = REPLACE(str,'à','a');
    SET str = REPLACE(str,'á','a');
    SET str = REPLACE(str,'â','a');
    SET str = REPLACE(str,'ã','a');
    SET str = REPLACE(str,'ä','a');
    SET str = REPLACE(str,'å','a');
    SET str = REPLACE(str,'æ','a');
    SET str = REPLACE(str,'ç','c');
    SET str = REPLACE(str,'è','e');
    SET str = REPLACE(str,'é','e');
    SET str = REPLACE(str,'ê','e');
    SET str = REPLACE(str,'ë','e');
    SET str = REPLACE(str,'ì','i');
    SET str = REPLACE(str,'í','i');
    SET str = REPLACE(str,'î','i');
    SET str = REPLACE(str,'ï','i');
    SET str = REPLACE(str,'ð','o');
    SET str = REPLACE(str,'ñ','n');
    SET str = REPLACE(str,'ò','o');
    SET str = REPLACE(str,'ó','o');
    SET str = REPLACE(str,'ô','o');
    SET str = REPLACE(str,'õ','o');
    SET str = REPLACE(str,'ö','o');
    SET str = REPLACE(str,'ø','o');
    SET str = REPLACE(str,'ù','u');
    SET str = REPLACE(str,'ú','u');
    SET str = REPLACE(str,'û','u');
    SET str = REPLACE(str,'ý','y');
    SET str = REPLACE(str,'ý','y');
    SET str = REPLACE(str,'þ','b');
    SET str = REPLACE(str,'ÿ','y');
    SET str = REPLACE(str,'ƒ','f');

    RETURN str;
END
// DELIMITER ;
