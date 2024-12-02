-- Criação do Banco --------------------------------------------------
DROP DATABASE IF EXISTS bd_volt;

CREATE DATABASE IF NOT EXISTS bd_volt
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE bd_volt;

-- Tabelas --------------------------------------------------
-- Tabela Usuario
CREATE TABLE IF NOT EXISTS tb_usuario 
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL UNIQUE,
	telefone VARCHAR(14) NOT NULL UNIQUE,
	categoria TINYINT(1)
);

-- Tabela Login
CREATE TABLE IF NOT EXISTS tb_login
(
	id VARCHAR(36) PRIMARY KEY,
	email VARCHAR(255) UNIQUE,
	senha VARCHAR(255) NOT NULL UNIQUE,
	fk_usuario INT,
	FOREIGN KEY(fk_usuario) REFERENCES tb_usuario(id)
    ON DELETE CASCADE
); 

-- Tabela Categoria
CREATE TABLE IF NOT EXISTS tb_categoria
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30)
);

-- Tabela Produto
CREATE TABLE IF NOT EXISTS tb_produto
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(120) NOT NULL,
	descricao VARCHAR(400) NOT NULL,
	fk_categoria INT,
    FOREIGN KEY(fk_categoria) REFERENCES tb_categoria(id)
    ON DELETE CASCADE,
	preco DECIMAL(8,2) NOT NULL,
	qtd_estoque INT,
    estado_geral VARCHAR(45) NOT NULL,
    desconto INT,
    data_inicio_desconto DATE,
    data_fim_desconto DATE
)CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Tabela Cor produto
CREATE TABLE IF NOT EXISTS tb_cor_produto
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    hex_id CHAR(7),
	fk_produto INT,
    FOREIGN KEY(fk_produto) REFERENCES tb_produto(id)
    ON DELETE CASCADE
);

-- Tabela Imagem Produto
CREATE TABLE IF NOT EXISTS tb_imagem_produto
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(100),
	codigo_imagem BLOB,
	indice_vt INT,
	fk_produto INT,
	FOREIGN KEY(fk_produto) REFERENCES tb_produto(id)
    ON DELETE CASCADE
);

-- Tabela Clique Produto
CREATE TABLE IF NOT EXISTS tb_click_produto
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	data_hora_click DATETIME,
	possivel_compra TINYINT(1),
	fk_usuario INT,
	FOREIGN KEY(fk_usuario) REFERENCES tb_usuario(id)
	ON DELETE SET NULL,
	fk_produto INT,
	FOREIGN KEY(fk_produto) REFERENCES tb_produto(id)
    ON DELETE CASCADE
);

-- Tabela Tag Produto
CREATE TABLE IF NOT EXISTS tb_tag_produto
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	tag VARCHAR(50)
);

-- Tabela Classificação Produto
CREATE TABLE IF NOT EXISTS tb_classificacao_produto
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	fk_tag_produto INT,
	FOREIGN KEY(fk_tag_produto) REFERENCES tb_tag_produto(id)
    ON DELETE SET NULL,
	fk_produto INT,
	FOREIGN KEY(fk_produto) REFERENCES tb_produto(id)
    ON DELETE CASCADE
);

-- Tabela Favoritos
CREATE TABLE IF NOT EXISTS tb_favoritos
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    dt_hora_insercao DATETIME,
    fk_usuario INT,
    FOREIGN KEY(fk_usuario) REFERENCES tb_usuario(id)
    ON DELETE CASCADE,
	fk_produto INT,
    FOREIGN KEY(fk_produto) REFERENCES tb_produto(id)
    ON DELETE CASCADE
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
('Marcos Almeida', 'marcos@example.com', '888888888', 0),
('Henrique Akira', 'admin@gmail.com', '(11)91141-0481', 1);

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
(UUID(), 'marcos@example.com', '8UfT4^N1mDv6gBzJ&Y?E@wX9x0#H5?iR$G^lW2n@qL#rA!PpS7^K*6^yMjO3t%ZcQ&dV^uI7s3#^oC9b@4h2^G8^e@k', 10),
(UUID(), 'admin@gmail.com', '$2a$10$lF/NWmArt98gcVjt1BHzTOhb8zN1MQZ626aSJwIRZcGo2SEWOrT9i', 11);

-- Insert para tabela tb_categoria
INSERT INTO tb_categoria (nome) VALUES
('Computador'),
('Celular'),
('Acessório'),
('Caixa de som');

-- Inserts para tabela tb_produto
INSERT INTO tb_produto (nome, descricao, fk_categoria, preco, qtd_estoque, estado_geral, desconto, data_inicio_desconto, data_fim_desconto) VALUES
("iPhone 15 Pro", "O iPhone 15 Pro é o primeiro iPhone a apresentar um design de titânio de grau aeroespacial, usando a mesma ligação que as naves espaciais que usam para missões à Marte", 2, 7699.00, 10, "Novo", 0, NULL, NULL),
("iPhone 14 Pro Max", "O iPhone 14 tem o sistema de câmera dupla mais impressionante em um iPhone, para fazer fotos espetaculares em pouca e muita luz.", 2, 4799.00, 10, "Novo", 0, NULL, NULL),
("iPhone 13 Pro", "Aparelho De Vitrine - Sem Uso! Desbloqueado, Sem Detalhes Ou Marcas, Com Saúde Da Bateria Superior A 85%. 3 meses de garantia.", 2, 4599.00, 10, "Seminovo", 0, NULL, NULL),
("iPhone 13 Pro Max", "Produto 100% Original. Aparência Impecável. Bateria 85%- 100%. 3 meses de garantia.", 2, 5599.99, 10, "Seminovo", 0, NULL, NULL),
("iPhone 12 Pro", "iPhone 12 Pro. 5G para baixar arquivos enormes em qualquer lugar e fazer streaming de vídeos HDR. 3 meses de garantia.", 2, 3799.99, 10, "Seminovo", 0, NULL, NULL),
("AirPods 2", "AirPods 2 com cancelamento de ruído. Possibilidade de recarregar o estojo com um conector lightning. Até 5 horas de áudio com apenas uma recarga.", 3, 1787.56, 10, "Novo", 0, NULL, NULL),
("AirTag", "AirTag compatível com iPhone e iPad iOS 14.5 ou superior. Resistente à água, respingos e poeira. Bateria substituível e dura mais de um ano.", 3, 348.00, 10, "Novo", 0, NULL, NULL),
("Apple Watch Series 9", "Nosso chip mais poderoso do Apple Watch de todos os tempos. Uma tela que é duas vezes mais brilhante.", 3, 3749.00, 10, "Novo", 0, NULL, NULL),
("Smartphone Realme C61", "Apresentamos o Smartphone Realme C61, um dispositivo que combina desempenho robusto e estilo sofisticado. Tela Ips Lcd de 6.74 polegadas. Taxa de atualização de 90hz.", 2, 1165.00, 10, "Seminovo", 0, NULL, NULL);
-- Inserts para tabela tb_cor_produto
-- INSERT INTO tb_cor_produto (nome, hex_id, fk_produto) VALUES
-- ();

-- Inserts para tabela tb_imagem_produto
-- INSERT INTO tb_imagem_produto (nome, codigo_imagem, indice_vt, fk_produto) VALUES
-- ();

-- Inserts para tabela tb_click_produto
-- INSERT INTO tb_click_produto (data_hora_click, possivel_compra, fk_usuario, fk_produto) VALUES
-- ();

-- Inserts para tabela tb_tag_produto
INSERT INTO tb_tag_produto (tag) VALUES
('Ofertas'),
('Lançamento'),
('Popular'),
('Promoção'),
('Novidade');

-- Inserts para tabela tb_classificacao_produto
-- INSERT INTO tb_classificacao_produto (fk_produto, fk_tag_produto) VALUES
-- ();

-- Inserts para tabela tb_favoritos
-- INSERT INTO tb_favoritos (dt_hora_insercao, fk_usuario, fk_produto) VALUES
-- ();

-- Views --------------------------------------------------------------
-- View Acessos Categorias
CREATE VIEW `vwcategoriasacessos` AS
SELECT 
	DENSE_RANK() OVER (ORDER BY tb_categoria.id) AS id, 
	DATE(data_hora_click) AS dataClick, 
    tb_categoria.nome AS categoria
FROM tb_click_produto 
	JOIN tb_produto ON fk_produto = tb_produto.id 
	JOIN tb_categoria ON fk_categoria = tb_categoria.id;

-- View Produtos mais Acessados
CREATE VIEW  `vwprodutosmaisacessados` AS
SELECT 
    p.id AS id,
    p.qtd_estoque AS qtd,
    p.nome,
    DATE(cp.data_hora_click) AS dataClick,
    (SELECT tb_imagem_produto.codigo_imagem
     FROM tb_imagem_produto
     WHERE tb_imagem_produto.fk_produto = p.id
     LIMIT 1) AS url
FROM tb_produto p
JOIN tb_click_produto AS cp ON p.id = cp.fk_produto;

-- View Faturamento
CREATE VIEW `vwfaturamento` AS
SELECT 
	tb_produto.preco AS preco,
    DATE(data_hora_click) AS dataClick
FROM tb_click_produto 
JOIN tb_produto ON fk_produto = tb_produto.id
WHERE possivel_compra = 0;

-- View Últimos Acessos
CREATE VIEW `vwacessossetedias` AS
SELECT dataClick, id FROM (
	SELECT
		possivel_compra,
		id,
        DATE(data_hora_click) AS dataClick
	FROM tb_click_produto WHERE possivel_compra = 0
	GROUP BY possivel_compra, id
) AS viz;

-- View Taxa de Retorno
CREATE VIEW `vwtaxaretorno` AS
SELECT 
	tb_usuario.id AS id,
    tb_usuario.nome AS usuario,
    DATE(tb_click_produto.data_hora_click) AS dataClick
FROM tb_click_produto
	JOIN tb_usuario ON fk_usuario = tb_usuario.id;

-- Selects ------------------------------------------------------------
SELECT * FROM tb_usuario;
SELECT * FROM tb_login;
SELECT * FROM tb_produto;
SELECT * FROM tb_click_produto;
SELECT * FROM tb_imagem_produto;
SELECT * FROM tb_tag_produto;
SELECT * FROM tb_classificacao_produto;
SELECT * FROM tb_favoritos;
SELECT * FROM tb_imagem_produto;
SELECT * FROM vwcategoriasacessos;
SELECT * FROM vwprodutosmaisacessados;
SELECT * FROM vwfaturamento;
SELECT * FROM vwacessossetedias;
SELECT * FROM vwtaxaretorno;

-- Procedures ---------------------------------------------------------
-- Procedure Remover Acentos
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
