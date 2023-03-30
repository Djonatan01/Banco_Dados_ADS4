create database exercicio01;

CREATE TABLE PROPRIETARIO (
    codProp int not null primary key AUTO_INCREMENT,
    nomeProp varchar(200) not null,
    habilitacaoProp varchar(10) not null
);

CREATE TABLE VEICULO(
    codVeiculo int not null primary key AUTO_INCREMENT,
    codProp int,
    codFabricante int not null,
    corVeiculo varchar(15) not null,
    modVeiculo varchar(50) not null,
    placaVeiculo varchar(8),
    anoModVeiculo date not null,
    anoFabVeiculo date not null,
    chassiVeiculo varchar(17)
);

CREATE TABLE FABRICANTE(
    codFabricante int not null primary key AUTO_INCREMENT,
    nomeFabricante varchar(50) not null
);

alter table veiculo add constraint fk_veiculo_fabricante foreign key (codFabricante) references FABRICANTE(codFabricante);

alter table veiculo add constraint fk_veiculo_proprietario foreign key (codprop) references PROPRIETARIO(codProp); 