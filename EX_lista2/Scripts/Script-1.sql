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
SELECT Nome_VEND , ((Salario * 1.15) + 120) AS novo_salario_fixo
FROM Vendedor v 
WHERE faixa_comissao = 'C'
ORDER BY Nome_VEND;

/*1.6*/
SELECT MAX(Salario) as Maior_Salario , MIN(Salario) as Menor_salario 
FROM  Vendedor v; 

/*1.6.2*/
SELECT DISTINCT(Unidade) FROM Produto p 

/*1.6.3*/
SELECT  ip.Num_PED  as Numero_pedido, COUNT(ip.Cod_PROD) as Total_Produtos
FROM Itens_pedido ip 
WHERE ip.Num_PED 
GROUP BY ip.Num_PED 


/*2*/
SELECT p.Num_PED ,c.Nome_CLI 
FROM cliente c 
INNER JOIN Pedido p 
ON c.Cod_CLI  = p.Cod_CLI 

/*2.1*/
SELECT p.Num_PED ,c.Nome_CLI ,p.Data_PED ,p.prazo_entrega
FROM cliente c 
INNER JOIN Pedido p 
ON c.Cod_CLI  = p.Cod_CLI 
WHERE DATEDIFF(p.prazo_entrega ,p.Data_PED ) > 15
AND c.UF in ('PR' , 'CE')

/*2.2*/
SELECT p.Num_PED ,c.Nome_CLI , p.prazo_entrega , DATEDIFF(p.prazo_entrega ,p.Data_PED ) AS PRAZO_DE_ENTREGA
FROM cliente c 
INNER JOIN Pedido p 
ON c.Cod_CLI  = p.Cod_CLI 
ORDER BY PRAZO_DE_ENTREGA;

/*2.3*/
SELECT v.Nome_VEND as Nome_do_Vendedor
FROM Vendedor v  
INNER JOIN Pedido p 
ON v.Cod_VEND = p.Cod_VEND 
WHERE DATEDIFF(p.prazo_entrega ,p.Data_PED ) > 15 
AND v.Salario > 400
ORDER BY v.Nome_VEND ASC 


/*2.4*/
SELECT c.Nome_CLI  as Nome_do_Cliente ,p2.Desc_PROD 
FROM cliente c  
INNER JOIN Pedido p ON c.Cod_CLI = p.Cod_CLI 
INNER JOIN Itens_pedido ip ON ip.Num_PED = p.Num_PED  
INNER JOIN Produto p2 on p2.Cod_PROD =ip.Cod_PROD 
WHERE DATEDIFF(p.prazo_entrega ,p.Data_PED ) > 6 
AND c.UF IN ('PR')
AND p2.Desc_PROD IN ('Chocolate')
ORDER BY c.Nome_CLI ASC;


/*2.5*/
SELECT v.Nome_VEND as Nome_Vendedor ,p2.Desc_PROD ,ip.Quantidade 
FROM Vendedor v 
INNER JOIN Pedido p ON v.Cod_VEND =p.Cod_VEND 
INNER JOIN Itens_pedido ip ON ip.Num_PED = p.Num_PED  
INNER JOIN Produto p2 on p2.Cod_PROD =ip.Cod_PROD 
WHERE ip.Quantidade > 10
AND p2.Cod_PROD IN ('6')

/*2.6*/
SELECT v.Nome_VEND as Vendedor , COUNT(p.Cod_CLI) as Total_Cliente_Pedido
FROM Vendedor v
INNER JOIN Pedido p ON v.Cod_VEND = p.Cod_VEND 
WHERE v.Nome_VEND LIKE ('Andre%')

/*2.7*/
SELECT v.Nome_VEND as Vendedor , COUNT(p.Cod_CLI) as Total_Pedido_Cliente
FROM Vendedor v
INNER JOIN Pedido p ON v.Cod_VEND = p.Cod_VEND 
INNER JOIN cliente c ON c.Cod_CLI =p.Cod_CLI 
WHERE v.Nome_VEND LIKE ('Joaquim%') 
AND c.Cidade IN ('Curitiba','Fortaleza')















