CREATE TABLE valor_medio AS 

SELECT
	id_bairro,
	ROUND(AVG(preco/area_m2),2) as avg_valor_m2
FROM
	tb_imoveis
WHERE id_bairro in (1,3)
GROUP BY id_bairro
ORDER BY id_bairro DESC