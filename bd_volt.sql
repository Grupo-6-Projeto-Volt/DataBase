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
("Smartphone Realme C61", "Apresentamos o Smartphone Realme C61, um dispositivo que combina desempenho robusto e estilo sofisticado. Tela Ips Lcd de 6.74 polegadas. Taxa de atualização de 90hz.", 2, 1165.00, 10, "Seminovo", 0, NULL, NULL),
("Cabo Usb-C-Lightning", "Carregador fabricado com materiais de alta qualidade e com alta compatibilidade, suportando modelos desde o iPhone 6 até os mais recentes.", 3, 67.90, 10, "Novo", 0, NULL, NULL),
("MacBook Air 13", "O MacBook Air com M1 é um notebook extremamente portátil, versátil e rápido. Com uma linda tela retina, tecnologia silenciosa sem ventoinha, design fino e bateria que dura o dia todo.", 1, 5459.99, 10, "Usado", 0, NULL, NULL),
("IdeaPad 1i Intel Core i5-1235U", "O IdeaPad 1i Geração 7 (Intel 14”) é exatamente o que você precisa em um notebook de uso diário. Assista a shows em uma tela HD de 14” com uma moldura finíssima.", 1, 2199.99, 10, "Usado", 0, NULL, NULL),
("Fone de Ouvido Apple, EarPods, conector USB-C", "Esses fones oferecem uma solução de áudio com fio para dispositivos que possuem uma porta USB-C. Eles fornecem uma opção prática e direta para ouvir música, atender chamadas e participar de reuniões em dispositivos compatíveis com USB-C", 3, 197.10, 10, "Seminovo", 0, NULL, NULL),
("Caixa de Som JBL Boombox 3", "Curta as melhores músicas ao som JBL Original Pro Sound! Com o novo sistema de 3 vias que te oferecem maior sensibilidade do gabinete acústico, acrescentando 24 horas de duração de bateria para mantê-lo em seu ambiente o dia todo.", 4, 2099.00, 10, "Novo", 0, NULL, NULL),
("Fone de Ouvido JBL", "Adquira o novo fone Tune 520 da JBL e tenha acesso ao renomado som JBL Pure Bass, com a qualidade que só a JBL pode oferecer! Com Tecnologia sem fio Bluetooth 5.3 você possue mais liberdade na hora de ouvir as suas músicas", 3, 209.00, 10, "Novo", 0, NULL, NULL),
("Caixa de Som JBL PartyBox 120 Bluetooth", "A JBL PartyBox Club 120 é a caixa de som perfeita para transformar qualquer ocasião em uma festa inesquecível. Com o poderoso JBL Pro Sound, você desfruta de sons claros e dinâmicos, além de graves profundos mesmo no volume máximo.", 4, 1799.00, 10, "Seminovo", 0, NULL, NULL),
("Capa iPhone 14 Pro Originais iPlace, Beagá", "Proteja o seu iPhone com muito estilo! Ela é feita de silicone, sendo muito resistente e não adicionando volume ao seu smartphone. A capa impede que quedas e pequenas batidas danifiquem a traseira e a lateral do aparelho.", 3, 55.00, 10, "Novo", 0, NULL, NULL),
("Película iPhone 14 Pro Max", "Apresentamos a Película iPhone 14 Pro Max iPlace AntiBacteria Noronha Transparente, a defesa perfeita para a tela do seu smartphone contra danos e bactérias. Esta película, feita de vidro temperado de alta qualidade, oferece proteção superior contra arranhões e impactos, preservando a sensibilidade ao toque do seu iPhone 14 Pro Max", 3, 149.99, 10, "Novo", 0, NULL, NULL),
("Película iPhone 13 / 13 Pro", "A Película iPhone 13 Pro Max, Originais iPlace, Antiblue é a proteção ideal para a tela do seu iPhone. Desenvolvida pela iPlace, ela oferece uma camada resistente contra arranhões, sujeiras e danos causados pelo uso diário.", 3, 69.99, 10, "Novo", 0, NULL, NULL),
("Caixa de som JBL, Partybox Encore Essential, Portátil, Bluetooth", "A JBL Partybox Encore Essential é a caixa de som perfeita para animar qualquer ambiente com som de alta qualidade e praticidade. Compacta e portátil, ela traz a assinatura sonora JBL com graves intensos, garantindo uma experiência de áudio envolvente em festas, reuniões e até eventos ao ar livre.", 4, 1799.99, 10, "Seminovo", 0, NULL, NULL),
("iPad Air 11 M2, 6ª geração", "O iPad Air de 11 polegadas for redesenhado. Agora, ele conta com toda a potência do chip M2 da Apple1. Ele vem com uma tela Liquid Retina espetacular, nova câmera horizontal ideal para chamadas FaceTime e de vídeo, além de conexões Wi-Fi 6E2 e 5G3 ultrarrápidas. E, como é compatível com o novo Apple Pencil Pro e o Magic Keyboard, você consegue estudar, trabalhar, jogar e criar em qualquer lugar.", 2, 5949.00, 10, "Seminovo", 0, NULL, NULL),
("Mouse Ergonômico Sem Fio Lift Logitech", "O Mouse Sem Fio Ergonômico Logitech Lift foi projetado para proporcionar conforto e produtividade para usuários que buscam uma experiência ergonômica superior. Com uma inclinação de 57 graus, este mouse permite uma posição natural da mão, reduzindo a tensão nos pulsos e antebraços.", 3, 249.00, 10, "Seminovo", 0, NULL, NULL),
("Magic Keyboard com Touch ID, Apple", "Agora com o Magic Keyboard com Touch ID, você tem muito mais facilidade e rapidez na hora de fazer uma autentificação segura ao fazer login e compras. Você tem conforto, precisão e agilidade ao digitar. O teclado não apresenta fio, é recarregável e sua bateria interna dura muito (um mês ou mais entre recargas). Ele também emparelha automaticamente com seu Mac para você não perder tempo.", 3, 1439.50, 10, "Novo", 0, NULL, NULL),
("Teclado MX Keys S, Logitech, Bluetooth", "Agora com o teclado MX Keys S da Logitech você terá uma experiência de digitação confortável, rápida e fluida. Seu design faz com que usuário fique com uma posição do pulso natural, permitindo um trabalho mais saúdavel e produtivo! Projetado para ser dinâmico, ele possui iluminação inteligente, com teclas de luz de fundo que acendem quando suas mãos se aproximam. ", 3, 699.00, 10, "Usado", 0, NULL, NULL),
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
('Notebook Acer Aspire 5 Intel Core i5', ' A tela dele é em LED com tecnologia Anti reflexo Acer ComfyView de 15,6" com resolução Full HD e conta com sistema operacional Windows 11 Home de 64-bits, que proporciona um visual mais moderno, intuitivo e de fácil navegação.', 1, 2668.00, 50, 'Novo', 5, NULL, NULL),
('Capinha + Película 3D + Película de Câmera iPhone 13 6.1', 'Capinha Anti Shock Transparente com Bordas Reforçadas com todos os furos e medidas para o encaixe perfeito do celular.Envio Imeditato - Pronta Entrega. Muito mais qualidade para você não amarela e protege muito mais o celular', 3, 2668.00, 50, 'Novo', 5, NULL, NULL),
('Carregador Portátil Power Bank', 'Introduzido no mercado com a intenção de renovar o setor de carregadores. O LUCK AMAZONIA LU-538 possui 2 cabos contando com 3 modelos de carregadores, Android micro USB e tipo C', 3,73.99, 50, 'Novo', 5, NULL, NULL),
('Carregador Portátil/Power Bank Geonav 14000mAh', 'Com o carregador universal Portátil/Power Bank Geonav PB14KAL você estará pronto para qualquer desafio e poderá utilizar seus dispositivos móveis sempre com a carga máxima de energia. Produzido com bateria de polímero de lítio, ele possui capacidade de 14000mAh e conexões de diferentes tipos, USB padrão, USB tipo C e micro USB.', 3,73.99, 50, 'Novo', 5, NULL, NULL),
('Smartphone Motorola Edge 50 Fusion', 'Apresentando o poderoso Motorola Edge 50 Fusion Blue Teal! Com Android 14 e Snapdragon 6 Gen 1, seu desempenho é imbatível. Desfrute de uma experiência visual incrível em sua tela pOLED de 6.7 Full HD com 120Hz de atualização.', 2,2999.99, 50, 'Novo', 5, NULL, NULL),
('Cabo Carregador Turbo Micro-USB', 'De alta tecnologia, nosso cabo carregador foi projetado para garantir uma maior rapidez na passagem de energia por seus fios, contribuindo com uma recarga ágil e rápida.Seu revestimento com fios de nylon aumenta sua vida útil, protegendo-o contra as dobras, quebras e tornando-o mais maleável.', 3,39.99, 50, 'Novo', 5, NULL, NULL),
('Notebook Lenovo IdeaPad 1i Intel Core i5-1235U ', 'O IdeaPad 1i eleva sua categoria de notebooks com um processador Intel super eficiente de 12 geração em um chassi fino e compacto de 17,9 mm que facilita a multitarefa enquanto aumenta a eficiência energética com até 11 horas de duração da bateria e carga rápida', 1,2480.00, 50, 'Novo', 5, NULL, NULL),
('Notebook Acer Aspire 3 Intel Core i3 8GB 256GB SSD', 'Nos dias de hoje, com o avanço constante da tecnologia, tudo o que for digital, nem sempre é resolvido somente com um smartphone e é necessário o uso de computadores ou notebooks. Muitos optam pelo notebook pela praticidade de poder trabalhar, navegar pela internet e estudar em qualquer lugar que estiver.', 1, 2283.00, 50, 'Novo', 5, NULL, NULL),
('IPhone 16 Pro Max Apple 512GB', 'iPhone 16 Pro Max Resistência. Beleza. Titânio A estrutura do iPhone 16 Pro Max é em titânio Grau 5 com um novo acabamento por microjateamento. Como o titânio tem uma das melhores relações resistência-peso entre os metais, os modelos são superleves e incrivelmente resistentes. ', 2,1283.00, 50, 'Novo', 5, NULL, NULL),
('iNotebook Lenovo IdeaPad 1i Intel Core i7', 'O notebook Lenovo IdeaPad 1i 15IAU7 eleva a categoria de notebooks com processador Intel Core i7 1255U de 12ª geração em um chassi fino e compacto que facilita a multitarefa enquanto aumenta a eficiência energética com a bateria de longa duração e carga rápida. ', 1,3583.00, 50, 'Semi-novo', 5, NULL, NULL),
('Apple AirPods Max', 'AirPods Max, a experiência definitiva em áudio. Agora em cinco cores novas. Um driver exclusivo criado pela Apple oferece áudio de alta-fidelidade. O design, do arco às almofadas, foi pensado em cada detalhe para um ajuste impecável. O Cancelamento Ativo de Ruído de nível profissional bloqueia sons externos. Já o modo Ambiente deixa você ouvir o que acontece ao seu redor.', 1, 6590.00, 50, 'Novo', 24, NULL, NULL);

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
