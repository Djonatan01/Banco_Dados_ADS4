/*1.1*/
SELECT DESC_PROD, UNIDADE, VALOR_PROD FROM Produto 

/*1.2*/
select * FROM Vendedor v

/*1.3 - A*/
SELECT NOME_CLI, Cidade from cliente c 
WHERE Cidade  = 'Curitiba' 

SELECT Quantidade 
FROM Itens_pedido
WHERE Quantidade > 20

/*1.3 - B*/
SELECT * FROM Produto p 
WHERE  Unidade = 'kg' and Valor_PROD = '1.40'

/*1.3 - C*/
SELECT Cod_PROD, DESC_PROD, Valor_PROD  FROM Produto p 
WHERE Valor_PROD BETWEEN '0.32' and '2.50'

/*1.3 - D*/
SELECT * FROM Produto p 
WHERE Unidade LIKE 'k%'

SELECT *  FROM  Vendedor v 
WHERE CHAR_LENGTH(Nome_VEND) =9

/*1.3 - E*/
SELECT * FROM Vendedor 
WHERE faixa_comissao IN ('A','B')

/*1.3 - F*/
SELECT * FROM cliente c 
WHERE InscE IS NULL

/*1.4*/
SELECT Nome_VEND ,Salario  FROM Vendedor
ORDER BY Nome_VEND ASC 

SELECT Desc_PROD ,Valor_PROD  FROM Produto
WHERE Unidade LIKE 'k%'
ORDER BY Valor_PROD DESC 

/*PARTE 2 - 1*/
SELECT Nome_CLI  FROM cliente c
ORDER BY Nome_CLI ASC 
/*Não. Porque foram cadastrados por ordem de chegada*/

/*PARTE 2 - 2*/
SELECT Nome_CLI FROM cliente c 
WHERE Fone is NULL 
/* vazio*/

/*PARTE 2 - 3*/
SELECT * FROM cliente c 
WHERE Cidade = 'Fortaleza' 
AND Nome_CLI LIKE 'J%'

/*PARTE 2 - 4*/
SELECT Desc_PROD,Valor_PROD FROM Produto  

/*PARTE 2 - 5*/
SELECT Desc_PROD FROM Produto p 
WHERE Unidade LIKE 'K%'


/*PARTE 2 - 6*/
SELECT * FROM Vendedor v 
WHERE faixa_comissao IN ('B','C')
AND Salario > 200

/*PARTE 2 - 7*/
SELECT Num_PED FROM Itens_pedido ip
WHERE Quantidade > 10 AND Quantidade < 30 

/*PARTE 2 - 8*/
select * from Vendedor 
where Nome_VEND like 'j%' 
and faixa_comissao not in ('c')

/*1.5*/
select * , Salario [sal], Salario = ((Salario / 100) * 15)+Salario 
from Vendedor     









