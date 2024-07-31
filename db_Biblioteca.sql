use db_Biblioteca;

create table if not exists tbl_Livro(
ID_Livro smallint auto_increment primary key,
Nome_Livro varchar(50) not null,
ISBN varchar(30) not null,
ID_Autor smallint not null,
Data_Pub date not null,
Preco_Livro decimal not null);

show tables;

create table tbl_autores(
ID_Autor smallint primary key,
Nome_Autor varchar(50),
Sobrenome varchar(60));

create table tbl_editora
(ID_Editora smallint primary key auto_increment,
Nome_Editora varchar(50) not null);

show tables;

create table Compras(
ID_Compras smallint primary key,
Codigo_Produto varchar(50),
Data_Compra date,
foreign key (Codigo_Produto) references
Produtos(Cod_Produto));

show tables;

alter table tbl_Livro
drop column Id_autor;

select * from tbl_Livro;

alter table tbl_Livro
add ID_Autor smallint not null;

alter table tbl_Livro
add constraint fk_ID_Autor
foreign key (ID_Autor)
references tbl_autores (ID_autor);

select * from tbl_Livro;

alter table tbl_Livro
add ID_editora smallint not null;

alter table tbl_Livro
add constraint fk_id_editora
foreign key (ID_editora)
references tbl_editoras(ID_editora);

select * from tbl_Livro;


insert into tbl_autores(ID_Autor, Nome_Autor, SobreNome_Autor) values(1, "Daniel", "Barret");

insert into tbl_autores(ID_Autor, Nome_Autor, SobreNome_Autor) values(2, "Gerald", "Carter");

insert into tbl_autores(ID_Autor, Nome_Autor, SobreNome_Autor) values(3, "Mark", "Sobell");

insert into tbl_autores(ID_Autor, Nome_Autor, SobreNome_Autor) values(4, "William", "Stanek");

insert into tbl_autores(ID_Autor, Nome_Autor, SobreNome_Autor) values(5, "Richard", "Blum");
