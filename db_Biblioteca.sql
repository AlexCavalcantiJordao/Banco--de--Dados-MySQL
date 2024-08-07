create database db_Biblioteca;

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
references tbl_editora(ID_editora);

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
select Nome_Livro, ISBN, Data_Pub from tbl_Livro;
SELECT * FROM tbl_Livro ORDER BY Nome_Livro DESC;

-- ORDER BY Nome_Livro DESC;
select Nome_Livro, ID_Editora from tbl_Livro order by ID_Editora;
select Nome_Livro, Preco_Livro from tbl_Livro order by Preco_Livro desc;

show index from tbl_Editoras;

create index idx_editora on tbl_Editoras(NomeEditora);

select Nome_Livro, Data_Pub from tbl_Livro where ID_Autor = 1;
select ID_Autor, Nome_Autor from tbl_autores where SobreNome_Autor = 'Stanek';
select * from tbl_Livro where ID_Livro > 2 and ID_Autor < 3;
select * from tbl_Livro where ID_Livro > 2 or ID_Autor < 3;
select * from tbl_Livro where ID_Livro > 2 and not ID_Autor < 3;

-- Operadores IN e NOT IN....
-- Filtragens usando listas de valores no MySQL....
use db_Biblioteca;

-- Sintaxe:
select coluna(s) from tabelas(s) where expressão valor NOT IN (lista de valores);

-- Exemplo 01:
select NomeLivro, NomeEditora from tbl_livro where IdEditora in (2,4);

-- Exemplo 02:
select NomeLivro, Edicao from tbl_livro where Edicao not in (1,2);

-- Exemplo 03:
select NomeLivro, IdEditora from tbl_livro where IdEditora in (select IDEditora from tbl_editora where NomeEditora = 'Wiley' or NomeEditora = 'Microsoft Press');

select * From tbl_livro;
select NomeEditora, IdEditora from tbl_editora;
select * from tbl_teste_incremento;
delete from tbl_teste_incremento where Codigo = 90;

truncate table tbl_teste_incremento;

select colunas 
as alias_coluna 
from tabela as alias_tabela;

select Nome_Livro as Livros, Preco_Livro as Preço
from tbl_Livro;

select count(*) from tbl_autores;
select count(distinct id_autor) from tbl_Livro;
select max(Preco_Livro) from tbl_Livro;
select min(Preco_Livro) from tbl_Livro;
select avg(Preco_Livro) from tbl_Livro;
select sum(Preco_Livro) from tbl_Livro;

create table Clientes(
ID_Cliente smallint,
Nome_Cliente varchar (20),
constraint primary key  (ID_Cliente));

insert into Clientes (ID_Cliente, Nome_Cliente) values (22, 'Alex');
insert Clientes (ID_Cliente, Nome_Cliente) values (34,'Fabio');
insert Cliente (ID_Cliente, Nome_CLiente) values (43,'Gilberto');

select * from Clientes;

rename table Clientes to Meus_Clientes

-- REGEXP - Expressões Regulares em consultas....
-- [...] : Qualquer caracter único no intervalo ou conjunto ou conjunto especificado ([a-h]; [aeiou];)....
-- [^...] : Qualquer caracter único que não esteja no intervalo ou conjunto especificado ([^ a-h]; [^ aeiou])....
-- ^ : Inicio da string...
-- $ : Fim da string...
# a | b | c : Alteração (a ou b ou c)...

select Nome_Livro from tbl_Livro where Nome_Livro regexp '^[FS]';
select Nome_Livro from tbl_Livro where Nome_Livro regexp '^[^FS]';
select Nome_Livro from tbl_Livro where Nome_Livro regexp '[ng]$';
select Nome_Livro from tbl_Livro where Nome_Livro regexp '^[FS] | Mi';

-- DEFAULT - Valores padrão em colunas...
alter table tbl_autores modify column Sobrenome_Autor varchar(60) default 'da Silva';

-- Inserir registros para teste:
insert into tbl_autores(ID_Autor, Nome_autor) values(6, 'Alex');

-- Inserir registros para teste de Nome e o Sobrenome:
insert into tbl_autores(ID_Autor, Nome_autor, Sobrenome_Autor) values(9, 'Rita', 'de Souza');

-- Não foi especificado o sobrenome do autor, será assumido o padrão criado. Verificando o resultado.
select * from tbl_autores;

-- DEFAULT - Valores padrão em colunas...
alter table tbl_autores modify column Sobrenome_Autor varchar(60);

-- Inserir registros para teste:
insert into tbl_autores(ID_Autor, Nome_autor) values(10, 'Ana');

-- Não foi especificado o sobrenome do autor, será assumido o padrão criado. Verificando o resultado.
select * from tbl_autores;

-- mysqldump - Backup e Restauração do Banco de Dados...
create database teste_restore;

-- GROUP BY - Agrupamento de Registros...
create table Vendas(
ID smallint primary key,
Nome_Vendedor varchar(20),
Quantidade int,
Produto varchar(20),
Cidade varchar(20));

insert into Vendas (ID, Nome_Vendedor, Quantidade, Produto, Cidade) values(10, 'Jorge', 1400, 'Mouse', 'São Paulo');
insert into Vendas (ID, Nome_Vendedor, Quantidade, Produto, Cidade) values(12, 'Tatiana', 1400, 'Teclado', 'Amazônas');
insert into Vendas (ID, Nome_Vendedor, Quantidade, Produto, Cidade) values(14, 'Ana', 1220, 'Monitor', 'Rio de Janeiro');
insert into Vendas (ID, Nome_Vendedor, Quantidade, Produto, Cidade) values(16, 'Rita', 1700, 'Mesa de Computador', 'Recife');
insert into Vendas (ID, Nome_Vendedor, Quantidade, Produto, Cidade) values(18, 'Marcos', 2159, 'Cadeira Gamer', 'Santa Catarina');
insert into Vendas (ID, Nome_Vendedor, Quantidade, Produto, Cidade) values(20, 'Carla', 980, 'Fone de Ouvido', 'Recife');
insert into Vendas (ID, Nome_Vendedor, Quantidade, Produto, Cidade) values(22, 'Roberto', 1120, 'Estabilizador', 'Rio Grande do Sul');

select * from Vendas where Produto = 'Mouse';

-- Consultas usando agregação para obter total de vendas de mouses:
select sum(Quantidade) as TotalMouses from Vendas where Produto = 'Mouse';

-- Consultas totalizando as vendas de todos os produtos por cidade:
select Cidade, sum(Quantidade) as Total from Vendas group by Cidade;

-- Agrupar as vendas nas Vendas:
select Cidade, count(*) as Total from Vendas group by Cidade;

--  HAVING - Filtrando os resultados do Agrupamento...

-- Consulta retornando total de vendas das cidades com menos de 2500 produtos vendidos:
select Cidade, sum(Quantidade) as Total from Vendas group by Cidade having sum(Quantidade) < 2500;

-- Exemplo 02: Consulta retornando total de vendas do produto "Teclados" das cidades com menos de 1500 teclados vendidos:
select Cidade, sum(Quantidade) as TotalTeclados from Vendas where Produto = 'Teclados' group by Cidade having sum(Quantidade) < 1500;

create view vw_LivroAutores as select tbl_Livro.Nome_Livro as Livro, tbl_autores.Nome_Autor as Autor from tbl_Livro
inner join tbl_autores on tbl_Livro.ID_Autor = tbl_autores.ID_Autor;

select Livro, Autor from vw_LivroAutores order by Autor;

-- View - Alteração....
create view vw_LivroAutores as select tbl_Livro.Nome_Livro as Livro, tbl_autores.Nome_Autor as Autor, Preco_Livro as Valor from tbl_Livro
inner join tbl_autores on tbl_Livro.ID_Autor = tbl_autores.ID_Autor;

select * from vw_LivroAutores order by Valor;

-- Exclusão de uma Visão:
drop view vw_LivroAutores;

-- INNER JOIN - Consultar dados em duas ou mais...
select * from tbl_Livro inner join tbl_autores on tbl_Livro.ID_Autor = tbl_autores.ID_Autor;

create view vw_LivroAutores as select tbl_Livro.Nome_Livro as Livro, tbl_autores.Nome_Autor as Autor, Preco_Livro as Valor from tbl_Livro
inner join tbl_autores on tbl_Livro.ID_Autor = tbl_autores.ID_Autor;

-- Usando Aliares e cláusulas WHERE e LIKE...
select L.Nome_Livro as Livro, E.Nome_editora as Editoras from tbl_Livro as L inner join tbl_editora as E
on L.ID_editora = E.ID_editora where E.Nome_Editora like 'M%';

select L.Nome_Livro as Livro, A.Nome_autor as Autor, E.Nome_Editora as Editora from tbl_Livro as L
inner join tbl_autores as A on L.ID_autor = A.ID_autor inner join tbl_editora as E on L.ID_editora = E.ID_Editora;

-- LEFT JOIN e RIGHT JOIN - Consultar dados em duas ou mais...
select * from tbl_autores left join tbl_Livro on tbl_Livro.ID_Autor = tbl_autores.ID_Autor;

-- LEFT JOIN excluindo correspondência...
select * from tbl_autores left join tbl_Livro on tbl_Livro.ID_Autor = tbl_autores .ID_Autor
where tbl_Livro.ID_Autor is null;

-- RIGHT JOIN excluindo correspondência...
select * from tbl_Livro as Li right join tbl_editora as Ed on Li.ID_Editora = Ed.ID_Editora where Li.ID_editora is null;
insert into tbl_editora(ID_editora, Nome_Editora) values (6, 'Companhia das Letras.');
select * from tbl_editora;

-- Concatenação de Strings com CONCAT, IFNULL e COALESCE...
-- É possível concatenar strings usando-se a função CONCAT()....
-- Sintaxe:
-- concat(string | nome_coluna, <string | nome_coluna)
-- Exemplo:
select concat('Alex', 'Cavalcanti') as 'Meu nome';
select concat(Nome_Autor, ' ',  Sobrenome_Autor) as 'Nome Completo' from tbl_autores;
select concat('Gosto de futebol', Nome_Livro) as tbl_Livro where ID_autor = 2;

create table teste_nulos(
id smallint primary key auto_increment,
item varchar(20),
quantidade smallint null);

insert into teste_nulo(id, item, quantidade) values (1, 'Pendrive', 5);
insert into teste_nulo(id, item, quantidade) values (2, 'Monitor', 7);

create table teste_nulos(
id smallint primary key auto_increment,
item varchar(20),
quantidade smallint null);

insert into teste_nulo(id, item, quantidade) values (1, 'Pendrive', 5);
insert into teste_nulo(id, item, quantidade) values (2, 'Monitor', 7);
insert into teste_nulo(id, item, quantidade) values (2, 'Teclado', 9);
insert into teste_nulo(id, item, quantidade) values (2, 'Mouse', 11);

select * from teste_nulos;

-----------------------------------------------------------------------------------------------------------------------------------
-- Se uma string for concatenada com NULL, o resultado....
-- Retornando será apenas NULL:
select concat('A quantidade adquirida é ', ' ', quantidade) from teste_nulos where item = 'Teclado';

-----------------------------------------------------------------------------------------------------------------------------------
-- Funções IFNULL e COALESCE:
-- IFNULL (coluna, substituição)...
select concat('A quantidade adquirida é ',  ' ', ifnull(quantidade, 0)) from teste_nulos where item = 'Teclado';

-- COALESCE (valor1, valor2, ...., valorN); Essa Função retornará o primeiro valor não-nulo encontrado em seus argumentos...
select concat('A quantidade adquirido é ', ' ', coalesce(null, quantidade, null, 0)) from teste_nulos where item = 'Teclado';

--  Funções Matemáticas e Operadores Aritméticos...
-- Operação aritmétricas
-- É possível realizar operação matemática simples nos valores de uma coluna e retornar em uma coluna calculada. Para isso usamos operadores matemáticos comuns:
-- + : Soma...
-- - : Subtração...
-- / : Divisão...
-- * : Multiplcação...
-- % ou ADD : Módulo resto da divisão...
-- DIV : Divisão Inteira...

-- Exemplos:
select 3 * 0;
select Nome_Livro, Preco_Livro * 5 as 'Preço de 5 unidades' from tbl_Livro;

select 9 * 2 / 3;
select Nome_Livro, Preco_Livro / 2 as 'Preço com 50% de desconto' from tbl_Livro;

select 10 / 3;
select 10 mod 3;

-----------------------------------------------------------------------------------------------------------------------------------
-- Funções matemáticas...
-- É possível também utilizar funções matemática nos valores de uma coluna e retornar resultados em uma coluna calculadas. Abaixo vemos algumas funções matemáticas mais comuns:
-- CEILING() : Arredondar para cima...
-- FLOOR() : Arredondar para baixo...
-- PI() : Retornar o valor de PI...
-- POW(x, y)  : Retornar x elevado a y...
-- SQRT() : Raiz quadrada de um argumento...
-- SIN() : Retornar o seno de um número dado em radianos...
-- HEX() : Retorna a representação hexadecimal de um valor decimal...

-- Exemplos:
select Nome_Livro, ceiling(Preco_Livro * 5) as 'Preço Arredondamento' from tbl_Livro;
select pi();
select pow(2,4);
select sqrt(81);
select sin(pi());
select hex(1200);

-- Rotinas Armazenadas - Funções (CREATE FUNCTION)....
-- Criando a função:
create function fn_teste(a decimal(10,2), b int) returns int
return a * b;

-- Invocando:
select fn_teste(2.5, 4) as Resultados;

select Nome_Livro, fn_teste(Preco_Livro, 6) as 'Preço de 6 unidades' from tbl_Livro where ID_Livro = 2;
drop function fn_teste;

--  Procedimentos Armazenados (Stored Procedures)...
-- Sintaxe de criação do procedimento:
create procedure nome_procedimento (parâmetros) declaração;

-- Invocando o Procedimento:
call nome_procedimento (parâmetros);

-- Criar procedimentos:
create procedure verPreço(varLivro smallint)
select concat('O preço é ', Preco_Livro) as Preço from tbl_Livro where ID_Livro = varLivro;

-- Invocando o procedimeto:
call verPreço(3);

-- Excluindo Procedimentos:
drop procedure nome_procedimento;
drop procedure verPreço;

--  Blocos BEGIN...END em Funções e Procedimentos Armazenados...
DELIMITER $$
create function aumenta_preco (preco decimal(10,2), taxa decimal(10,2))
BEGIN
	return preco + preco * taxa /100;
END
DELIMITER;

-----------------------------------------------------------------------------------------------------------------------------------
-- criar procedimento...
delimiter //
create procedure verPreços (varLivro smallint)
begin
	select concat('Preço é ', Preco_Livro) as Preco from tbl_Livro where ID_Livro = varLivro;
	select 'Procedimento executado com sucesso !';
end//
delimiter ;

-- Invocando o procedimento:
call verPreço(3);

-- Parâmetros IN, OUT e INOUT em Procedimentos Armazenados...
-- Parâmetros IN:
-- Exemplos 01:
delimiter //
create procedure editora_livro (in editora varchar(50))
begin
select L.Nome_Livro, E.Nome_Editora
	from tbl_Livro as L
	inner join tbl_editoras as E
	on L.ID_Editora = E.ID_Editora
	where E.Nome_Editora = editora;
end //
delimiter ;

call editora_livro('Wiley');
set @minhaeditora = 'Wiley';
call editora_livro(@minhaeditora);

-- Exemplos 02:
delimiter //
create procedure aumenta_preco(in codigo int, taxa decimal(10,2))
begin
	update tbl_Livro
	set Preco_Livro = tbl_Livro.Preco_Livro + tbl_Livro.Preco_Livro * taxa / 100
	where ID_Livro = Codigo;
end//
delimiter ;

-- Testando: Vamos aumentar o preço do livro de ID 4 em 20%....
-- Primeiro verificamos o preço atual:
select * from tbl_Livro where ID_Livro = 4;
-- Aplicamos agora o procedimento de aumento:
set @livro = 4;
set @aumento = 20; -- Aumento de 20%
call aumenta_preco(@livro, @aumento);

-- Verificando aumento aplicativo...
select * from tbl_Livro where ID_Livro = 4;

-- Exemplo de Parâmetros OUT:
delimiter //
create procedure teste_out (in id int, out livro varchar(50))
begin
	select Nome_Livro
	into livro
	from tbl_Livro
	where ID_Livro = id;
end //
delimiter ;

call teste_out(3, @livro);
select @livro;

-- No exemplo a seguir, o valor da variavel que for passado ao parâmetro "valor" será  refletido na própria variável externa, a qual terá valor alterado também...
delimiter //
create procedure aumento (inout valor decimal(10,2), taxa decimal(10,2))
begin
set valor = valor + valor * taxa / 100;
end //
delimiter ;

-- Testando: Criamos a variavel valorizando, e a usamos para passar o parametros valor. Vamos aumentar o valor eme 15%...
set @valorinicial = 20.00;
select @valorinicial;

call aumenta(@valorinicial, 15.00);
-- Verificamos agora se a variavel externa @valorinicial foi alterada:
select @valorinicial;