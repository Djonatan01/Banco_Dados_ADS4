CREATE DATABASE P2_FINAL;
USE P2_FINAL;

CREATE TABLE EXTRATO (
	idExtrato INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
	dtComp date,
	status VARCHAR(10),
	idLancamento INTEGER,
	descExtrato varchar(100)
);

CREATE  TABLE FILIAL(
	idFilial INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nomeFilial varchar(100),
	endFilial varchar(100),
	contFilial varchar(100),
	CNPJFilial varchar(15),
	idMatriz INTEGER
);

CREATE TABLE MATRIZ(
	idMatriz INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nomeMatriz varchar(100),
	endMatriz varchar(100),
	contMatriz varchar(100),
	CNPJMatriz varchar(15)
);

CREATE Table BANCO(
	idBanco INTEGER PRIMARY KEY NOT NULL,
	nomeBanco VARCHAR(100)
);

CREATE Table AGENCIA(
	idAgencia INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
	numeroAgencia INTEGER,
	idBanco INTEGER
);

CREATE TABLE CLIFOR(
	idCliFor INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nomeCliFor VARCHAR(100),
	endCliFor VARCHAR(150),
	contatoCliFor VARCHAR(100),
	CPF_CNPJCliFor VARCHAR(15),	
	tipoCliFor VARCHAR(1)
);
CREATE TABLE NATOP(
	idNatOp INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
	descNatOp VARCHAR(100),
	tipoNatOp VARCHAR(1)
);

CREATE TABLE CONTASFORN(
	idContaForn INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
	idAgencia INTEGER,
	nContaForn INTEGER,
	idCliFor INTEGER
);

CREATE TABLE CONTASEMP(
	idContaEmp INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nContaEmp INTEGER,
	idAgencia INTEGER,
	idMatriz INTEGER,
	idFilial INTEGER

);
CREATE TABLE LANCAMENTOS(
	idLancamento INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
	dtVenc DATE,
	dtEmissao DATE,
	idMatriz INTEGER,
	idFilial INTEGER,
	idCliFor INTEGER,	
	idNatop INTEGER,	
	StatusLancamento VARCHAR(2),
	tipoConta VARCHAR(10),
	descLancamento varchar(100)
);

ALTER TABLE `LANCAMENTOS`
ADD CONSTRAINT FK_LANC_MATRIZ FOREIGN KEY (idMatriz) REFERENCES `MATRIZ`(idMatriz);

ALTER TABLE `LANCAMENTOS`
ADD CONSTRAINT FK_LANC_FILIAL FOREIGN KEY (idFilial) REFERENCES `FILIAL`(idFilial);

ALTER TABLE `LANCAMENTOS`
ADD CONSTRAINT FK_LANC_CLI_FOR FOREIGN KEY (idCliFor) REFERENCES `CLIFOR`(idCliFor);

ALTER TABLE `LANCAMENTOS`
ADD CONSTRAINT FK_LANC_NATOP FOREIGN KEY (idNatOp) REFERENCES `NATOP`(idNatOp);

ALTER TABLE `EXTRATO`
ADD CONSTRAINT FK_EXTRATO_LANC FOREIGN KEY (idLancamento) REFERENCES `LANCAMENTOS`(idLancamento);

ALTER TABLE `FILIAL`
ADD CONSTRAINT FK_MATRIZ FOREIGN KEY (idMatriz) REFERENCES `MATRIZ`(idMatriz);

ALTER TABLE `CONTASEMP`
ADD CONSTRAINT FK_EMP_AG FOREIGN KEY (idAgencia) REFERENCES `AGENCIA`(idAgencia);

ALTER TABLE `CONTASEMP`
ADD CONSTRAINT FK_EMP_MATRIZ FOREIGN KEY (idMatriz) REFERENCES `MATRIZ`(idMatriz);

ALTER TABLE `CONTASEMP`
ADD CONSTRAINT FK_EMP_FILIAL FOREIGN KEY (idFilial) REFERENCES `FILIAL`(idFilial);

ALTER TABLE `CONTASFORN`
ADD CONSTRAINT FK_FORN_AG FOREIGN KEY (idAgencia) REFERENCES `AGENCIA`(idAgencia);

ALTER TABLE `CONTASFORN`
ADD CONSTRAINT FK_FORN_CLIFOR FOREIGN KEY (idCliFor) REFERENCES `CLIFOR`(idCliFor);

ALTER TABLE `AGENCIA` 
ADD CONSTRAINT FK_AG_BANCO FOREIGN KEY (idBanco) REFERENCES `BANCO`(idBanco);

-- Inserir dados na tabela MATRIZ
INSERT INTO MATRIZ (nomeMatriz, endMatriz, contMatriz, CNPJMatriz)
VALUES ('Matriz A', 'Endereço Matriz A', 'Contato Matriz A', 'CNPJ Matriz A'),
       ('Matriz B', 'Endereço Matriz B', 'Contato Matriz B', 'CNPJ Matriz B');
      
-- Inserir dados na tabela FILIAL
INSERT INTO FILIAL (nomeFilial, endFilial, contFilial, CNPJFilial, idMatriz)
VALUES ('Filial A', 'Endereço Filial A', 'Contato Filial A', 'CNPJ Filial A', 1),
       ('Filial B', 'Endereço Filial B', 'Contato Filial B', 'CNPJ Filial B', 1),
       ('Filial C', 'Endereço Filial C', 'Contato Filial C', 'CNPJ Filial C', 2);


-- Inserir dados na tabela BANCO
INSERT INTO BANCO (idBanco,nomeBanco)
VALUES ('0030','Banco A'),
       ('0256','Banco B');

-- Inserir dados na tabela AGENCIA
INSERT INTO AGENCIA (numeroAgencia, idBanco)
VALUES (1234, 0030),
       (5678, 0256);

-- Inserir dados na tabela CLIFOR
INSERT INTO CLIFOR (nomeCliFor, endCliFor, CPF_CNPJCliFor, tipoCliFor)
VALUES ('Cliente 1', 'Endereço Cliente 1', 'CPF Cli 1', 'C'),
       ('Fornecedor 1', 'Endereço Fornecedor 1', 'CNPJ Forn 1', 'F'),
       ('Ambos 1', 'Endereço Ambos 1', 'CPF Ambos 1', 'A');

-- Inserir dados na tabela NATOP
INSERT INTO NATOP (descNatOp, tipoNatOp)
VALUES ('Operação 1', 'R'),
       ('Operação 2', 'D');

-- Inserir dados na tabela CONTASFORN
INSERT INTO CONTASFORN (idAgencia, nContaForn, idCliFor)
VALUES (1, 123456, 1),
       (2, 789012, 2),
       (2, 423432, 3);

-- Inserir dados na tabela CONTASEMP
INSERT INTO CONTASEMP (nContaEmp, idAgencia, idMatriz, idFilial)
VALUES (111111, 1, 1, 1),
       (222222, 2, 2, 2);     

-- Inserir dados na tabela LANCAMENTOS
INSERT INTO LANCAMENTOS (dtVenc, dtEmissao, idMatriz, idFilial, idCliFor, idNatOp, StatusLancamento, tipoConta, descLancamento)
VALUES ('2023-01-01', '2023-01-01', 1, 1, 1, 1, 'NC', 'Receber','Lançamento 1'),
       ('2023-02-01', '2023-02-01', 1, 2, 2, 2, 'C', 'Pagar', 'Lançamento 2'),
       ('2023-03-01', '2023-03-01', 2, 3, 2, 2, 'NC', 'Pagar', 'Lançamento 3');

-- Inserir dados na tabela EXTRATO
INSERT INTO EXTRATO (dtComp, status, idLancamento, descExtrato)
VALUES ('2023-01-01', 'C',1, 'Lançamento 1'),
       ('2023-02-01', 'C',2, 'Lançamento 2'),
       ('2023-03-01', 'NC',3, 'Lançamento 3');
      
-- Criação View Contas a Pagar
CREATE VIEW CONTAS_PAGAR AS(
SELECT
	l.dtVenc as DATA_VENCIMENTO,
	l.dtEmissao as DATA_EMISSÃO,
	m.nomeMatriz as MATRIZ,
	f.nomeFilial as FILIAL,
	c.nomeCliFor as CLIENTE_FORNECEDOR,	
	n.descNatOp as NATUREZA_OPERAÇÃO,
	e.idextrato as ID_EXTRATO,
	l.StatusLancamento as STATUS,
	l.tipoConta as TIPO_CONTA
FROM LANCAMENTOS l
INNER JOIN MATRIZ m 
ON l.idMatriz = m.idMatriz
INNER JOIN FILIAL f 
ON l.idFilial = f.idFilial
INNER JOIN CLIFOR c 
ON l.idCliFor = c.idCliFor
INNER JOIN NATOP n 
ON l.idNatop = n.idNatOp
INNER JOIN EXTRATO e
ON l.idLancamento = e.idLancamento
WHERE tipoConta = 'Pagar'
);

-- Criação View Contas a Receber
CREATE VIEW CONTAS_RECEBER AS(
SELECT
	l.dtVenc as DATA_VENCIMENTO,
	l.dtEmissao as DATA_EMISSÃO,
	m.nomeMatriz as MATRIZ,
	f.nomeFilial as FILIAL,
	c.nomeCliFor as CLIENTE_FORNECEDOR,	
	n.descNatOp as NATUREZA_OPERAÇÃO,
	e.idextrato as ID_EXTRATO,
	l.StatusLancamento as STATUS,
	l.tipoConta as TIPO_CONTA
FROM LANCAMENTOS l
INNER JOIN MATRIZ m 
ON l.idMatriz = m.idMatriz
INNER JOIN FILIAL f 
ON l.idFilial = f.idFilial
INNER JOIN CLIFOR c 
ON l.idCliFor = c.idCliFor
INNER JOIN NATOP n 
ON l.idNatop = n.idNatOp
INNER JOIN EXTRATO e
ON l.idLancamento = e.idLancamento
WHERE tipoConta = 'Receber'
);

-- Criação View Contas de Fornecedores
CREATE VIEW CONTA_FORNECEDOR AS (
SELECT
	cli.nomeCliFor as NOME_FORNECEDOR,
	cont.nContaForn as CONTA,
	ag.numeroAgencia as AGENCIA,
	bank.nomeBanco as BANCO
FROM CLIFOR cli
INNER JOIN CONTASFORN cont 
ON cli.idCliFor = cont.idCliFor
INNER JOIN AGENCIA ag 
ON cont.idAgencia = ag.idAgencia
INNER JOIN BANCO bank 
ON ag.idBanco = bank.idBanco
WHERE tipoCliFor = 'F' OR tipoCliFor = 'A'
);

-- Criação View Consolidação extrato de caixa
CREATE VIEW CONSOLIDACAO AS (
SELECT
	l.idLancamento as ID_LANÇAMENTO,
	l.StatusLancamento as STATUS_LANÇAMENTO,
	e.idExtrato as ID_EXTRATO,
	e.status as STATUS_EXTRATO
FROM LANCAMENTOS l
INNER JOIN EXTRATO e 
ON l.idLancamento = e.idLancamento
);

CREATE TRIGGER cadastroExtrato AFTER INSERT
ON LANCAMENTOS
FOR EACH ROW
BEGIN
	DECLARE _idLancamento INTEGER;
	DECLARE _Status VARCHAR(10);
	DECLARE  _descLancamento VARCHAR(100);
	SET _idLancamento = (SELECT l.idLancamento FROM LANCAMENTOS l ORDER BY l.idLancamento DESC LIMIT 1);
	SET _Status = (SELECT l.StatusLancamento FROM LANCAMENTOS l ORDER BY l.idLancamento DESC LIMIT 1);
	SET _descLancamento = (SELECT l.descLancamento FROM LANCAMENTOS l ORDER BY l.idLancamento DESC LIMIT 1);
	INSERT INTO EXTRATO (dtComp,status,idLancamento,descExtrato)
	VALUES(null,_Status,_idLancamento, _descLancamento);
END;

CREATE PROCEDURE cadastroLancamento(IN _dtVenc DATE, IN _dtEmissao DATE, IN _idMatriz INTEGER, IN _idFilial INTEGER,
IN _idCliFor INTEGER, IN _idNatOp INTEGER, IN _StatusLancamento VARCHAR(10), IN _tipoConta VARCHAR(10), 
IN _descLancamento VARCHAR(100))
BEGIN 
	INSERT INTO LANCAMENTOS (dtVenc,dtEmissao,idMatriz,idFilial,idCliFor,idNatOp,StatusLancamento,tipoConta,descLancamento)
	VALUES (_dtVenc,_dtEmissao,_idMatriz,_idFilial,_idCliFor,_idNatOp,_StatusLancamento,_tipoConta,_descLancamento);	
END;

CREATE PROCEDURE cadastroCliFor(IN _nomeCliFor VARCHAR(100),IN _endCliFor VARCHAR(150),IN _CPF_CNPJCliFor VARCHAR(15),
IN _contatoCliFor VARCHAR(20),IN _numeroContaCliFor INTEGER, IN _numeroAgencia INTEGER, IN _idBanco INTEGER, IN _tipoCliFor VARCHAR(1))
BEGIN	
	DECLARE agExistente INTEGER;
	DECLARE bankExistente INTEGER;
	DECLARE cliForExistente INTEGER;
	DECLARE _idAgencia INTEGER;
	DECLARE _idCliFor INTEGER;
	
	SELECT count(*) INTO bankExistente 
    FROM BANCO b
    WHERE idBanco = _idBanco;
   
  	SELECT count(*) INTO agExistente 
    FROM AGENCIA a
    WHERE numeroAgencia = _numeroAgencia;
   	
   	SELECT COUNT(*) INTO cliForExistente
   	FROM CLIFOR c
	WHERE c.CPF_CNPJCliFor = _CPF_CNPJCliFor;
	
	IF (_tipoCliFor = 'C') THEN
		IF (cliForExistente = 0) THEN
    		INSERT INTO CLIFOR (nomeCliFor,endCliFor,contatoCliFor,CPF_CNPJCliFor,tipoCliFor) VALUES(_nomeCliFor,_endCliFor,_contatoCliFor,_CPF_CNPJCliFor,_tipoCliFor);
   			SELECT "CLIENTE CADASTRADO COM SUCESSO" AS MSG;
   		ELSE
   			SET _tipoClifor = (SELECT c.tipoClifor FROM CLIFOR c WHERE CPF_CNPJCliFor = _CPF_CNPJCliFor);
   			IF (_tipoClifor = 'C' OR _tipoClifor = 'A' ) THEN
   				SELECT "CLIENTE JÁ CADASTRADO" AS MSG;
   			ELSEIF(_tipoClifor = 'F') THEN
   				UPDATE CLIFOR SET tipoCliFor = 'A' WHERE CPF_CNPJCliFor = _CPF_CNPJCliFor;
   				SELECT "CLIENTE ATUALIZADO COM SUCESSO" AS MSG;
   			END IF;
   		END IF;
   	ELSE 
   		IF (bankExistente = 0) THEN
   			SELECT "BANCO NÃO CADASTRADO" AS MSG;
   		ELSE 
   			IF (agExistente = 0) THEN
    			INSERT INTO AGENCIA (numeroAgencia, idBanco) VALUES(_numeroAgencia, _idBanco);     	
    		END IF;
    		SET _idAgencia = (SELECT a.idAgencia FROM AGENCIA a WHERE numeroAgencia = _numeroAgencia);
    		IF (cliForExistente = 0) THEN
    			INSERT INTO CLIFOR (nomeCliFor,endCliFor,contatoCliFor,CPF_CNPJCliFor,tipoCliFor) VALUES(_nomeCliFor,_endCliFor,_contatoCliFor,_CPF_CNPJCliFor,_tipoCliFor);
   				SET _idCliFor = (SELECT c.idClifor FROM CLIFOR c ORDER BY c.idClifor DESC LIMIT 1);
   				INSERT INTO CONTASFORN(idAgencia,nContaForn,idCliFor)VALUES(_idAgencia,_numeroContaCliFor,_idCliFor);
   				SELECT "FORNECEDOR CADASTRADO COM SUCESSO1" AS MSG;
   			ELSE
   				SET _tipoClifor = (SELECT c.tipoClifor FROM CLIFOR c WHERE CPF_CNPJCliFor = _CPF_CNPJCliFor);
   				IF  (_tipoCliFor != 'A') THEN
   					UPDATE CLIFOR SET tipoCliFor = 'A' WHERE CPF_CNPJCliFor = _CPF_CNPJCliFor;   			
   					SET _idCliFor = (SELECT c.idClifor FROM CLIFOR c WHERE CPF_CNPJCliFor = _CPF_CNPJCliFor);
   					INSERT INTO CONTASFORN(idAgencia,nContaForn,idCliFor)VALUES(_idAgencia,_numeroContaCliFor,_idCliFor);
   					SELECT "FORNECEDOR CADASTRADO COM SUCESSO2" AS MSG;
   				ELSE
   					SELECT "FORNECEDOR JÁ CADASTRADO" AS MSG;
   				END IF;
   			END IF;
   		END IF;
   	END IF;
END;


CREATE PROCEDURE CadastroMatrizFilial(IN _nomeFilial VARCHAR(100),
_endFilial varchar(100),_contFilial varchar(100),_CNPJFilial varchar(15),
_nomeMatriz varchar(100),_endMatriz varchar(100),_contMatriz varchar(100),_CNPJMatriz varchar(15))
BEGIN
	DECLARE matrizExistente INTEGER;
	DECLARE	filialExistente INTEGER;
	DECLARE _idMatriz INTEGER; 
	
	SELECT COUNT(*) INTO matrizExistente
	FROM MATRIZ m 
	WHERE m.CNPJMatriz = _CNPJMatriz;
	
	SELECT COUNT(*) INTO filialExistente
	FROM FILIAL f 
	WHERE f.CNPJFilial = _CNPJFilial; 
	
	IF (matrizExistente = 0) THEN
		-- Inserir dados na tabela MATRIZ
		INSERT INTO MATRIZ (nomeMatriz, endMatriz, contMatriz, CNPJMatriz)
		VALUES (_nomeMatriz, _endMatriz, _contMatriz, _CNPJMatriz);
		SELECT "MATRIZ CADASTRADA COM SUCESSO" AS MSG;
	END IF;

	SET _idMatriz = (SELECT  m.idMatriz FROM MATRIZ m WHERE CNPJMatriz = _CNPJMatriz);

	IF (_nomeFilial != "") THEN
		IF (filialExistente = 0) THEN
			-- Inserir dados na tabela FILIAL
			INSERT INTO FILIAL (nomeFilial, endFilial, contFilial, CNPJFilial, idMatriz)
			VALUES (_nomeFilial, _endFilial,_contFilial, _CNPJFilial, _idMatriz);
			SELECT "FILIAL CADASTRADA COM SUCESSO" AS MSG;
		ELSE 
			SELECT "FILIAL JÁ CADASTRADA" AS MSG;
		END IF;
	END IF;
END;

CALL CadastroMatrizFilial ('Filial D','Rua 10','(12)3144-0000','34426386000110',
'Matriz D', 'RUA 15', '(12)31440000', '57314806000171');

CALL cadastroLancamento('2023-04-01', '2023-04-01', 2, 2, 2, 1, 'NC', 'Receber', 'Lançamento teste1');

CALL cadastroCliFor('TESTE5', 'RUA TESTE5', '04293483000115', '12988070599',NULL, NULL, NULL, 'C');

CALL cadastroCliFor('TESTE5', 'RUA TESTE5', '04293483000115', '12988070599', '6437267','7898', '256', 'F');

CALL cadastroCliFor('TESTE6', 'RUA TESTE6', '04293483000116', '12988070596', '6437266','7896', '256', 'F');

CALL cadastroCliFor('TESTE6', 'RUA TESTE6', '04293483000116', '12988070596', NULL, NULL, NULL, 'C');

SELECT * FROM CLIFOR 

SELECT * FROM CONTASFORN

SELECT * FROM LANCAMENTOS

SELECT * FROM EXTRATO