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

create table estoque.gravadora(
	id_gravadora integer primary key,
	ds_gravadora varchar(45)
);

create table estoque.artista_gravadora_faixa(
	id integer primary key,
	nu_seqmidia integer,
	nu_seq_faixa integer,
	nu_seq_artista integer,
	nu_seq_gravadora integer
);

create table estoque.midia(
	id_midia integer primary key,
	ds_midia varchar(45),
	nu_seq_categoria integer
);
