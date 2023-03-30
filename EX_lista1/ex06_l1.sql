CREATE DATABASE locadoraveiculos

create table escritorio(
	codEscritorio int AUTO_INCREMENT NOT NULL primary key,
	numero int not null, 
	local_endereco varchar(250) not null
);
create table contrato_aluguel(
    codContrato INT AUTO_INCREMENT not null PRIMARY KEY, 
	codEscritorio int not null,
	codCliente int not null,
	dataContrato date not null,
	duracaoContrato int not null
);

create table cliente(
	codCliente int AUTO_INCREMENT not null primary key,
	nomeCliente varchar(250) not null,
	endereco varchar(250) not null,
	telefone varchar(25) not null,
	numCnhCliente varchar(25) not null,
	estadoCnh varchar(25) not null
);

create table veiculo(
	codVeiculo int AUTO_INCREMENT not null primary key,
    codTipoVeiculo int not null,
	codContrato int not null,
	dataManutencao date not null,
	placa varchar(7) not null
);

create table tipo_veiculo(
	codTipoVeiculo int PRIMARY KEY AUTO_INCREMENT,
	codAutomovel int not null,
	codOnibus int not null,
	nomeVeiculo varchar(25) not null,
	arCondicionado bit not null
);

create table automovel(	
    codAutomovel int PRIMARY KEY AUTO_INCREMENT,
	numPortas int not null,
	direcaoHidraulica bit not null,
	cambioAutomatico bit not null,
	radio bit not null
);

create table onibus(
    codOnibus int PRIMARY KEY AUTO_INCREMENT,
	numPassageiros int not null,
	leito varchar(25) not null,
	sanitario bit not null
);

alter table veiculo ADD CONSTRAINT fk_codigo_veiculo foreign key (codTipoVeiculo) references tipo_veiculo (codTipoVeiculo)

ALTER TABLE tipo_veiculo ADD CONSTRAINT fk_codAutomovel FOREIGN KEY (codAutomovel) REFERENCES automovel (codAutomovel)

ALTER TABLE tipo_veiculo ADD CONSTRAINT fk_codOnibus FOREIGN KEY (CodOnibus) REFERENCES onibus (codOnibus)

alter table contrato_aluguel ADD CONSTRAINT fk_codEscritorio foreign key (codEscritorio) references escritorio (codEscritorio)

alter table contrato_aluguel ADD CONSTRAINT fk_codCliente foreign key (codCliente) references cliente (codCliente)

