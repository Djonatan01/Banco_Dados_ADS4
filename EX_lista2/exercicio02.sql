create database exercicio02;

create table pessoa(
	codPessoa int not null primary key auto_increment,
	nome varchar(200) not null,
	telefone varchar(12),
	dataNascimento date not null
); 

create table paciente(
	codPaciente int not null primary key auto_increment,
	codPessoa int not null,
	convMedPac varchar(200),
	matConvPac varchar(50)
);

create table medico(
	CRM varchar(10) not null primary key,
	CodEsp int not null,
	codPessoa int not null
);
create table consulta(
	codConsulta int not null primary key auto_increment,
	CRM varchar(10) not null,
	codPaciente int not null,
	dataConsulta date not null,
	horaConsulta date not null
);
create table especialidade(
	CodEsp int not null primary key auto_increment,
	nomeEsp varchar(50)
);

alter table medico add constraint fk_especialidade FOREIGN KEY (CodEsp) references especialidade(CodEsp);

alter table medico add constraint fk_Pessoal FOREIGN key (codPessoa) references pessoa(codPessoa);

alter table consulta add constraint fk_medico FOREIGN KEY (CRM) references medico(CRM);

alter table consulta add constraint fk_paciente FOREIGN key (codPaciente) references paciente(codPaciente);

alter table paciente add constraint fk_pessoa FOREIGN key (codPessoa) references pessoa(codPessoa);
 
