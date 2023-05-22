/*EX 01 */;
create view CDs as (
select
	c.nomeCD as Nome_CD,
	c.produtor as Produtor,
	c.ano as Ano,
	c.estilo as Estilo,
	c.nr_faixas as Nr_Faixas,
	m.nomeMusica as Nome_Musica,
	c3.nomeComp as Nome_Compositor,
	c2.dataComp as Data_Composição,
	inter.nomeInt as Interprete,
	g.nomeGrav as Gravadoras
from	Musica_CD mc
inner join CD c 
on	c.idCD = mc.idCD
inner join Musica m 
on	mc.idMusica = m.idMusica
inner join Composicao c2
on	c2.idMusica = m.idMusica
inner join Compositor c3
on	c2.idComp = c3.idComp
inner join CantoresMusica cm 
on m.idMusica = cm.idMusica 
inner join Interprete inter 
on cm.idInt  = inter.idInt
INNER JOIN Gravadora g);

/*EX 02 */;
SELECT * from CDs c

desc CDs

/*U view 01*/;
SELECT Nome_CD,Nome_Musica,Interprete Gravadora  from CDs c;

/*U view 02*/;
SELECT Nome_Compositor,Nome_Musica FROM  CDs c 
order by Nome_Compositor;

/*U view 03*/;
SELECT Nome_CD,Nome_Musica,Interprete Gravadora  from CDs c;

/*U View 04 Não tem musicas nos últimos 10 anos*/
SELECT Nome_Musica,Data_Composição from CDs c
WHERE Data_Composição BETWEEN "2013-01-01" and "2023-01-01" 
order by Data_Composição; 
/* Fizemos uma logica com mais de 10 noas*/;
SELECT Nome_Musica,Data_Composição from CDs c
WHERE Data_Composição < "2013-01-01"
order by Data_Composição;

/*U view 05*/;
SELECT Nome_Musica from CDs c
WHERE Nome_Musica LIKE 'A%';

/*U view 06*/;
SELECT Nome_CD from CDs c
WHERE Gravadora = 'Universal';

/*U view 07*/;
SELECT Nome_Musica from CDs c
WHERE Interprete  = 'Zeca Pagodinho';

/*Usando Stored Procedures 01*/;
CREATE PROCEDURE cadastroComp(IN nomeCompositor VARCHAR(50))
BEGIN
 DECLARE registroExistente INTEGER;
  SELECT count(*) INTO registroExistente 
    FROM Compositor c
    WHERE nomeComp = nomeCompositor;
  IF (registroExistente > 0) THEN
    SELECT "COMPOSITOR JÁ CADASTRADO" AS MSG;
   ELSE 
   	INSERT INTO Compositor (nomeComp) VALUES (nomeCompositor);
     SELECT "CADASTRADO REALIZADO COM SUCESSO" AS MSG;
  END IF;
END

CALL cadastroComp("DIEGO"); 

SELECT * from Compositor c 

/*Usando Stored Procedures 01*/;

CREATE PROCEDURE cadastroComp(IN nomeCompositor VARCHAR(50))
BEGIN
 DECLARE registroExistente INTEGER;
  SELECT count(*) INTO registroExistente 
    FROM Compositor c
    WHERE nomeComp = nomeCompositor;
  IF (registroExistente > 0) THEN
    SELECT "COMPOSITOR JÁ CADASTRADO" AS MSG;
   ELSE 
   	INSERT INTO Compositor (nomeComp) VALUES (nomeCompositor);
     SELECT "CADASTRADO REALIZADO COM SUCESSO" AS MSG;
  END IF;
END

CALL cadastroComp("DIEGO"); 

/*Usando Stored Procedures 02*/;
CREATE PROCEDURE atualizarCd(IN SD_idCD INTEGER,
	SD_nomeCD VARCHAR(50),
	SD_produto VARCHAR(50),
	SD_ano INTEGER,
	SD_estilo VARCHAR(30),
	SD_nr_faixas INTEGER,
	SD_idGrav INTEGER)
BEGIN
  DECLARE registroExistente INTEGER;
  SET registroExistente = (SELECT COUNT(*) FROM CD c WHERE SD_idCD = c.idCD);
  IF (registroExistente > 0) THEN
  	UPDATE CD c 
  	SET c.nomeCD = SD_nomeCD,
  		c.produtor = SD_produto,
  		c.ano = SD_ano,
  		c.estilo = SD_estilo,
  		c.nr_faixas = SD_nr_faixas,
  		c.idGrav = SD_idGrav
  	WHERE idCD = SD_idCD;
    SELECT 'CD ATUALIZADO COM SUCESSO' AS MSG;
  ELSE  	
    SELECT 'REGISTRO NÃO ENCONTRADO' AS MSG;
  END IF;
END

CALL atualizarCd(2, 'Acustico MTV', 'Ze Branquinho', 2021, 'Samba', 12,4);

SELECT * FROM  CD c;
/*Usando Stored Procedures 03*/;
CREATE PROCEDURE ApagarMusica (IN SP_idMusica INTEGER,SP_nomeMusica  varchar(50))
BEGIN
	DECLARE registro INTEGER; 
	SET registro = (SELECT COUNT(*) FROM Musica M WHERE SP_idMusica = M.idMusica);
	  IF (registro > 0) THEN
	  	DELETE FROM Musica WHERE idMusica = SP_idMusica;	  	
	    SELECT 'MUSICA EXCLUIDA COM SUCESSO' AS MSG;
	  ELSE  	
	    SELECT 'REGISTRO NÃO ENCONTRADO' AS MSG;
	  END IF;
END

SELECT * from Musica m ;

insert into Musica (nomeMusica) values ('Sozinhas');

CALL ApagarMusica (12,'Sozinhas');







