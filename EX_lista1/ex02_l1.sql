
CREATE TABLE CIDADE(
codCid int PRIMARY KEY NOT NULL,
nomeCid varchar(200)
)

CREATE TABLE DISTRIBUIDOR(
codDist int PRIMARY KEY NOT NULL,
nomeDist varchar(200)
)

CREATE TABLE PRODUTO(
codProd int PRIMARY KEY NOT NULL,
nomeProd int
)

CREATE TABLE DISTRIBUICAO(
dataInicio datetime,
codCid int,
codDist int,
codProd int 
)


ALTER TABLE DISTRIBUICAO
ADD CONSTRAINT FK_CIDADE FOREIGN KEY (codCid) REFERENCES CIDADE(codCid)

ALTER TABLE DISTRIBUICAO
ADD CONSTRAINT FK_DISTRIBUIDOR FOREIGN KEY (codDist) REFERENCES DISTRIBUIDOR(codDist)

ALTER TABLE DISTRIBUICAO
ADD CONSTRAINT FK_PRODUTO FOREIGN KEY (codProd) REFERENCES PRODUTO(codProd)













