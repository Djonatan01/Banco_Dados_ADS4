/*Código realizado no MariaDB*/
CREATE DATABASE ex05_l1

CREATE TABLE fabricante(
codFab int PRIMARY KEY NOT NULL,
cnpjFab varchar(14),
nomeFab varchar(200),
enderecoFab varchar(200)
)

CREATE TABLE produto(
codProd int PRIMARY KEY,
nomeComProd varchar(200),
tipoEmbProd varchar(200),
qdtProd int,
precoUniProd float,
codFab int
)

CREATE TABLE medicamento(
codMed int PRIMARY KEY,
tarjaMed varchar(100),
formulaMed varchar(100),
codProd int
)

CREATE TABLE perfumaria(
codPer int PRIMARY KEY,
tipoPer varchar(100),
codProd int
)

CREATE TABLE venda(
codVen int PRIMARY KEY,
dataVen date,
nomeCliVen varchar(200),
cidadeCliVen varchar(200)
)

CREATE TABLE perfumariaVenda(
codPerVen int PRIMARY KEY,
qdtPerVen int,
impostoPerVen float,
codPer int,
codVen int
)

CREATE TABLE medicamentoReceitaVenda(
codMedVen int PRIMARY KEY NOT NULL,
qdtMedVen int,
impostoMedVen float,
codMed int,
codVen int,
codRecMed int
)

CREATE TABLE receitaMedica(
codRecMed int PRIMARY KEY,
CRMRecMed varchar(100),
dataRecMed date
)

ALTER TABLE produto
ADD CONSTRAINT FK_FAB_PROD FOREIGN KEY (codFab) REFERENCES fabricante(codFab)

ALTER TABLE medicamento
ADD CONSTRAINT FK_PROD_MED FOREIGN KEY (codProd) REFERENCES produto(codProd)

ALTER TABLE perfumaria
ADD CONSTRAINT FK_PROD_PER FOREIGN KEY (codProd) REFERENCES produto(codProd)

ALTER TABLE medicamentoReceitaVenda
ADD CONSTRAINT FK_MED_MEDRECVEN FOREIGN KEY (codMed) REFERENCES medicamento(codMed)

ALTER TABLE medicamentoReceitaVenda
ADD CONSTRAINT FK_VEN_MEDRECVEN FOREIGN KEY (codVen) REFERENCES venda(codVen)

ALTER TABLE medicamentoReceitaVenda
ADD CONSTRAINT FK_RECMED_MEDRECVEN FOREIGN KEY (codRecMed) REFERENCES receitaMedica(codRecMed)

ALTER TABLE perfumariaVenda
ADD CONSTRAINT FK_PER_PERVEN FOREIGN KEY (codPer) REFERENCES perfumaria(codPer)

ALTER TABLE perfumariaVenda
ADD CONSTRAINT FK_VEN_PERVEN FOREIGN KEY (codVen) REFERENCES venda(codVen)


