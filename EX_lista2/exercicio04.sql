CREATE  DATABASE exercicio04;

CREATE TABLE produto(
	codProduto int NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nomeProduto varchar(200),
	qtdProduto int NOT NULL,
	valorProduto float NOT NULl
)

CREATE TABLE pessoa(
	codPessoa int NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nomePessoa varchar(200) NOT NULL ,
	endPessoa varchar(200) NOT NULL,
	tipoPessoa char(1) NOT NULL 
	)
	
create table NOTA_FISCAL(
	codNF int not null primary key,
	codProduto int not null,
	codFun int not null,
	codCli int not null,
	dataVen date not null,
	endEntregaNF varchar(200)
)

alter table exercicio04.NOTA_FISCAL ADD CONSTRAINT FK_CODIGO_PRODUTO FOREIGN KEY (codProduto) REFERENCES exercicio04.produto(codProduto)

alter table exercicio04.NOTA_FISCAL 
ADD CONSTRAINT FK_CODIGO_FUNCIONARIO 
FOREIGN KEY (codFun) references exercicio04.pessoa(codPessoa);

alter table exercicio04.NOTA_FISCAL 
ADD CONSTRAINT FK_CODIGO_FUNCIONARIO 
FOREIGN KEY (codCli) references exercicio04.pessoa(codPessoa);