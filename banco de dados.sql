create schema estoque;

create table estoque.genero(
	id_genero integer primary key,
	ds_genero varchar(45)
);
insert into estoque.genero values(
	1,
	'rock'
);

insert into estoque.genero values(
	2,
	'pop'
);

insert into estoque.genero values(
	3,
	'clássica'
);

create table estoque.artista(
	id_artista integer primary key,
	ds_artista varchar(45)
);

insert into estoque.artista values(
	1,
	'Jonh Lennon'
);
insert into estoque.artista values(
	2,
	'Adam Saleh'
);
insert into estoque.artista values(
	3,
	'Mozart'
);
create table estoque.faixa_midia(
	id_faixa integer primary key,
	ds_faixa varchar(45),
	tempo_faixa time
);
insert into estoque.faixa_midia values(
	1,
	'm1',
	'00:04'
);
insert into estoque.faixa_midia values(
	2,
	'm2',
	'00:03'
);
insert into estoque.faixa_midia values(
	3,
	'm3',
	'00:05'
);
insert into estoque.faixa_midia values(
	4,
	'm4',
	'00:02'
);
insert into estoque.faixa_midia values(
	5,
	'm5',
	'00:03'
);

insert into estoque.faixa_midia values(
	6,
	'music1',
	'00:04'
);

insert into estoque.faixa_midia values(
	7,
	'music2',
	'00:03'
);
insert into estoque.faixa_midia values(
	3,
	'music3',
	'00:02'
);

insert into estoque.faixa_midia values(
	4,
	'music4',
	'00:02'
);
create table estoque.gravadora(
	id_gravadora integer primary key,
	ds_gravadora varchar(45)
);
insert into estoque.gravadora values(
	1,
	'sony'
);
insert into estoque.gravadora values(
	2,
	'som livre'
);
insert into estoque.gravadora values(
	3,
	'cometa'
);

create table estoque.midia(
	id_midia integer primary key,
	ds_midia varchar(45),
	nu_seq_categoria integer,
	foreign key(nu_seq_categoria) references estoque.genero(id_genero)
);
insert into estoque.midia values(
	1,
	'q1',
	2
);
insert into estoque.midia values(
	2,
	'q2',
	1
);
insert into estoque.midia values(
	3,
	'q3',
	3
);

create table estoque.artista_gravadora_faixa(
	id integer primary key,
	nu_seq_midia integer,
	nu_seq_faixa integer,
	nu_seq_artista integer,
	nu_seq_gravadora integer,
	foreign key(nu_seq_midia) references estoque.midia(id_midia),
	foreign key(nu_seq_artista) references estoque.artista(id_artista),
	foreign key(nu_seq_faixa) references estoque.faixa_midia(id_faixa),
	foreign key(nu_seq_gravadora) references estoque.gravadora(id_gravadora)
);
insert into estoque.artista_gravadora_faixa values(
	1,
	3,
	2,
	1,
	2
);

insert into estoque.artista_gravadora_faixa values(
	2,
	3,
	2,
	2,
	2
);

insert into estoque.artista_gravadora_faixa values(
	3,
	3,
	2,
	3,
	2
);

insert into estoque.artista_gravadora_faixa values(
	4,
	3,
	2,
	4,
	2
);

insert into estoque.artista_gravadora_faixa values(
	5,
	3,
	2,
	5,
	2
);

insert into estoque.artista_gravadora_faixa values(
	5,
	3,
	2,
	1,
	2
);
create table estoque.estoque(
	id_estoque integer primary key,
	ds_estoque varchar(45),
	quantidade integer,
	nu_seq_midia integer,
	nu_seq_fornecedor integer,
	foreign key (nu_seq_midia) references estoque.midia(id_midia),
	foreign key (nu_seq_fornecedor) references estoque.fornecedor(id_fornecedor)
);
insert into estoque.estoque values
	(01, 'cd', 15, 1, 102), 
	(02, 'dvd', 6, 2, 103),
	(03, 'blue-ray', 12, 3, 104);
	
create table estoque.fornecedor(
	id_fornecedor integer primary key,
	ds_fornecedor varchar(45),
	telefone varchar(45)
);
insert into estoque.fornecedor values
	(102, 'Som livre', '3271-4517'),
	(103, 'Sony', '3222-4587'),
	(104, 'Cometa', '3271-4568');
CREATE SCHEMA Comum;

CREATE TABLE Comum.uf(
	id_uf int primary key,
	ds_uf varchar(45)
);

CREATE TABLE Comum.municipio(
	id_municipio int primary key,
	ds_municipio varchar(45),
	nu_seq_uf int,
	foreign key (nu_seq_uf) references Comum.uf(id_uf)
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
	foreign key (nu_seq_uf) references Comum.uf(id_uf),
	foreign key (nu_seq_municipio) references Comum.municipio(id_municipio)
);

CREATE TABLE Comum.cliente(
	id_cliente int primary key,
	nu_seq_pessoa int,
	foreign key (nu_seq_pessoa) references Comum.pessoa(id_pessoa)
);

CREATE TABLE Comum.funcionario(
	matricula_funcionario int primary key,
	nu_seq_pessoa int,
	foreign key (nu_seq_pessoa) references Comum.pessoa(id_pessoa)
);

CREATE TABLE Comum.telefone(
	id_telefones int primary key,
	numero_residencia varchar(45),
	numero_celular varchar(45),
	nu_seq_cliente int,
	foreign key (nu_seq_cliente) references Comum.cliente(id_cliente)
);

insert into Comum.uf values 
	(01, 'PB'),
	(02, 'SP'),
	(03, 'RJ');

insert into Comum.municipio values
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
	(000006, '3221-1762', '(41)98628-9007', 001),
	(000007, '3271-2021', '(83)98729-0918', 003);
	
create schema venda;

create table venda.venda(
	id_venda int,
	ds_venda varchar(45),
	qnt varchar(45),
	preco_venda_id_produto int,
	nu_seq_cliente_id int,
	funcionario_matricula_funcionario int,
	foreign key(nu_seq_cliente_id) references comum.cliente(id_cliente),
	foreign key(funcionario_matricula_funcionario) references comum.funcionario(matricula_funcionario),
	foreign key(preco_venda_id_produto) references venda.preco_venda(id_preco_venda)
);

create table venda.preco_compra(
	id_preco_compra int,
	preco numeric,
	fornecedor_id_fornecedor int,
	midia_id_midia int,
	foreign key(fornecedor_id_fornecedor) references estoque.fornecedor(id_fornecedor),
	foreign key(midia_id_midia) references estoque.midia(id_midia)
);

create table venda.preco_venda(
	id_preco_venda int primary key,
	midia_id_midia int,
	foreign key(midia_id_midia) references estoque.midia(id_midia)
);
