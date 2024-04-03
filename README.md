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
     <td align="center"><a href="https://github.com/AmandaCupolaa"><img style="border-radius: 50%;" src="https://avatars.githubusercontent.com/u/125586676?v=4" width="100px;" alt=""/><br /><sub><b>Amanda Cupola</b></sub></a><br /></td>
    <td align="center"><a href="https://github.com/danielandrade108"><img style="border-radius: 50%;" src="https://avatars.githubusercontent.com/u/125586786?v=4" width="100px;" alt=""/><br /><sub><b>Daniel Andrade</b></sub></a><br /></td>
    <td align="center"><a href="https://github.com/Davi-Hilario"><img style="border-radius: 50%;" src="https://avatars.githubusercontent.com/u/125586338?v=4" width="100px;" alt=""/><br /><sub><b>Davi Alexandre de Souza Hilário</b></a><br /></td>
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
    <td>A criação das tabelas deve sempre incluir a cláusula "IF NOT EXISTS" para checar se a tabela existe. Além disso, todas o nome das tabelas sempre deve começar com "tb", seguido pelo restante do nome da tabela, utilizando do padrão snake case.</td>
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
    <td>Atributos com nome composto devem seguir o padrão snake_case para serem definidos.</td>
  </tr>
</table>

```sql
      CREATE TABLE IF NOT EXISTS tb_exemplo_tabela
      (
          id INT PRIMARY KEY AUTO_INCREMENT,
          nome VARCHAR(60),
          data_nasc DATE
      );
```
<br>

<table align="center">
  <tr> 
    <td>Atributos Foreign Key</td>
    <td>Atributos do tipo Chave Estrangeira devem sempre começar com "fk" e seguir o padrão de snake case. O último nome do atributo deve fazer referência a sua tabela original.</td>
  </tr>
</table>

```sql
      CREATE TABLE IF NOT EXISTS tb_exemplo_tabela
      (
          id INT PRIMARY KEY AUTO_INCREMENT,
          nome VARCHAR(60),
          data_nasc DATE,
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
      <td colspan="3">tb_login, tb_login, tb_click_produto</td>
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
      <td>id</td>
      <td>INT</td>
      <td>-</td>
      <td>PRIMARY KEY, AUTO_INCREMENT</td>
      <td>ID numérico auto incrementável</td>
    </tr>
    <tr>
      <td>nome</td>
      <td>VARCHAR</td>
      <td>100</td>
      <td>NOT NULL</td>
      <td>Nome do usuário</td>
    </tr>
    <tr>
      <td>email</td>
      <td>VARCHAR</td>
      <td>255</td>
      <td>NOT NULL</td>
      <td>Email do usuário. Deve conter pelo menos um "@" e um "."</td>
    </tr>
    <tr>
      <td>telefone</td>
      <td>VARCHAR</td>
      <td>14</td>
      <td>-</td>
      <td>Telefone do usuário, podendo incluir ou não os parênteses e outros símbolos</td>
    </tr>
    <tr>
      <td>cep</td>
      <td>CHAR</td>
      <td>9</td>
      <td>-</td>
      <td>Cep do usuário. Deve seguir o formato "99999-999"</td>
    </tr>
    <tr>
      <td>categoria</td>
      <td>TINYINT</td>
      <td>1</td>
      <td>-</td>
      <td>Informa se o usuário é um Cliente ou um Administrador. Clientes possuem acesso apenas ao site da loja, enquanto o Administrador possui acesso ao          produto Volt, com um site único onde ele poderá manejar o controle de estoque e atendimento ao cliente de forma mais eficaz.</td>
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
      <td>id</td>
      <td>CHAR</td>
      <td>36</td>
      <td>PRIMARY KEY</td>
      <td>ID </td>
    </tr>
    <tr>
      <td>email</td>
      <td>VARCHAR</td>
      <td>255</td>
      <td>NOT NULL, UNIQUE</td>
      <td>Email utilizado no login.</td>
    </tr>
    <tr>
      <td>senha_login</td>
      <td>VARCHAR</td>
      <td>16</td>
      <td>NOT NULL, UNIQUE</td>
      <td>Senha do usuário. Deve ter no mínimo 8 caracteres e no máximo 16.</td>
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

<h3>• Tabela Produto</h3>
<p>Tabela responsável pelo armazenamento dos produtos, tanto os que serão catalogados na loja quanto os que serão fornecidos ao administrador para conserto ou venda. O produto pode ter várias imagens, porém cada imagem pertence a apenas um produto.</p>

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
      <td colspan="3">tb_click_produto, tb_classificacao_produto, tb_imagem_produto</td>
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
      <td>id</td>
      <td>INT</td>
      <td>-</td>
      <td>PRIMARY KEY, AUTO_INCREMENT</td>
      <td>ID numérico auto incrementável</td>
    </tr>
    <tr>
      <td>nome</td>
      <td>VARCHAR</td>
      <td>80</td>
      <td>-</td>
      <td>Nome do produto que será exibido/negociado</td>
    </tr>
    <tr>
      <td>descricao</td>
      <td>VARCHAR</td>
      <td>300</td>
      <td>-</td>
      <td>Descrição do produto que será exibido/negociado</td>
    </tr>
    <tr>
      <td>categoria</td>
      <td>VARCHAR</td>
      <td>100</td>
      <td>-</td>
      <td>Categoria do produto que será exibido/negociado</td>
    </tr>
    <tr>
      <td>preco</td>
      <td>DECIMAL</td>
      <td>(8,2)</td>
      <td>-</td>
      <td>Preço do produto. Não pode ser menor que 0.</td>
    </tr>
    <tr>
      <td>qtd_estoque</td>
      <td>INT</td>
      <td>-</td>
      <td>-</td>
      <td>Quantidade desse produto no estoque. Não pode ser menor que 0.</td>
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
      <td>id</td>
      <td>INT</td>
      <td>-</td>
      <td>PRIMARY KEY, AUTO_INCREMENT</td>
      <td>ID numérico auto incrementavel</td>
    </tr>
    <tr>
      <td>nome</td>
      <td>VARCHAR</td>
      <td>100</td>
      <td>-</td>
      <td>Nome da imagem a ser cadastrada.</td>
    </tr>
    <tr>
      <td>codigo_imagem</td>
      <td>BLOB</td>
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


<h3>• Tabela Tag Produto</h3>
<p>Tabela onde haverá as tag que serão relacionadas aos produtos. Uma tag pode relacionar vários produtos como um produto pode relacionar várias tags.</p>

<table align="center">
  <thead>
    <tr>
      <th colspan="5">Nome da Tabela</th>
    </tr>
    <tr>
      <th colspan="5">tb_tag_produto</th>
    </tr>
    <tr>
      <th colspan="2">Tabelas Relacionadas</th>
      <td colspan="3">tb_classificacao_produto</td>
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
      <td>id</td>
      <td>INT</td>
      <td>-</td>
      <td>PRIMARY KEY, AUTO_INCREMENT</td>
      <td>ID numérico auto incrementavel</td>
    </tr>
    <tr>
      <td>tag</td>
      <td>VARCHAR</td>
      <td>50</td>
      <td>-</td>
      <td>Nome da tag que será relacionada aos produtos</td>
    </tr>
  </tbody>
</table>
<br>


<h3>• Tabela Classificao Produto</h3>
<p>Tabela associativa entre as tabelas {tb_produto} e {tb_tag_produto}</p>

<table align="center">
  <thead>
    <tr>
      <th colspan="5">Nome da Tabela</th>
    </tr>
    <tr>
      <th colspan="5">tb_classificacao_produto</th>
    </tr>
    <tr>
      <th colspan="2">Tabelas Relacionadas</th>
      <td colspan="3">tb_produto, tb_tag_produto</td>
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
      <td>id</td>
      <td>INT</td>
      <td>-</td>
      <td>PRIMARY KEY, AUTO_INCREMENT</td>
      <td>ID numérico auto incrementavel</td>
    </tr>
    <tr>
      <td>fk_tag_produto</td>
      <td>INT</td>
      <td>-</td>
      <td>FOREIGN KEY</td>
      <td>Chave estrangeira referenciando o campo {id} da tabela {tb_tag_produto}</td>
    </tr>
    <tr>
      <td>fk_produto</td>
      <td>INT</td>
      <td>-</td>
      <td>FOREIGN KEY</td>
      <td>Chave estrangeira referenciando o campo {id} da tabela {tb_produto}</td>
    </tr>
  </tbody>
</table>
<br>


<h2>🚧 Em Construção 🚧</h2>
