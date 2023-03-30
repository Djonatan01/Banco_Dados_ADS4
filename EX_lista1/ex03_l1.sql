CREATE TABLE fita(
codFita int PRIMARY KEY NOT NULL,
codRolo int,
codCli int,
codFilme int
)

CREATE TABLE cliente(
codCli int PRIMARY KEY,
nomeCli varchar(200),
enderecoCli varchar(200),
telefoneCli varchar(14)
)

CREATE TABLE filme(
codFilme int PRIMARY KEY NOT NULL,
tituloFilme varchar(200),
codCat int
)

CREATE TABLE categoria(
codCat int PRIMARY KEY NOT NULL,
nomeCat varchar (200),
codAtor int
)

CREATE TABLE ator(
codAtor int PRIMARY KEY,
dtNascAtor date,
nomePopularAtor varchar(200),
nomeArtisticoAtor varchar(200)
)

ALTER TABLE fita 
ADD CONSTRAINT FK_CLIENTE FOREIGN KEY (codCli) REFERENCES cliente(codCli)

ALTER TABLE fita 
ADD CONSTRAINT FK_FILME FOREIGN KEY (codfilme) REFERENCES filme(codFilme)

ALTER TABLE filme 
ADD CONSTRAINT FK_CATEGORIA FOREIGN KEY (codCat) REFERENCES categoria(codCat)

ALTER TABLE categoria
ADD CONSTRAINT FK_ATOR FOREIGN KEY (codAtor) REFERENCES ator(codAtor)


