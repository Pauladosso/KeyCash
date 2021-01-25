SELECT
	vm.id_bairro,
	vm.avg_valor_m2,
	nb.nome_bairro
FROM valor_medio AS vm
INNER JOIN tb_nome_bairros AS nb
ON vm.id_bairro = nb.id_bairro;