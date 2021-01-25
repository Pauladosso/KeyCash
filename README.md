# Desafio KeyCash 2021

## **Desafio 1**

Através do relational database service (RDS) da AWS, acessei/criei um banco de dados exclusivamente para este desafio.  

Seu acesso pode ser feito com as credenciais abaixo:

Host: keycash.cjnofhg95qvn.us-east-2.rds.amazonaws.com  
Porta: 5432  
Usuário: - 
Senha:  -
Banco: Keycash

O banco de dados permanecerá ativo até 15.02.

Inicialmente, para a resolução do Desafio 1, utilizei o client PgAdmin 4 v4 que permite a leitura de um arquivo csv com importação manual pelo próprio client.  

Você pode encontrar os arquivos no [Desafio1_imoveis](datasets/Desafio1_imoveis.csv) e [Desafio1_nome_bairros](datasets/Desafio1_nome_bairros.csv).
  
  **Desafio 1A:**  

  1. Calcular o valor do m²(Preço/área) por imóvel;  
  2. Calcular a média dovalor do m²para cada bairro;  
  3. Ordenar o resultado de forma decrescentee filtrando apenas os bairros com IDs iguais a 1 e 3;  
  4. A tabela resultante deve se chamar valor_medio;  
 
  A resolução da atividade A do desafio 1 pode ser encontrada no [Desafio1-sql](desafio1-sql/desafio1a.sql)  

```sql
CREATE TABLE valor_medio AS

SELECT
    id_bairro, 
    ROUND(AVG(preco/area_m2),2) as avg_valor_m2 
FROM id_bairrotb_imoveis
WHERE id_bairro in (1,3)
GROUP BY id_bairro
ORDER BY id_bairro DESC;
```
  
  **Desafio 1B:**  
  1. Trazer o nome do bairro (NOME_BAIRRO) da tabela Desafio1_nome_bairros para a tabela valor_medio, de acordo com a correspondência do ID_BAIRRO.  
  
A resolução da atividade B do desafio 1 pode ser encontrada no [desafio1-sql](desafio1-sql/desafio1b.sql)  

```sql
SELECT
    vm.id_bairro,
    vm.avg_valor_m2,
    nb.nome_bairro
FROM valor_medio AS vm
INNER JOIN tb_nome_bairros AS nb
ON vm.id_bairro = nb.id_bairro;
```

**A tabela resultante do desafio 1 pode ser vista abaixo:**

| id_bairro | avg_valor_m2 | nome_bairro |
|-----------|--------------|-------------|
| 1         | 8945.86      | Itaim Bibi  |
| 3         | 9313.50      | Pinheiros   |
|           |              |             |  

  
 ## **Desafio 2**

Para a resolução do desafio 2, utilizei o Jupyter-Notebook.  

O desafio consiste em criar um modelo de precificação com as informações da base de dados [Desafio2_input](datasets/Desafio2_input.csv) com auxílio de suas descrições [Descrição dos dados](datasets/Descrição_dos_dados.txt).  

Todo o desenvolvimento do modelo de precificação proposto pode ser encontrado comentado detalhadamente em [desafio2-python](desafio2-python/desafio2.ipynb).  


## Pontos de melhoria:  
  
Produtizar o modelo criado, através do Amazon SageMaker ou Amazon API Gateway, porém não consegui concluir a etapa bônus do desafio dentro do prazo.