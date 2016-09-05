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
create table estoque.estoque(
	id_estoque integer primary key,
	ds_estoque varchar(45),
	quantidade integer,
	nu_seq_midia integer,
	nu_seq_fornecedor integer
);
create table estoque.fornecedor(
	id_fornecedor integer primary key,
	ds_fornecedor varchar(45),
	telefone varchar(45)
);

CREATE SCHEMA Comum;

CREATE TABLE Comum.uf(
	id_uf int primary key,
	ds_uf varchar(45)
);

CREATE TABLE Comum.municipio(
	id_municipio int primary key,
	ds_municipio varchar(45),
	nu_seq_uf int,
	foreing nu_seq_uf references Comum.uf(id_uf)
);

CREATE TABLE Comum.pessoa(
	id_pessoa int primary key,
	nome varchar(45),
	cpf bigint,
	cep int,
	rua varchar(45),
	bairro varchar(45),
	numero int,
	complemento varchar(45),
	email vaechar(45),
	nu_seq_uf int,
	nu_seq_municipio int,
	foreing nu_seq_uf references Comum.uf(id_uf),
	foreing nu_seq_municipio references Comum.municipio(id_municipio)
);

CREATE TABLE Comum.cliente(
	id_cliente int primary key,
	nu_seq_pessoa int,
	foreing nu_seq_pessoa references Comum.pessoa(id_pessoa)
);

CREATE TABLE Comum.funcionario(
	matricula_funcionario int primary key,
	nu_seq_pessoa int,
	foreing nu_seq_pessoa references Comum.pessoa(id_pessoa)
);

CREATE TABLE Comum.telefone(
	id_telefones int primary key,
	numero_residencia varchar(45),
	numero_celular varchar(45),
	nu_seq_cliente int,
	foreing nu_seq_cliente references Comum.cliente(id_cliente)
);

insert into Comum.uf values 
	(01, 'PB'),
	(02, 'SP'),
	(03, 'RJ');

insert into Comum.municpio values
	(0001, 'Guarabira', 01),
	(0002, 'Rio de Janeiro', 03),
	(0003, 'Sao Paulo', 02);

insert into Comum.pessoa values
	(00001, 'Raimundo', 09417753301, 5820000, 'Coronel Alencar', 'Ameixas', 354, 'perto de ze', 'raiterra@hotmail.com', 01, 0001),
	(00002, 'Vanubia', 09678436605, 1480400, 'Padre Cicero', 'Copacabana', 1004, 'em frente ao posto', 'venus36@hotmail.com', 03, 0002),
	(00003, 'Amarildo', 07568879903, 1248000, 'Acacias', 'Tiete', 598, 'conjunto novo', 'amadoderildo@gmail.com', 02, 0003),
	(00004, 'Josefa', 09754438809, 1480400, 'Anemona', 'Rocinha', 809, 'favela', 'zefinha@gmail.com', 03, 0002),
	(00005, 'Jose', 04567782304, 5820000, 'Viera Souto', 'Jua', 352, 'perto da amecc', 'jotaze@gmail.com', 01, 0001),
	(00006, 'Ednaldo', 07658897102, 1248000, 'Rui Patricio', 'Leste', 1023, 'Catole', 'eds123@gmail.com', 03, 0002);

insert into Comum.cliente values
	(001, 00003),
	(002, 00001),
	(003, 00005);

insert into Comum.funcionario values
	(1, 00002),
	(2, 00004),
	(3, 00006);

insert into Comum.telefone values
	(000005, '3271-2098', '(83)98876-9089', 002),
	(000006, '3221-1762, '(41)98628-9007', 001),
	(000007, '3271-2021', '(83)98729-0918', 003);
	
