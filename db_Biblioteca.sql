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


insert into tbl_autores(ID_Autor, Nome_Autor, SobreNome_Autor) values(1, 'Daniel', 'Barret');

insert into tbl_autores(ID_Autor, Nome_Autor, SobreNome_Autor) values(2, 'erald', 'Carter');

insert into tbl_autores(ID_Autor, Nome_Autor, SobreNome_Autor) values(3, 'Mark', 'Sobell');

insert into tbl_autores(ID_Autor, Nome_Autor, SobreNome_Autor) values(4, 'William', 'Stanek');

insert into tbl_autores(ID_Autor, Nome_Autor, SobreNome_Autor) values(5, 'Richard', 'Blum');

select * from tbl_autores;

INSERT INTO tbl_editoras (Nome_Editora) VALUES ('Prentice Hall');

INSERT INTO tbl_editoras (Nome_Editora) VALUES ('O´Reilly');

INSERT INTO tbl_editoras (Nome_Editora) VALUES ('Microsoft Press');

INSERT INTO tbl_editoras (Nome_Editora) VALUES ('Wiley');

INSERT INTO tbl_editoras (Nome_Editora) VALUES ('McGraw-Hill Education');

INSERT INTO tbl_livro (Nome_Livro, ISBN13, ISBN10, Data_Pub, Preco_Livro, Categoria, ID_Autor, ID_Editora)
VALUES
('Linux Command Line and Shell Scripting','9781118983843', '111898384X', '20150109', 68.35, 1, 5, 4),
('SSH, the Secure Shell','9780596008956', '0596008953', '20050517', 58.30, 1, 1, 2),
('Using Samba','9780596002565', '0596002564', '20031221', 61.45, 1, 2, 2),
('Fedora and Red Hat Linux', '9780133477436', '0133477436', '20140110', 62.24, 1, 3, 1),
('Windows Server 2012 Inside Out','9780735666313', '0735666318', '20130125', 66.80, 1, 4, 3),
('Microsoft Exchange Server 2010','9780735640610', '0735640610', '20101201', 45.30, 1, 4, 3),
('Practical Electronics for Inventors', '9781259587542', '1259587541', '20160324', 67.80, 1, 13, 5);

insert into tbl_Livro(Nome_Livro, ISBN, Data_Pub, Preco_Livro, ID_Autor, ID_Editora) values('Linux Command Line and Shell Scripting', '143856969', 68.35, 5, 4);

insert into tbl_Livro(Nome_Livro, ISBN, Data_Pub, Preco_Livro, ID_Autor, ID_Editora) values('SSH, the Secure Shell', '127658785', 58.30, 1);

insert into tbl_Livro(Nome_Livro, ISBN, Data_Pub, Preco_Livro, ID_Autor, ID_Editora) values('Using Samba', '123856789', '20001221', 61.45, 2, 2);

select * from tbl_livro;

select Nome_Autor from tbl_autores;
select * from tbl_autores;
select Nome_Livro from tbl_livro;

select Nome_Livro, ISBN from tbl_Livro;