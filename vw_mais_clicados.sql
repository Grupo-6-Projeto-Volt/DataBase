CREATE VIEW vwSelectMaisClicados AS
	SELECT p.id AS id, count(c.fk_produto) AS "qtd_clicks",
	p.nome AS "nome_produto" FROM tb_click_produto AS c JOIN 
    tb_produto AS p ON p.id = c.fk_produto
    GROUP BY c.fk_produto;
DROP view vwSelectMaisClicados;
SELECT * FROM vwSelectMaisClicados AS vw ORDER BY vw.qtd_clicks DESC;