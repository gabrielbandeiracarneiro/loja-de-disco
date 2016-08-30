create schema estoque;

create table estoque.genero(
	id_genero integer primary key,
	ds_genero varchar(45)
);

create table estoque.artista(
	id_artista integer primary key,
	ds_artista varchar(45)
);

create table estoque.faixa_midia(
	id_faixa integer primary key,
	ds_faixa varchar(45),
	tempo_faixa time
);
