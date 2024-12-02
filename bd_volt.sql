drop database if exists bd_volt;
CREATE DATABASE IF NOT EXISTS bd_volt
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

-- ALTER DATABASE bd_volt 
-- CHARACTER SET = utf8mb4 
-- COLLATE = utf8mb4_unicode_ci;    

USE bd_volt;

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
)CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

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
INSERT INTO tb_categoria(nome) VALUES
('Computador'),
('Celular'),
('Acessório'),
('Caixa de som');

-- Inserts para tabela tb_produto
INSERT INTO tb_produto (nome, descricao, fk_categoria, preco, qtd_estoque, estado_geral, desconto, data_inicio_desconto, data_fim_desconto) VALUES
('IPhone 11 128GB', 'IPhone 11. Novo Controle da Câmera, câmera Fusion de 48 MP, cinco cores lindas e o chip A18. A duração da bateria varia de acordo com o uso e a configuração.', 2, 2183.00, 10, 'Semi novo', 5, NULL, NULL),
('Iphone 16 128GB', 'IPhone 16. Novo Controle da Câmera, câmera Fusion de 48 MP, cinco cores lindas e o chip A18. A duração da bateria varia de acordo com o uso e a configuração.', 2, 5800.00, 10, 'Novo', 5, NULL, NULL),
('Air pods', 'Apple AirPods Pro 2a Geração H2. Imersão no máximo: O chip H2 da Apple é a potência por trás do desempenho de áudio imponente dos AirPods Pro. Um amplificador e um driver exclusivo trabalham em sintonia para oferecer graves potentes e agudos intensos em excelente definição, deixando os sons mais impressionantes do que nunca. ', 3, 2200.00, 20, 'Novo', 5, NULL, NULL),
('Smartband Samsung Galaxy Fit3 Prata', 'A Smartband Galaxy Fit3 prata da Samsung chega para democratizar a tecnologia avançada de monitoramento das práticas esportivas e de bem-estar, inspirando todos a se sentirem melhor e a adotarem um estilo de vida mais saudável. Conta com Monitoramento de mais de 100 exercicios, sendo 6 detectados automaticamente.', 3, 341.00, 30, 'Novo', 5, NULL, NULL),
('Carregador Apple USB-C de 20W Original', 'O carregador USB-C de 20W Apple é rápido e eficiente, ideal para usar em casa, no trabalho ou onde você estiver. Ele é compatível com qualquer aparelho com porta USB-C, mas recomendamos o uso com o iPad Pro de 11 polegadas ou iPad Pro de 12,9 polegadas (3a geração) para ter o melhor rendimento.', 3, 152.00, 40, 'Novo', 5, NULL, NULL),
('IPhone 16 Pro 256GB', 'IPhone 16 Pro. Com estrutura em titânio, Controle da Câmera, 4K Dolby Vision a 120 qps e o chip A18 Pro. Avisos legais As telas têm bordas arredondadas. Quando medida como um retângulo, a tela tem 6,12 polegadas (iPhone 16), 6,69 polegadas (iPhone 16 Plus), 6,27 polegadas (iPhone 16 Pro) ou 6,86 polegadas (iPhone 16 Pro Max) na diagonal', 2, 8752.00, 20, 'Novo', 5, NULL, NULL),
('Samsung Galaxy S23 ', 'O Galaxy S23 FE na cor verde é um dos smartphones mais recentes da Samsung. Com design elegante e moderno, uma tela grande e vibrante e um poderoso conjunto de câmeras. Ele é equipado com o processador Octa-Core Exynos 2200, para navegar na web, assistir vídeos, jogar jogos e muito mais sem problemas, 8GB de memória RAM e 128GB de armazenamento interno.', 2, 8752.00, 15, 'Novo', 5, NULL, NULL),
('Apple Watch Series 9 GPS', 'Brilha mais em tudo. O Apple Watch Series 9 conecta você a tudo, ajuda a levar uma vida ativa e cuida da sua saúde e segurança. Ele traz uma maneira mágica de usar o Apple Watch com apenas dois toques, uma tela ainda mais brilhante, Siri e Busca Precisa para iPhone.', 3, 3599.00, 40, 'Novo', 5, NULL, NULL),
('Notebook Apple Macbook Air 13,6', 'Com a potência do chip M2 de última geração, o novo MacBook Air combina desempenho espetacular e até 18 horas de bateria em uma estrutura de alumínio muito fina*. Avisos legais Nem todas as configurações estão disponíveis em todos os países. Os dados de desempenho variam de acordo com o modelo e a configuração.', 1, 7559.00, 35, 'Novo', 5, NULL, NULL),
('IPhone 16 Plus Apple 128GB', 'IPhone 16 Plus O Controle Da Câmera É Seu Agora, suas fotos e vídeos vão arrasar também no quesito agilidade. Com o Controle da Câmera, você tem acesso mais fácil e rápido às ferramentas e recursos. ', 2, 8968.00, 10, 'Novo', 5, NULL, NULL),
('Cabo Tipo C P/ Tipo C Original', 'De alta tecnologia, esse cabo carregador foi projetado para garantir uma maior rapidez na passagem de energia por seus fios, contribuindo com uma recarga ágil e rápida.É um excelente cabo, com carga rápida e seguro pro seu aparelho, contribuindo com a agilidade da vida moderna.', 3, 8968.00, 15, 'Novo', 5, NULL, NULL),
('Smartphone Samsung Galaxy S23 256GB', 'Para você que está a procura de um smartphone e dar aquele upgrade no seu dia a dia no trabalho ou para navegar nas redes sociais, precisa conhecer o Samsung Galaxy S23 na cor preta. É o smartphone top de linha pra quem quer um aparelho completo pra jogos, estudos e trabalho.', 2, 8968.00, 20, 'Novo', 5, NULL, NULL),
('Notebook Apple Macbook Air 13,6', 'Com a potência do chip M2 de última geração, o novo MacBook Air combina desempenho espetacular e até 18 horas de bateria em uma estrutura de alumínio muito fina*. Avisos legais Nem todas as configurações estão disponíveis em todos os países', 1, 8968.00, 10, 'Novo', 5, NULL, NULL),
('IPhone 12 64GB Vermelho', 'A TELA pode conter pequenas marcas de usos e riscos quase imperceptíveis.. Por serem USADOS, os aparelhos não são resistentes a água (IP68). Bateria em boas condições, garantimos no mínimo 80% de capacidade. Possui peças 100% originais. Nunca utilizamos peças alternativas ou paralelas', 2, 8968.00, 50, 'Usado', 5, NULL, NULL),
('Notebook Acer Aspire 5 Intel Core i5', ' A tela dele é em LED com tecnologia Anti reflexo Acer ComfyView de 15,6" com resolução Full HD e conta com sistema operacional Windows 11 Home de 64-bits, que proporciona um visual mais moderno, intuitivo e de fácil navegação.', 1, 2668.00, 50, 'Novo', 5, NULL, NULL),
('Capinha + Película 3D + Película de Câmera iPhone 13 6.1', 'Capinha Anti Shock Transparente com Bordas Reforçadas com todos os furos e medidas para o encaixe perfeito do celular.Envio Imeditato - Pronta Entrega. Muito mais qualidade para você não amarela e protege muito mais o celular', 3, 2668.00, 50, 'Novo', 5, NULL, NULL),
('Carregador Portátil Power Bank', 'Introduzido no mercado com a intenção de renovar o setor de carregadores. O LUCK AMAZONIA LU-538 possui 2 cabos contando com 3 modelos de carregadores, Android micro USB e tipo C', 3,73.99, 50, 'Novo', 5, NULL, NULL),
('Carregador Portátil/Power Bank Geonav 14000mAh', 'Com o carregador universal Portátil/Power Bank Geonav PB14KAL você estará pronto para qualquer desafio e poderá utilizar seus dispositivos móveis sempre com a carga máxima de energia. Produzido com bateria de polímero de lítio, ele possui capacidade de 14000mAh e conexões de diferentes tipos, USB padrão, USB tipo C e micro USB.', 3,73.99, 50, 'Novo', 5, NULL, NULL),
('Smartphone Motorola Edge 50 Fusion', 'Apresentando o poderoso Motorola Edge 50 Fusion Blue Teal! Com Android 14 e Snapdragon 6 Gen 1, seu desempenho é imbatível. Desfrute de uma experiência visual incrível em sua tela pOLED de 6.7 Full HD com 120Hz de atualização.', 2,2999.99, 50, 'Novo', 5, NULL, NULL),
('Cabo Carregador Turbo Micro-USB', 'De alta tecnologia, nosso cabo carregador foi projetado para garantir uma maior rapidez na passagem de energia por seus fios, contribuindo com uma recarga ágil e rápida.Seu revestimento com fios de nylon aumenta sua vida útil, protegendo-o contra as dobras, quebras e tornando-o mais maleável.', 3,39.99, 50, 'Novo', 5, NULL, NULL),
('Notebook Lenovo IdeaPad 1i Intel Core i5-1235U ', 'O IdeaPad 1i eleva sua categoria de notebooks com um processador Intel super eficiente de 12 geração em um chassi fino e compacto de 17,9 mm que facilita a multitarefa enquanto aumenta a eficiência energética com até 11 horas de duração da bateria e carga rápida', 1,2480.00, 50, 'Novo', 5, NULL, NULL),
('Notebook Acer Aspire 3 Intel Core i3 8GB 256GB SSD', 'Nos dias de hoje, com o avanço constante da tecnologia, tudo o que for digital, nem sempre é resolvido somente com um smartphone e é necessário o uso de computadores ou notebooks. Muitos optam pelo notebook pela praticidade de poder trabalhar, navegar pela internet e estudar em qualquer lugar que estiver.', 1,2283.00, 50, 'Novo', 5, NULL, NULL),
('IPhone 16 Pro Max Apple 512GB', 'iPhone 16 Pro Max Resistência. Beleza. Titânio A estrutura do iPhone 16 Pro Max é em titânio Grau 5 com um novo acabamento por microjateamento. Como o titânio tem uma das melhores relações resistência-peso entre os metais, os modelos são superleves e incrivelmente resistentes. ', 2,1283.00, 50, 'Novo', 5, NULL, NULL),
('iPhone 13 Apple (128GB) Meia-noite, Tela de 6,1', 'iPhone 13. O sistema de câmera dupla mais avançado em um iPhone. Chip A15 Bionic com velocidade impressionante. Um grande salto em bateria. Design resistente. 5G ultrarrápido* . E tela Super Retina XDR mais brilhante.', 2,3083.00, 50, 'Semi-novo', 5, NULL, NULL),
('iNotebook Lenovo IdeaPad 1i Intel Core i7', 'O notebook Lenovo IdeaPad 1i 15IAU7 eleva a categoria de notebooks com processador Intel Core i7 1255U de 12ª geração em um chassi fino e compacto que facilita a multitarefa enquanto aumenta a eficiência energética com a bateria de longa duração e carga rápida. ', 1,3583.00, 50, 'Semi-novo', 5, NULL, NULL);

-- Inserts para tabela tb_cor_produto
INSERT INTO tb_cor_produto (nome, hex_id, fk_produto) VALUES
('Cinza', '#999999', 1),
('Rosa', '#FF99FF', 1),
('Rosa', '#FF99FF', 2),
('Azul', '#33CCFF', 2),
('Preto', '#000000', 2),
('Branco', '#f5f5f5', 3),
('Branco', '#f5f5f5', 4),
('Preto', '#000000', 4),
('Cinza', '#999999', 4),
('Branco', '#f5f5f5', 5),
('Dourado', '#999900', 6),
('Verde', '#99FF99', 7),
('Branco', '#f5f5f5', 7),
('Preto', '#000000', 7),
('Preto', '#000000', 8),
('Preto', '#000000', 9),
('Dourado', '#999900', 9),
('Branco', '#f5f5f5', 9),
('Rosa', '#FF99FF', 10),
('Branco', '#f5f5f5', 11),
('Preto', '#000000', 12),
('Preto', '#000000', 13),
('Vermelho', '#FF0000', 14),
('Cinza', '#999999', 15),
('Branco', '#f5f5f5', 16),
('Vermelho', '#FF0000', 17),
('Branco', '#f5f5f5', 17),
('Preto', '#000000', 18),
('Preto', '#000000', 19),
('Vermelho', '#FF0000', 20),
('Azul', '#00009C', 20),
('Preto', '#000000', 21),
('Preto', '#000000', 22),
('Branco', '#f5f5f5', 17),
('Preto', '#000000', 22),
('Prata', '#C0C0C0', 23);

-- Inserts para tabela tb_imagem_produto
INSERT INTO tb_imagem_produto (nome, codigo_imagem, indice_vt, fk_produto) VALUES
('Air pods', 'https://a-static.mlcdn.com.br/800x560/airpods-pro-apple-com-estojo-de-recarga-magsafe-usb-c-branco/kabum/495557/4dddd6cd93ac3708e4fdce5cb9ad199f.jpeg', 0, 3),
('Air pods', 'https://a-static.mlcdn.com.br/800x560/airpods-pro-apple-com-estojo-de-recarga-magsafe-usb-c-branco/kabum/495557/cbdbf9e1d6df208c547ff0cabf7c9436.jpeg	', 0, 3),
('Air pods', 'https://a-static.mlcdn.com.br/800x560/airpods-pro-apple-com-estojo-de-recarga-magsafe-usb-c-branco/kabum/495557/02b6a39fee934436f83a545616e86bc8.jpeg', 0, 3),
('Air pods', 'https://a-static.mlcdn.com.br/800x560/airpods-pro-apple-com-estojo-de-recarga-magsafe-usb-c-branco/kabum/495557/080308ab2aeeefc1b9ccf939686eb31f.jpeg', 0, 3),
('Iphone 16 frente', 'https://a-static.mlcdn.com.br/800x560/apple-iphone-16-plus-128gb-preto-67-48mp-ios-5g/magazineluiza/238725500/9214f729d63f8e5b89e23998a9f4a77a.jpg', 0, 2),
('Iphone 16 frente', 'https://a-static.mlcdn.com.br/800x560/apple-iphone-16-plus-128gb-preto-67-48mp-ios-5g/magazineluiza/238725500/9214f729d63f8e5b89e23998a9f4a77a.jpg', 0, 2),
('Iphone 16 frente', 'https://a-static.mlcdn.com.br/800x560/apple-iphone-16-plus-128gb-preto-67-48mp-ios-5g/magazineluiza/238725500/c959c8b86487791737beffa63c610bc9.jpg', 0, 2),
('Iphone 16 frente', 'https://a-static.mlcdn.com.br/800x560/usado-iphone-11-branco-128gb-excelente-trocafy-apple/trocafy/630/5029c89eb38163b653d1be989996971c.jpeg', 0, 1),
('Iphone 16 tras', 'https://a-static.mlcdn.com.br/800x560/apple-iphone-16-plus-128gb-preto-67-48mp-ios-5g/magazineluiza/238725500/b59ae64fb933457d2885b9785de52ff7.jpg', 0, 2),
('Iphone 16 tras', 'https://a-static.mlcdn.com.br/800x560/usado-iphone-11-branco-128gb-excelente-trocafy-apple/trocafy/630/f15a3528edb69ed88471f449f3dbd0cc.jpeg', 0, 1),
('Iphone 16 tras', 'https://a-static.mlcdn.com.br/800x560/usado-iphone-11-branco-128gb-excelente-trocafy-apple/trocafy/630/b88a2dca2d4d190f7fb997a373bfcf60.jpeg', 0, 1),
('Smartband Samsung', 'https://a-static.mlcdn.com.br/800x560/smartband-samsung-galaxy-fit3-prata/magazineluiza/237270800/2b5fe640334363861f98dec293b68344.jpg', 0, 4),
('Smartband Samsung', 'https://a-static.mlcdn.com.br/800x560/smartband-samsung-galaxy-fit3-prata/magazineluiza/237270800/2b5fe640334363861f98dec293b68344.jpg', 0, 4),
('Smartband Samsung', 'https://a-static.mlcdn.com.br/800x560/smartband-samsung-galaxy-fit3-prata/magazineluiza/237270800/500cf9c687d46a8162cb654c35867602.jpg', 0, 4),
('Carregador Apple', 'https://a-static.mlcdn.com.br/800x560/carregador-apple-usb-c-de-20w-original/magazineluiza/238198900/1223d63fca4e308668707a3237079819.jpg', 0, 5),
('Carregador Apple', 'https://a-static.mlcdn.com.br/800x560/carregador-apple-usb-c-de-20w-original/magazineluiza/238198900/3e8f1485a0219d7fe1a3e6f54f3de741.jpg', 0, 5),
('Carregador Apple', 'https://a-static.mlcdn.com.br/800x560/carregador-apple-usb-c-de-20w-original/magazineluiza/238198900/9ccbc9c92fb8ecc6ff7135afda09d342.jpg', 0, 5),
('Apple iPhone 16 Pro 256GB', 'https://a-static.mlcdn.com.br/800x560/apple-iphone-16-pro-256gb-titanio-deserto-63-48mp-ios-5g/magazineluiza/238723600/6a8489de148eeda8c138c149cef935ca.jpg', 0, 6),
('Apple iPhone 16 Pro 256GB', 'https://a-static.mlcdn.com.br/800x560/apple-iphone-16-pro-256gb-titanio-deserto-63-48mp-ios-5g/magazineluiza/238723600/0600818e2d2f0fc1657bd23ea479c58b.jpg', 0, 6),
('Apple iPhone 16 Pro 256GB', 'https://a-static.mlcdn.com.br/800x560/apple-iphone-16-pro-256gb-titanio-deserto-63-48mp-ios-5g/magazineluiza/238723600/383a19af408e18daa02fa9ce2e512d7a.jpg', 0, 6),
('Apple iPhone 16 Pro 256GB', 'https://a-static.mlcdn.com.br/800x560/apple-iphone-16-pro-256gb-titanio-deserto-63-48mp-ios-5g/magazineluiza/238723600/723e33d62214c0505082773680cd0585.jpg', 0, 6),
('Samsung Galaxy', 'https://a-static.mlcdn.com.br/800x560/samsung-galaxy-s23-fe-5g-smartphone-android-128gb-verde/magazineluiza/237985600/bba751160bb381b9764fb472eb7245f3.jpg', 0, 7),
('Samsung Galaxy', 'https://a-static.mlcdn.com.br/1500x1500/samsung-galaxy-s23-fe-5g-smartphone-android-128gb-verde/magazineluiza/237985600/cb9f6d07d676812eb52d3ba013546dea.jpg', 0, 7),
('Apple Watch Series 9', 'https://a-static.mlcdn.com.br/800x560/apple-watch-series-9-gps-cellular-caixa-dourada-de-aco-inoxidavel-45mm-pulseira-esportiva-argila-m-g/magazineluiza/237936400/4f6f5db147269e9038909ef8725619aa.jpg', 0, 8),
('Apple Watch Series 9', 'https://a-static.mlcdn.com.br/800x560/apple-watch-series-9-gps-cellular-caixa-dourada-de-aco-inoxidavel-45mm-pulseira-esportiva-argila-m-g/magazineluiza/237936400/d229c8888935c42e6a8e3fa50b7152e3.jpg', 0, 8),
('Apple Watch Series 9', 'https://a-static.mlcdn.com.br/800x560/apple-watch-series-9-gps-cellular-caixa-dourada-de-aco-inoxidavel-45mm-pulseira-esportiva-argila-m-g/magazineluiza/237936400/0d538c6153092eecdd0689c02b5eda2e.jpg', 0, 8),
('Notebook Apple Macbook Air ', 'https://a-static.mlcdn.com.br/800x560/notebook-apple-macbook-air-136-m2-8gb-ram-256gb-ssd-prata/magazineluiza/235410100/684818f6f226d642928fb11170d8679c.jpg', 0, 9),
('Notebook Apple Macbook Air ', 'https://a-static.mlcdn.com.br/800x560/notebook-apple-macbook-air-136-m2-8gb-ram-256gb-ssd-prata/magazineluiza/235410100/cde4b6b35777c873a509653163aa25aa.jpg', 0, 9),
('Notebook Apple Macbook Air ', 'https://a-static.mlcdn.com.br/800x560/notebook-apple-macbook-air-136-m2-8gb-ram-256gb-ssd-prata/magazineluiza/235410100/ff7f5e20cb267d1b2a146e0f0cf5111d.jpg', 0, 9),
('IPhone 16 Plus Apple 128GB', 'https://a-static.mlcdn.com.br/800x560/iphone-16-plus-apple-128gb-camera-dupla-de-48mp-tela-67-rosa/kabum/634646/f4339e020ab53a6830e4f5160c6ae5ce.jpeg', 0, 10),
('IPhone 16 Plus Apple 128GB', 'https://a-static.mlcdn.com.br/800x560/iphone-16-plus-apple-128gb-camera-dupla-de-48mp-tela-67-rosa/kabum/634646/beee638dd02dac523efecc16431f92a9.jpeg', 0, 10),
('IPhone 16 Plus Apple 128GB', 'https://a-static.mlcdn.com.br/800x560/iphone-16-plus-apple-128gb-camera-dupla-de-48mp-tela-67-rosa/kabum/634646/68162b2a2b8cbc7fb7bae303ea83c99b.jpeg', 0, 10),
('IPhone 16 Plus Apple 128GB', 'https://a-static.mlcdn.com.br/800x560/iphone-16-plus-apple-128gb-camera-dupla-de-48mp-tela-67-rosa/kabum/634646/e3adaa3d63d6fbb593457ecdc3376800.jpeg', 0, 10),
('Cabo Tipo C P/ Tipo C Original ', 'https://a-static.mlcdn.com.br/800x560/cabo-tipo-c-p-tipo-c-original-inova/shop-aquarela/ctxt/c96b0592c35511bd46d41c53e2db9e7e.jpeg', 0, 11),
('Cabo Tipo C P/ Tipo C Original ', 'https://a-static.mlcdn.com.br/800x560/cabo-tipo-c-p-tipo-c-original-inova/shop-aquarela/ctxt/10334b40bc706ba1bb648ae26d7513b1.jpeg', 0, 11),
('Cabo Tipo C P/ Tipo C Original ', 'https://a-static.mlcdn.com.br/800x560/cabo-tipo-c-p-tipo-c-original-inova/shop-aquarela/ctxt/0e69370001938a6b4a63e492d39f5a6b.jpeg', 0, 11),
('Notebook Apple Macbook Air 13,6', 'https://a-static.mlcdn.com.br/800x560/notebook-apple-macbook-air-136-m2-8gb-ram-512gb-ssd-meia-noite/magazineluiza/235410600/b7f0d6ad4ec77389ee40218d97322680.jpg', 0, 13),
('Notebook Apple Macbook Air 13,6', 'https://a-static.mlcdn.com.br/800x560/notebook-apple-macbook-air-136-m2-8gb-ram-512gb-ssd-meia-noite/magazineluiza/235410600/ea3a6acd01e309d556ccf6a12cbbe4f7.jpg', 0, 13),
('Notebook Apple Macbook Air 13,6', 'https://a-static.mlcdn.com.br/800x560/notebook-apple-macbook-air-136-m2-8gb-ram-512gb-ssd-meia-noite/magazineluiza/235410600/c2b574af66c92cc95b31022636eed92a.jpg', 0, 13),
('Notebook Apple Macbook Air 13,6', 'https://a-static.mlcdn.com.br/800x560/smartphone-samsung-galaxy-s23-256gb-preto-5g-8gb-ram-61-cam-tripla-selfie-12mp/magazineluiza/232854100/e9fd12e9a66f2797bce34c5169369937.jpg', 0, 12),
('Notebook Apple Macbook Air 13,6', 'https://a-static.mlcdn.com.br/800x560/smartphone-samsung-galaxy-s23-256gb-preto-5g-8gb-ram-61-cam-tripla-selfie-12mp/magazineluiza/232854100/3db64f5d28040178dfa05a7e6192552e.jpg', 0, 12),
('IPhone 12 64GB Vermelho', 'https://a-static.mlcdn.com.br/800x560/usado-iphone-12-product-red-64gb-excelente-trocafy-apple/trocafy/975/ae8d52fe77b60496c909f07025e83d1d.jpeg', 0, 14),
('IPhone 12 64GB Vermelho', 'https://a-static.mlcdn.com.br/800x560/usado-iphone-12-product-red-64gb-excelente-trocafy-apple/trocafy/975/11517e52b1516f9544fda55574f4b17a.jpeg', 0, 14),
('IPhone 12 64GB Vermelho', 'https://a-static.mlcdn.com.br/800x560/usado-iphone-12-product-red-64gb-excelente-trocafy-apple/trocafy/975/9520c4d7ccf570c4b2bcab1923978b7f.jpeg', 0, 14),
('Notebook Acer Aspire 5 Intel Core i5 1', 'https://a-static.mlcdn.com.br/800x560/notebook-acer-aspire-5-intel-core-i5-12450h-8gb-ram-512gb-ssd-156-full-hd-windows-11-a515-57-565j/magazineluiza/237866400/00db0856da2536c633f5bf3085c874c5.jpg', 0, 15),
('Notebook Acer Aspire 5 Intel Core i5 1', 'https://a-static.mlcdn.com.br/800x560/notebook-acer-aspire-5-intel-core-i5-12450h-8gb-ram-512gb-ssd-156-full-hd-windows-11-a515-57-565j/magazineluiza/237866400/1d42d4b161b41b6463cebd5c99f6c776.jpg', 0, 15),
('Notebook Acer Aspire 5 Intel Core i5 1', 'https://a-static.mlcdn.com.br/1500x1500/notebook-acer-aspire-5-intel-core-i5-12450h-8gb-ram-512gb-ssd-156-full-hd-windows-11-a515-57-565j/magazineluiza/237866400/6b0c8a7014d51c302ce9287201073a05.jpg', 0, 15),
('Capinha + Película 3D + Película de Câmera iPhone 13 6.1', 'https://a-static.mlcdn.com.br/800x560/capinha-pelicula-3d-pelicula-de-camera-iphone-13-6-1-armyshield/armyshield/armyml0435/cfe2c1697a88e954bb88919f324cbdab.jpeg', 0, 16),
('Capinha + Película 3D + Película de Câmera iPhone 13 6.1', 'https://a-static.mlcdn.com.br/800x560/capinha-pelicula-3d-pelicula-de-camera-iphone-13-6-1-armyshield/armyshield/armyml0435/94c21ac5efadc75bb830f851c68625dc.jpeg', 0, 16),
('Carregador Portátil Poewr Bank', 'https://a-static.mlcdn.com.br/800x560/carregador-portatil-poewr-bank-10-000mah-universal-celular-tipoc-ios-v8-prime/magaprimer/10000901p/a64c1f7b720571b1c971a2812a6cdc22.jpeg', 0, 17),
('Carregador Portátil Poewr Bank', 'https://a-static.mlcdn.com.br/800x560/carregador-portatil-poewr-bank-10-000mah-universal-celular-tipoc-ios-v8-prime/magaprimer/10000901p/f8ff049ccf0fd3a15fa7e1567fcff3cd.jpeg', 0, 17),
('Carregador Portátil Poewr Bank', 'https://a-static.mlcdn.com.br/800x560/carregador-portatil-poewr-bank-10-000mah-universal-celular-tipoc-ios-v8-prime/magaprimer/10000901p/6db5c5f834fc4098676ad496d25978b2.jpeg', 0, 17),
('Carregador Portátil/Power Bank Geonav', 'https://a-static.mlcdn.com.br/800x560/carregador-portatil-power-bank-geonav-14000mah-pb14kal/magazineluiza/230000600/f6c5a90905e889b44f69b4de08705ddc.jpg', 0, 18),
('Carregador Portátil/Power Bank Geonav', 'https://a-static.mlcdn.com.br/800x560/carregador-portatil-power-bank-geonav-14000mah-pb14kal/magazineluiza/230000600/74ba0580878fa5ffc06f912d3dd03cc5.jpg', 0, 18),
('Carregador Portátil/Power Bank Geonav', 'https://a-static.mlcdn.com.br/800x560/carregador-portatil-power-bank-geonav-14000mah-pb14kal/magazineluiza/230000600/47f7d1a75cb8a11a90a111b3aa247ea2.jpg', 0, 18),
('Smartphone Motorola Edge 50', 'https://a-static.mlcdn.com.br/800x560/smartphone-motorola-edge-50-fusion-5g-256gb-16gb-ram-blue-teal/cellularmix/pb1w0000br/835039d3bcc89b11c104bcbfb382f01a.jpeg', 0, 19),
('Smartphone Motorola Edge 50', 'https://a-static.mlcdn.com.br/800x560/smartphone-motorola-edge-50-fusion-5g-256gb-16gb-ram-blue-teal/cellularmix/pb1w0000br/187f9714a031947b3a8331c183d4f31a.jpeg', 0, 19),
('Smartphone Motorola Edge 50', 'https://a-static.mlcdn.com.br/800x560/smartphone-motorola-edge-50-fusion-5g-256gb-16gb-ram-blue-teal/cellularmix/pb1w0000br/3b0ed43a132ef5b783e34520971a949e.jpeg', 0, 19),
('Cabo Carregador Turbo Micro-USB', 'https://a-static.mlcdn.com.br/800x560/cabo-carregador-turbo-micro-usb-v8-reforcado-2-metros-inova/shop-aquarela/cv/2361f264968c41f5b0986fa4b7c4c5e7.jpeg', 0, 20),
('Cabo Carregador Turbo Micro-USB', 'https://a-static.mlcdn.com.br/800x560/cabo-carregador-turbo-micro-usb-v8-reforcado-2-metros-inova/shop-aquarela/cv/541b43b091c8ffd82a5d5d515bdb6c1f.jpeg', 0, 20),
('Notebook Lenovo IdeaPad 1i Intel Core i5-1235U', 'https://a-static.mlcdn.com.br/800x560/notebook-lenovo-ideapad-1i-intel-core-i5-1235u-12gb-512gb-ssd-linux-15-6-82vys00900/lenovooficial/82vys00900/2534b5d3dc1818d3897017067c18efce.jpeg', 0, 21),
('Notebook Lenovo IdeaPad 1i Intel Core i5-1235U', 'https://a-static.mlcdn.com.br/800x560/notebook-lenovo-ideapad-1i-intel-core-i5-1235u-12gb-512gb-ssd-linux-15-6-82vys00900/lenovooficial/82vys00900/5b8350a3b973cd2f12126db2c0a066a1.jpeg', 0, 21),
('Notebook Lenovo IdeaPad 1i Intel Core i5-1235U', 'https://a-static.mlcdn.com.br/800x560/notebook-lenovo-ideapad-1i-intel-core-i5-1235u-12gb-512gb-ssd-linux-15-6-82vys00900/lenovooficial/82vys00900/6008c7a5e275599dbc671593c5eccfdb.jpeg', 0, 21),
('Notebook Acer Aspire 3 Intel Core i3 8GB 256GB SSD', 'https://a-static.mlcdn.com.br/800x560/notebook-acer-aspire-3-intel-core-i3-8gb-256gb-ssd-156-full-hd-windows-11-a315-510p-34xc/magazineluiza/237866600/ab5d31b555af09cf09c4ddf3190d892a.jpg', 0, 22),
('Notebook Acer Aspire 3 Intel Core i3 8GB 256GB SSD', 'https://a-static.mlcdn.com.br/800x560/notebook-acer-aspire-3-intel-core-i3-8gb-256gb-ssd-156-full-hd-windows-11-a315-510p-34xc/magazineluiza/237866600/a8680301053b0481eb40a95c9c73064e.jpg', 0, 22),
('Notebook Acer Aspire 3 Intel Core i3 8GB 256GB SSD', 'https://a-static.mlcdn.com.br/800x560/notebook-acer-aspire-3-intel-core-i3-8gb-256gb-ssd-156-full-hd-windows-11-a315-510p-34xc/magazineluiza/237866600/ff677b6cc8b61fc7e729ab2b0e6d3f60.jpg', 0, 22),
('iPhone 16 Pro Max Apple 512GB', 'https://a-static.mlcdn.com.br/800x560/iphone-16-pro-max-apple-512gb-camera-tripla-de-48mp-tela-69-titanio-branco/kabum/634680/aa100ed11d19a6e5beb9f960cca1c71b.jpeg', 0, 23),
('iPhone 16 Pro Max Apple 512GB', 'https://a-static.mlcdn.com.br/800x560/iphone-16-pro-max-apple-512gb-camera-tripla-de-48mp-tela-69-titanio-branco/kabum/634680/f4c283cb98768e45952cf131800da620.jpeg', 0, 23),
('iPhone 16 Pro Max Apple 512GB', 'https://a-static.mlcdn.com.br/800x560/iphone-16-pro-max-apple-512gb-camera-tripla-de-48mp-tela-69-titanio-branco/kabum/634680/ef8bee92d43b33144082031dde0145e1.jpeg', 0, 23),
('iPhone 16 Pro Max Apple 512GB', 'https://a-static.mlcdn.com.br/800x560/iphone-16-pro-max-apple-512gb-camera-tripla-de-48mp-tela-69-titanio-branco/kabum/634680/bd97934978257c7cdae1adc757758f3b.jpeg', 0, 23),
('iPhone 13 Apple (128GB) Meia-noite', 'https://a-static.mlcdn.com.br/800x560/iphone-13-apple-128gb-meia-noite-tela-de-61-5g-e-camera-dupla-de-12-mp/fastshop2/aemlpf3braptob/5db50434ecf8c90c400b77a9bfec5753.jpeg', 0, 24),
('iPhone 13 Apple (128GB) Meia-noite', 'https://a-static.mlcdn.com.br/800x560/iphone-13-apple-128gb-meia-noite-tela-de-61-5g-e-camera-dupla-de-12-mp/fastshop2/aemlpf3braptob/81762f82484efdbe90a1ba9c88f35b50.jpeg', 0, 24),
('iPhone 13 Apple (128GB) Meia-noite', 'https://a-static.mlcdn.com.br/800x560/iphone-13-apple-128gb-meia-noite-tela-de-61-5g-e-camera-dupla-de-12-mp/fastshop2/aemlpf3braptob/90b00d11fad31f3f4735674f3479a21e.jpeg', 0, 24),
('Notebook Lenovo IdeaPad 1i Intel Core i7', 'https://a-static.mlcdn.com.br/800x560/notebook-lenovo-ideapad-1i-intel-core-i7-12gb-ram-512gb-ssd-156-windows-11-82vy000pbr/magazineluiza/238006000/d63e06f6dd3440abb32b19b233233f19.jpg', 0, 25),
('Notebook Lenovo IdeaPad 1i Intel Core i7', 'https://a-static.mlcdn.com.br/800x560/notebook-lenovo-ideapad-1i-intel-core-i7-12gb-ram-512gb-ssd-156-windows-11-82vy000pbr/magazineluiza/238006000/17f70fcf1e4a64d242e3d645f558e82e.jpg', 0, 25),
('Notebook Lenovo IdeaPad 1i Intel Core i7', 'https://a-static.mlcdn.com.br/800x560/notebook-lenovo-ideapad-1i-intel-core-i7-12gb-ram-512gb-ssd-156-windows-11-82vy000pbr/magazineluiza/238006000/766b164e97964aad110a5941452212f6.jpg', 0, 25);

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
('2024-11-20 19:00:00', 1, 10, 10);

-- Inserts novos com os dados do web scraping
INSERT INTO tb_click_produto (data_hora_click,possivel_compra,fk_usuario,fk_produto) VALUES
('2024-09-25 18:00:00', 0, 1, 1),
('2024-09-25 18:10:00', 0, 4, 12),
('2024-09-25 18:20:00', 0, 1, 13),
('2024-09-28 18:40:00', 0, 2, 13),
('2024-09-28 18:40:00', 0, 5, 10),
('2024-09-28 20:40:00', 0, 3, 14),
('2024-09-30 20:50:00', 0, 11, 10),
('2024-09-30 14:30:00', 0, 9, 12),
('2024-09-30 10:40:00', 0, 6, 10),
('2024-10-05 10:40:00', 0, 7, 13),
('2024-10-08 10:0:00', 0, 7, 13),
('2024-10-08 00:20:00', 0, 1, 13),
('2024-10-18 13:25:00', 0, 9, 14),
('2024-10-18 15:40:00', 0, 10, 13),
('2024-10-20 22:00:00', 0, 8, 9),
('2024-10-22 17:40:00', 0, 8, 2),
('2024-10-25 16:40:00', 0, 8, 4),
('2024-10-25 11:40:00', 0, 3, 9),
('2024-10-25 21:40:00', 0, 4, 1),
('2024-10-25 19:40:00', 0, 2, 7),
('2024-10-25 10:40:00', 0, 5, 7);
-- 

-- Inserts para tabela tb_tag_produto
INSERT INTO tb_tag_produto (tag) VALUES
('Ofertas'),
('Lançamento'),
('Popular'),
('Promoção'),
('Novidade');

-- Inserts para tabela tb_classificacao_produto
INSERT INTO tb_classificacao_produto (fk_produto, fk_tag_produto) VALUES
(1, 1), 
(2, 2), 
(3, 3), 
(4, 4), 
(5, 5), 
(6, 1), 
(7, 2), 
(8, 3), 
(9, 4),
(10, 5); 

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
('2024-04-12 09:30:00', 10, 2), -- Usuario 10, Produto 9
('2024-04-12 09:30:00', 10, 4), -- Usuario 10, Produto 9
('2024-04-12 09:30:00', 10, 5), -- Usuario 10, Produto 9
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
select * from tb_imagem_produto;
-- Views --------------------------------------------------------------
-- View de chamados descontinuada
-- create view `vwchamadosgrafico` as 
-- select qtd, dia, mes, id,status_chamado as status from (
-- select 
-- id,
-- status_chamado,
-- count(status_chamado) as qtd, 
-- DATE_FORMAT(data_hora_abertura, '%d') as dia,
-- DATE_FORMAT(data_hora_abertura, '%m') as mes
-- from tb_produto_chamado where status_chamado >= 1
-- and data_hora_abertura >= date_sub(now(), interval 6 month)
-- group by dia, mes, status_chamado,id
-- ) as viz order by status_chamado;
--
-- view corrigida
CREATE VIEW `vwcategoriasacessos` AS
SELECT DENSE_RANK() OVER (ORDER BY tb_categoria.id) AS id, count(data_hora_click) AS acessos, tb_categoria.nome AS categoria
FROM tb_click_produto JOIN tb_produto ON fk_produto = tb_produto.id JOIN tb_categoria ON fk_categoria = tb_categoria.id GROUP BY
categoria,tb_categoria.id;
--
select * from vwcategoriasacessos;

-- view corrigida
create view  `vwprodutosmaisacessados` as
SELECT 
    p.id AS id,
    p.qtd_estoque AS qtd,
    p.nome,
    COUNT(cp.data_hora_click) AS acessos,
    (SELECT tb_imagem_produto.codigo_imagem
     FROM tb_imagem_produto
     WHERE tb_imagem_produto.fk_produto = p.id
     LIMIT 1) AS url
FROM tb_produto p
JOIN tb_click_produto AS cp ON p.id = cp.fk_produto
GROUP BY id, qtd_estoque, p.nome
ORDER BY acessos DESC
LIMIT 6;
/*CREATE VIEW `vwprodutosmaisacessados` AS
SELECT tb_produto.id AS id, tb_produto.qtd_estoque AS qtd,tb_produto.nome,
count(data_hora_click) AS acessos,tb_imagem_produto.codigo_imagem AS url
FROM tb_produto JOIN tb_click_produto ON tb_produto.id = fk_produto 
JOIN tb_imagem_produto ON tb_imagem_produto.fk_produto = tb_produto.id
AND tb_imagem_produto.indice_vt = 0 GROUP BY nome, qtd, id, url 
ORDER BY acessos DESC LIMIT 7; */
--
select * from vwprodutosmaisacessados;
--
-- kpis
--
-- view corrigida
CREATE VIEW `vwfaturamento` AS
SELECT SUM(tb_produto.preco) FROM tb_click_produto JOIN tb_produto ON fk_produto = tb_produto.id
WHERE possivel_compra = 0 AND data_hora_click >= DATE_SUB(NOW(), INTERVAL 7 DAY);
--
select * from vwfaturamento;
-- view corrigida
CREATE VIEW `vwacessossetedias` AS
SELECT qtd,id FROM (
SELECT
possivel_compra,
id,
COUNT(possivel_compra) AS qtd
FROM tb_click_produto WHERE possivel_compra =0
AND data_hora_click < DATE_SUB(NOW(), INTERVAL 7 DAY)
GROUP BY possivel_compra,id
) AS viz ORDER BY possivel_compra;
--
select * from vwacessossetedias;
-- view corrigida
CREATE VIEW `vwtaxaretorno` AS
SELECT tb_usuario.id AS id,tb_usuario.nome AS usuario,COUNT(tb_click_produto.data_hora_click) AS cliques FROM tb_click_produto
JOIN tb_usuario ON fk_usuario = tb_usuario.id GROUP BY tb_usuario.id HAVING cliques > 1 ORDER BY cliques DESC;
--
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
