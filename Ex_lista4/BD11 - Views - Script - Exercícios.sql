CREATE database BD11;
USE BD11;
create table Gravadora (idGrav int not null auto_increment,
						nomeGrav varchar(30) not null,
                        constraint PK_GRAV PRIMARY KEY (idGrav));

create table  Compositor(idComp int not null auto_increment,
						 nomeComp varchar(50) not null,
                         constraint PK_COMP PRIMARY KEY (idComp));

create table  Interprete (idInt int not null auto_increment,
						  nomeInt varchar(50) not null,
                          constraint PK_INT PRIMARY KEY (idInt));

create table  Musica(idMusica int not null auto_increment,
					 nomeMusica varchar(50) not null,
                     constraint PK_MUS PRIMARY KEY (idMusica));

create table  CD (idCD int not null auto_increment,
				  nomeCD varchar(40) not null,
                  produtor varchar(50) not null,
                  ano int not null,
                  estilo varchar(30) not null, 
                  nr_faixas int not null, 
                  idGrav int not null,
             constraint PK_CD PRIMARY KEY (idCD));



create table Musica_CD(idMusicaCD int not null unique auto_increment,
					   idMusica int not null, idCD int not null,
                       constraint PK_MUS_CD PRIMARY KEY (idMusica, idCD));

create table Composicao (idComposicao int not null auto_increment,
						idComp int not null, 
                        idMusica int not null, 
                        dataComp date not null,
                        constraint PK_COMPOSICAO PRIMARY KEY (idComposicao));


create table CantoresMusica (idInt int not null, 
						idMusica int not null);
                      
alter table CD add constraint FK_GRAV_CD FOREIGN KEY (idGrav) references Gravadora (idGrav);
alter table Composicao add constraint FK_COMPOS_MUS FOREIGN KEY (idMusica) references Musica(idMusica);
alter table Composicao add constraint FK_COMPOS_COMP FOREIGN KEY (idComp) references Compositor(idComp);
alter table Musica_CD add constraint FK_MCD_MUS FOREIGN KEY (idMusica) references Musica (idMusica);
alter table Musica_CD add constraint FK_MCD_CD foreign key (idCD) references CD (idCD);
alter table CantoresMusica add constraint FK_CANT_MUSICA FOREIGN KEY (idMusica) references Musica (idMusica);
alter table CantoresMusica add constraint FK_CANT_INT FOREIGN KEY (idInt) references Interprete(idInt);
             


insert into Gravadora (nomeGrav) values ('Continental');
insert into Gravadora (nomeGrav) values ('Global Records');
insert into Gravadora (nomeGrav) values ('Som Livre');
insert into Gravadora (nomeGrav) values ('Universal');


insert into Compositor (nomecomp) values ('Chico Buarque');
insert into Compositor (nomecomp) values ('Caetano');
insert into Compositor (nomecomp) values ('Terry McClean');
insert into Compositor (nomecomp) values ('Tiao Carreiro');
insert into Compositor (nomecomp) values ('Newton Mello');



insert into Interprete (nomeint) values ('Sandra de Sa');
insert into Interprete (nomeint) values ('Zeca Pagodinho');
insert into Interprete (nomeint) values ('Elvis Presley');
insert into Interprete (nomeint) values ('Elton John');
insert into Interprete (nomeint) values ('Tiao Carreiro e Pardinho');


insert into Musica (nomeMusica) values ('Sozinha');
insert into Musica (nomeMusica) values ('Agora eu sei');
insert into Musica (nomeMusica) values ('Agua da minha sede');
insert into Musica (nomeMusica) values ('Vida da Gente');
insert into Musica (nomeMusica) values ('My Way');
insert into Musica (nomeMusica) values ('Tutti-frutti');
insert into Musica (nomeMusica) values ('Love me tender');
insert into Musica (nomeMusica) values ('Rio de Lagrimas');
insert into Musica (nomeMusica) values ('Boi Soberano');
insert into Musica (nomeMusica) values ('Hino de Piracicaba');



insert into CD (nomeCD,produtor,ano, estilo, nr_faixas, idGrav) values
               ('Musica Preta Brasileira','Emilio S',2004, 'MPB', 10, 4);
insert into CD (nomeCD,produtor,ano, estilo, nr_faixas, idGrav) values
               ('Acustico MTV','Ze Branquinho',2004, 'Samba', 12, 4);
insert into CD (nomeCD,produtor,ano, estilo, nr_faixas, idGrav) values
               ('Viola Classica','Viriato Correia',2005, 'Regional', 13, 1);
insert into CD (nomeCD,produtor,ano, estilo, nr_faixas, idGrav) values
               ('The Best of Elvis','Hilton Pedro', 1992, 'Rock', 16, 2);


insert into Musica_CD(idMusica , idCD) values (1, 1);
insert into Musica_CD(idMusica , idCD) values (2, 1);
insert into Musica_CD(idMusica , idCD) values (3, 2);
insert into Musica_CD(idMusica , idCD) values (4, 2);
insert into Musica_CD(idMusica , idCD) values (8, 2);
insert into Musica_CD(idMusica , idCD) values (9, 3);
insert into Musica_CD(idMusica , idCD) values (10, 3);
insert into Musica_CD(idMusica , idCD) values (5, 4);
insert into Musica_CD(idMusica , idCD) values (6, 4);
insert into Musica_CD(idMusica , idCD) values (7, 4);

insert into Composicao (idComp, idMusica,dataComp) values (1,1,'2000-01-15');
insert into Composicao (idComp, idMusica,dataComp) values (1,2,'2001-07-18');
insert into Composicao (idComp, idMusica,dataComp) values (2,3,'2004-10-28');
insert into Composicao (idComp, idMusica,dataComp) values (2,4,'2003-11-17');
insert into Composicao (idComp, idMusica,dataComp) values (3,5,'1968-11-11');
insert into Composicao (idComp, idMusica,dataComp) values (3,6,'1964-06-11');
insert into Composicao (idComp, idMusica,dataComp) values (3,7,'1966-12-01');
insert into Composicao (idComp, idMusica,dataComp) values (4,8,'1967-03-01');
insert into Composicao (idComp, idMusica,dataComp) values (4,9,'1957-08-07');
insert into Composicao (idComp, idMusica,dataComp) values (5,10,'1951-05-07');


insert into CantoresMusica  values (1,1);
insert into CantoresMusica  values (1,2);
insert into CantoresMusica  values (2,3);
insert into CantoresMusica  values (2,4);
insert into CantoresMusica  values (3,5);
insert into CantoresMusica  values (3,6);
insert into CantoresMusica  values (3,7);
insert into CantoresMusica  values (5,8);
insert into CantoresMusica  values (5,9);
insert into CantoresMusica  values (5,10);
