<h1 style="color: #75CCED;">Informações importantes</h1>
<p>• Este é um projeto acadêmico em construção 🚧</p>
<p>• Todos os direitos são reservados aos desenvolvedores e a sua respectiva Instituição de Ensino</p>

## Andamento do projeto

<p align = "center">
<img src="https://img.shields.io/static/v1?label=STATUS&message=EM%20ANDAMENTO&color=yellow&style=for-the-badge"/>
</p>

## Time responsável pelo repositório
<table align="center">
  <tr>
    <td align="center"><a href="https://github.com/Davi-Hilario"><img style="border-radius: 50%;" src="https://avatars.githubusercontent.com/u/125586338?v=4" width="100px;" alt=""/><br /><sub><b>Davi Alexandre de Souza Hilário</b></a><br /><a href="#" >Desenvolvedor Backend e DBA</a></td>
  </tr>
</table>

## Ferramentas e Linguagens
<p>• Mysql Workbench</p>
<p>• Mysql v8.0</p>

## Padronização do Código
<p>Durante o desenvolvimento, a equipe adotou um padrão de desenvolvimento que deve ser seguido até o fim, visando sempre um projeto bem estruturado e íntegro.</p>

<table align="center">
  <tr> 
    <td>Criação de Tabelas</td>
    <td>A criação das tabelas deve sempre incluir a cláusula "IF NOT EXISTS" para checar se a tabela existe. Além disso, todas o nome das tabelas sempre deve     começar com "tb", seguido pelo restante do nome da tabela, utilizando do padrão snake case.</td>
  </tr>
</table>

```sql
      CREATE TABLE IF NOT EXISTS tb_exemplo_tabela
      (

      );
```
<br>

<table align="center">
  <tr> 
    <td>Definição dos Atributos</td>
    <td>Os atributos devem sempre possui o nome da tabela correspondente no final (desconsiderando o "tb"), seguindo também o padrão snake case para a devida     nomenclatura.</td>
  </tr>
</table>

```sql
      CREATE TABLE IF NOT EXISTS tb_exemplo_tabela
      (
          id_exemplo_tabela INT PRIMARY KEY AUTO_INCREMENT,
          nome_exemplo_tabela VARCHAR(60),
          data_nasc_exemplo_tabela DATE
      );
```

> [!NOTE]
> Essa regra de nomenclatura não se aplica para atributos considerados como Foreign Key
<br>

<table align="center">
  <tr> 
    <td>Atributos Foreign Key</td>
    <td>Atributos do tipo Chave Estrangeira seguem o padrão de snake case, porém o último nome do atributo deve fazer referência a sua tabela original e          começar com "fk"</td>
  </tr>
</table>

```sql
      CREATE TABLE IF NOT EXISTS tb_exemplo_tabela
      (
          id_exemplo_tabela INT PRIMARY KEY AUTO_INCREMENT,
          nome_exemplo_tabela VARCHAR(60),
          data_nasc_exemplo_tabela DATE,
          fk_outra_tabela INT,
          FOREIGN KEY(fk_outra_tabela) REFERENCES tb_outra_tabela(id_outra_tabela) 
      );
```
<br>

<table align="center">
  <tr> 
    <td>Views</td></td>
    <td>A ser desenvolvido</td>
  </tr>
</table>

```sql
      A ser desenvolvido
```
<br>

<table align="center">
  <tr> 
    <td>Procedures</td></td>
    <td>A ser desenvolvido</td>
  </tr>
</table>

```sql
      A ser desenvolvido
```
<br>

## Dicionário de Dados
<h3>• Tabela Usuário</h3>
<p>Tabela responsável por armazenar dados referentes aos usuários, tanto dos clientes quanto do administrador do negócio.</p>

<table align="center">
  <thead>
    <tr>
      <th colspan="5">Nome da Tabela</th>
    </tr>
    <tr>
      <th colspan="5">tb_usuario</th>
    </tr>
    <tr>
      <th colspan="2">Tabelas Relacionadas</th>
      <td colspan="3">tb_login, tb_negociacao, tb_compra, tb_carrinho</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Campo</th>
      <th>Tipo</th>
      <th>Tamanho</th>
      <th>Extra</th>
      <th>Descrição</th>
    </tr>
    <tr>
      <td>id_usuario</td>
      <td>INT</td>
      <td>-</td>
      <td>PRIMARY KEY, AUTO_INCREMENT</td>
      <td>ID numérico auto incrementável</td>
    </tr>
    <tr>
      <td>nome_usuario</td>
      <td>VARCHAR</td>
      <td>100</td>
      <td>NOT NULL</td>
      <td>Nome do usuário</td>
    </tr>
    <tr>
      <td>email_usuario</td>
      <td>VARCHAR</td>
      <td>100</td>
      <td>NOT NULL</td>
      <td>Email do usuário. Deve conter pelo menos um "@" e um "."</td>
    </tr>
    <tr>
      <td>telefone_usuario</td>
      <td>VARCHAR</td>
      <td>14</td>
      <td>-</td>
      <td>Telefone do usuário, podendo incluir ou não os parênteses e outros símbolos</td>
    </tr>
    <tr>
      <td>cep_usuario</td>
      <td>CHAR</td>
      <td>9</td>
      <td>-</td>
      <td>Cep do usuário. Deve seguir o formato "99999-999"</td>
    </tr>
    <tr>
      <td>categoria_usuario</td>
      <td>BINARY</td>
      <td>-</td>
      <td>-</td>
      <td>Informa se o usuário é um Cliente ou um Adminstrador. Clientes possuem acesso apenas ao site da loja, enquanto o Administrador possui acesso ao          produto Volt, com um site único onde ele poderá manejar o controle de estoque e atendimento ao cliente de forma mais eficaz.</td>
    </tr>
  </tbody>
</table>
<br>

<h3>• Tabela Login</h3>
<p>Tabela responsável por armazenar as credenciais de acesso dos usuários. Cada usuário possui um login, e cada login pertence a apenas um usuário.</p>

<table align="center">
  <thead>
    <tr>
      <th colspan="5">Nome da Tabela</th>
    </tr>
    <tr>
      <th colspan="5">tb_login</th>
    </tr>
    <tr>
      <th colspan="2">Tabelas Relacionadas</th>
      <td colspan="3">tb_usuario</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Campo</th>
      <th>Tipo</th>
      <th>Tamanho</th>
      <th>Extra</th>
      <th>Descrição</th>
    </tr>
    <tr>
      <td>id_login</td>
      <td>INT</td>
      <td>-</td>
      <td>PRIMARY KEY, AUTO_INCREMENT</td>
      <td>ID numérico auto incrementável</td>
    </tr>
    <tr>
      <td>email_login</td>
      <td>VARCHAR</td>
      <td>100</td>
      <td>NOT NULL, UNIQUE</td>
      <td>Email utilizado no login.</td>
    </tr>
    <tr>
      <td>senha_login</td>
      <td>VARCHAR</td>
      <td>100</td>
      <td>NOT NULL, UNIQUE</td>
      <td>Senha do usuário. Deve ter no mínimo 8 caracteres.</td>
    </tr>
    <tr>
      <td>fk_usuario</td>
      <td>INT</td>
      <td>-</td>
      <td>FOREIGN KEY</td>
      <td>Chave estrangeira referenciando o {id_usuario} da tabela {tb_usuario}</td>
    </tr>
  </tbody>
</table>
<br>

<h3>• Tabela Carrinho</h3>
<p>Tabela responsável pelo carrinho da loja. Cada carrinho pertence a um e apenas um usuário, e cada usuário pode ter vários carrinhos.</p>

<table align="center">
  <thead>
    <tr>
      <th colspan="5">Nome da Tabela</th>
    </tr>
    <tr>
      <th colspan="5">tb_carrinho</th>
    </tr>
    <tr>
      <th colspan="2">Tabelas Relacionadas</th>
      <td colspan="3">tb_usuario, tb_carrinho_produto, tb_compra</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Campo</th>
      <th>Tipo</th>
      <th>Tamanho</th>
      <th>Extra</th>
      <th>Descrição</th>
    </tr>
    <tr>
      <td>id_carrinho</td>
      <td>INT</td>
      <td>-</td>
      <td>PRIMARY KEY, AUTO_INCREMENT</td>
      <td>ID numérico auto incrementável</td>
    </tr>
    <tr>
      <td>estado_carrinho</td>
      <td>BINARY</td>
      <td>-</td>
      <td>-</td>
      <td>Informa se o carrinho está ativo ou não. Utilizado para saber se, ao inserir um produto no carrinho, deve criar um carrinho novo ou inserir num          carrinho já existente</td>
    </tr>
    <tr>
      <td>fk_usuario</td>
      <td>INT</td>
      <td>-</td>
      <td>FOREIGN KEY</td>
      <td>Chave estrangeira referenciando o campo {id_usuario} da tabela {tb_usuario}</td>
    </tr>
  </tbody>
</table>
<br>

<h3>• Tabela Produto</h3>
<p>Tabela responsável pelo armazenamento dos produtos, tanto os que serão catalogados na loja quanto os que serão fornecidos ao admnistrador para conserto ou venda. O produto pode ter várias imagens, porém cada imagem pertence a apenas um produto.</p>

<table align="center">
  <thead>
    <tr>
      <th colspan="5">Nome da Tabela</th>
    </tr>
    <tr>
      <th colspan="5">tb_produto</th>
    </tr>
    <tr>
      <th colspan="2">Tabelas Relacionadas</th>
      <td colspan="3">tb_carrinho_produto, tb_negociacao, tb_imagem_produto</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Campo</th>
      <th>Tipo</th>
      <th>Tamanho</th>
      <th>Extra</th>
      <th>Descrição</th>
    </tr>
    <tr>
      <td>id_produto</td>
      <td>INT</td>
      <td>-</td>
      <td>PRIMARY KEY, AUTO_INCREMENT</td>
      <td>ID numérico auto incrementável</td>
    </tr>
    <tr>
      <td>nome_produto</td>
      <td>VARCHAR</td>
      <td>80</td>
      <td>-</td>
      <td>Nome do produto que será exibido/negociado</td>
    </tr>
    <tr>
      <td>desc_produto</td>
      <td>VARCHAR</td>
      <td>300</td>
      <td>-</td>
      <td>Descrição do produto que será exibido/negociado</td>
    </tr>
    <tr>
      <td>preco_produto</td>
      <td>DECIMAL</td>
      <td>(8,2)</td>
      <td>-</td>
      <td>Preço do produto. Não pode ser menor que 0.</td>
    </tr>
    <tr>
      <td>qtd_estoque_produto</td>
      <td>INT</td>
      <td>-</td>
      <td>-</td>
      <td>Quantidade desse produto no estoque. Não pode ser menor que 0.</td>
    </tr>
  </tbody>
</table>
<br>

<h3>• Tabela Carrinho Produto</h3>
<p>Tabela que interliga o carrinho com produtos. Um carrinho pode ter vários produtos, assim como um produto pode estar em vários carrinhos.</p>

<table align="center">
  <thead>
    <tr>
      <th colspan="5">Nome da Tabela</th>
    </tr>
    <tr>
      <th colspan="5">tb_carrinho_produto</th>
    </tr>
    <tr>
      <th colspan="2">Tabelas Relacionadas</th>
      <td colspan="3">tb_carrinho, tb_produto</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Campo</th>
      <th>Tipo</th>
      <th>Tamanho</th>
      <th>Extra</th>
      <th>Descrição</th>
    </tr>
    <tr>
      <td>id_carrinho_produto</td>
      <td>INT</td>
      <td>-</td>
      <td>PRIMARY KEY, AUTO_INCREMENT</td>
      <td>ID numérico auto incrementável</td>
    </tr>
    <tr>
      <td>quantidade_carrinho_produto</td>
      <td>INT</td>
      <td>-</td>
      <td>-</td>
      <td>Quantidade de determinado produto que está no carrinho</td>
    </tr>
    <tr>
      <td>fk_carrinho</td>
      <td>INT</td>
      <td>-</td>
      <td>FOREIGN KEY</td>
      <td>Chave estrangeira referenciando o campo {id_carrinho} da tabela {tb_carrinho}</td>
    </tr>
    <tr>
      <td>fk_produto</td>
      <td>INT</td>
      <td>-</td>
      <td>FOREIGN KEY</td>
      <td>Chave estrangeira referenciando o campo {id_produto} da tabela {tb_produto}</td>
    </tr>
  </tbody>
</table>
<br>

<h3>• Tabela Imagem Produto</h3>
<p>Tabela reference a imagem dos produtos que serão exibidos. Cada produto pode ter várias imagens, mas cada imagem pertence a um único produto.</p>

<table align="center">
  <thead>
    <tr>
      <th colspan="5">Nome da Tabela</th>
    </tr>
    <tr>
      <th colspan="5">tb_imagem_produto</th>
    </tr>
    <tr>
      <th colspan="2">Tabelas Relacionadas</th>
      <td colspan="3">tb_produto</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Campo</th>
      <th>Tipo</th>
      <th>Tamanho</th>
      <th>Extra</th>
      <th>Descrição</th>
    </tr>
    <tr>
      <td>id_imagem_produto</td>
      <td>INT</td>
      <td>-</td>
      <td>PRIMARY KEY, AUTO_INCREMENT</td>
      <td>ID numérico auto incrementavel</td>
    </tr>
    <tr>
      <td>nome_imagem_produto</td>
      <td>VARCHAR</td>
      <td>100</td>
      <td>-</td>
      <td>Nome da imagem a ser cadastrada.</td>
    </tr>
    <tr>
      <td>cod_imagem_produto</td>
      <td>TEXT</td>
      <td>-</td>
      <td>-</td>
      <td>Código/url criptografada da imagem a ser cadastrada</td>
    </tr>
    <tr>
      <td>fk_produto</td>
      <td>INT</td>
      <td>-</td>
      <td>FOREIGN KEY</td>
      <td>Chave estrangeira referenciando o campo {id_produto} da tabela {tb_produto}</td>
    </tr>
  </tbody>
</table>
<br>

<h3>• Tabela Compra</h3>
<p>Tabela onde as compras realizadas são armazenadas. Cada compra está relacionada a apenas um carrinho, assim como cada carrinho só pode realizar uma compra.</p>

<table align="center">
  <thead>
    <tr>
      <th colspan="5">Nome da Tabela</th>
    </tr>
    <tr>
      <th colspan="5">tb_compra</th>
    </tr>
    <tr>
      <th colspan="2">Tabelas Relacionadas</th>
      <td colspan="3">tb_carrinho, tb_chamado</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Campo</th>
      <th>Tipo</th>
      <th>Tamanho</th>
      <th>Extra</th>
      <th>Descrição</th>
    </tr>
    <tr>
      <td>id_compra</td>
      <td>INT</td>
      <td>-</td>
      <td>PRIMARY KEY, AUTO_INCREMENT</td>
      <td>ID numérico auto incrementavel</td>
    </tr>
    <tr>
      <td>data_hora_compra</td>
      <td>DATETIME</td>
      <td>-</td>
      <td>-</td>
      <td>Data e horário que a compra foi finalizada</td>
    </tr>
    <tr>
      <td>forma_pagamento_compra</td>
      <td>VARCHAR</td>
      <td>10</td>
      <td>-</td>
      <td>Forma de pagamento escolhida para o pagamento da compra</td>
    </tr>
    <tr>
      <td>forma_entrega_compra</td>
      <td>VARCHAR</td>
      <td>15</td>
      <td>-</td>
      <td>Forma de entrega escolhida para entregar o produto</td>
    </tr>
    <tr>
      <td>fk_carrinho</td>
      <td>INT</td>
      <td>-</td>
      <td>FOREIGN KEY</td>
      <td>Chave estrangeira referenciando o campo {id_carrinho} da tabela {tb_carrinho}</td>
    </tr>
    <tr>
      <td>fk_usuario</td>
      <td>INT</td>
      <td>-</td>
      <td>FOREIGN KEY</td>
      <td>Chave estrangeira referenciando o campo {id_usuario} da tabela {tb_usuario}</td>
    </tr>
  </tbody>
</table>
<br>

<h3>• Tabela Chamado</h3>
<p>Tabela onde os chamados de compra que aparecerão na tela do adminstrador aparecerão. Cada chamado é associado a uma compra, assim como cada compra pode abrir apenas um chamado.</p>

<table align="center">
  <thead>
    <tr>
      <th colspan="5">Nome da Tabela</th>
    </tr>
    <tr>
      <th colspan="5">tb_chamado</th>
    </tr>
    <tr>
      <th colspan="2">Tabelas Relacionadas</th>
      <td colspan="3">tb_compra</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Campo</th>
      <th>Tipo</th>
      <th>Tamanho</th>
      <th>Extra</th>
      <th>Descrição</th>
    </tr>
    <tr>
      <td>id_chamado</td>
      <td>INT</td>
      <td>-</td>
      <td>PRIMARY KEY, AUTO_INCREMENT</td>
      <td>ID numérico auto incrementavel</td>
    </tr>
    <tr>
      <td>titulo_chamado</td>
      <td>VARCHAR</td>
      <td>60</td>
      <td>-</td>
      <td>Título do chamado que será exibido ao administrador</td>
    </tr>
    <tr>
      <td>status_chamado</td>
      <td>VARCHAR</td>
      <td>25</td>
      <td>-</td>
      <td>Status do chamado (Aberto, Em Andamento, Fechado)</td>
    </tr>
    <tr>
      <td>data_hora_abertura_chamado</td>
      <td>DATETIME</td>
      <td>-</td>
      <td>-</td>
      <td>Data e hora que o chamado foi aberto</td>
    </tr>
    <tr>
      <td>data_hora_fechamento_chamado</td>
      <td>DATETIME</td>
      <td>-</td>
      <td>-</td>
      <td>Data e hora que o chamado foi encerrado</td>
    </tr>
    <tr>
      <td>fk_compra</td>
      <td>INT</td>
      <td>-</td>
      <td>FOREIGN KEY</td>
      <td>Chave estrangeira referenciando o campo {id_compra} da tabela {tb_compra}</td>
    </tr>
  </tbody>
</table>
<br>

<h3>• Tabela Negociação</h3>
<p>Tabela responsável pelos chamados de negociação entre clientes e o administrador, onde ambos negociaram um determinado produto em um determinado serviço (venda ou conserto). Cada negociação pode ser feira por um usuário, sendo que cada usuário pode fazer várias negociações. A negociação também trata de um produto, sendo que cada produto possui apenas uma negociação relacionada.</p>

<table align="center">
  <thead>
    <tr>
      <th colspan="5">Nome da Tabela</th>
    </tr>
    <tr>
      <th colspan="5">tb_negociacao</th>
    </tr>
    <tr>
      <th colspan="2">Tabelas Relacionadas</th>
      <td colspan="3">tb_usuario, tb_produto</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Campo</th>
      <th>Tipo</th>
      <th>Tamanho</th>
      <th>Extra</th>
      <th>Descrição</th>
    </tr>
    <tr>
      <td>id_negociacao</td>
      <td>INT</td>
      <td>-</td>
      <td>PRIMARY KEY, AUTO_INCREMENT</td>
      <td>ID numérico auto incrementavel</td>
    </tr>
    <tr>
      <td>titulo_negociacao</td>
      <td>VARCHAR</td>
      <td>60</td>
      <td>-</td>
      <td>Titulo da negociação que será exibida ao administrador</td>
    </tr>
    <tr>
      <td>detalhamento_negociacao</td>
      <td>VARCHAR</td>
      <td>255</td>
      <td>-</td>
      <td>Detalhamento da negociação</td>
    </tr>
    <tr>
      <td>tipo_negociacao</td>
      <td>BINARY</td>
      <td>-</td>
      <td>-</td>
      <td>Tipo da negociação (Venda ou Conserto)</td>
    </tr>
    <tr>
      <td>status_negociacao</td>
      <td>VARCHAR</td>
      <td>25</td>
      <td>-</td>
      <td>Status da negociação (Aberto, Em Andamento, Fechado)</td>
    </tr>
    <tr>
      <td>data_hora_abertura_negociacao</td>
      <td>DATETIME</td>
      <td>-</td>
      <td>-</td>
      <td>Data e hora que a negociação foi aberta</td>
    </tr>
    <tr>
      <td>data_hora_fechamento_negociacao</td>
      <td>DATETIME</td>
      <td>-</td>
      <td>-</td>
      <td>Data e hora que a negociação foi encerrada</td>
    </tr>
    <tr>
      <td>valor_negociacao</td>
      <td>DECIMAL</td>
      <td>(8,2)</td>
      <td>-</td>
      <td>Valor acordado entre o Administrador e o Cliente</td>
    </tr>
    <tr>
      <td>fk_cliente</td>
      <td>INT</td>
      <td>-</td>
      <td>FOREIGN KEY</td>
      <td>Chave estrangeira referenciando o campo {id_usuario} da tabela {tb_usuario}</td>
    </tr>
    <tr>
      <td>fk_produto</td>
      <td>INT</td>
      <td>-</td>
      <td>FOREIGN KEY</td>
      <td>Chave estrangeira referenciando o campo {id_produto} da tabela {tb_produto}</td>
    </tr>
  </tbody>
</table>
<br>

<h2>🚧 Em Construção 🚧</h2>
