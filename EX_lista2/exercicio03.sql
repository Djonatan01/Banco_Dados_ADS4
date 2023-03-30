CREATE DATABASE exercicio03;

CREATE TABLE pessoa(
codPes int PRIMARY KEY AUTO_INCREMENT,
nomePes varchar(200),
dtNasc date,
codFun int,
codDep int
)

CREATE TABLE funcionario(
codFun int PRIMARY KEY AUTO_INCREMENT
)

CREATE TABLE dependente(
codDep int PRIMARY KEY AUTO_INCREMENT,
codFun int
)

ALTER TABLE pessoa
ADD CONSTRAINT FK_PES_FUN FOREIGN KEY pessoa(codFun) REFERENCES funcionario(codFun)

ALTER TABLE pessoa
ADD CONSTRAINT FK_PES_DEP FOREIGN KEY pessoa(codDep) REFERENCES dependente(codDep)

ALTER TABLE dependente
ADD CONSTRAINT FK_DEP_FUN FOREIGN KEY dependete(codFun) REFERENCES funcionario(codFun)