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

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Se uma string for concatenada com NULL, o resultado....
-- Retornando será apenas NULL:
select concat('A quantidade adquirida é ', ' ', quantidade) from teste_nulos where item = 'Teclado';

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
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
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
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

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
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

-- Variáveis Locais e Escopo - Comando DECLARE...
-- Exemplos com SELECT...INTO (o desconto será dado diretamente em reais, não porcentagem; Os comandos devem ser ajustados para retornar apenas uma linha no SELECT...INTO)....
delimiter //
create function calcula_desconto(livro int, desconto decimal(10,2))
returns decimal(10,2)
begin
	declare preco decimal(10,2);
	select Preco_Livro from tbl_Livro
	where ID_Livro = Livro into preco;
	return preco - desconto;
end //
delimiter ;

-- Testando com o livro de ID 4 e desconto de R$ 10,00...
select  * from tbl_Livro where ID_Livro = 4;
select calcula_desconto(4, 10.00);

select * from tbl_Livro where ID_Livro = 4;

-- Blocos Condicionais IF - THEN - ELSE e CASE...
-- Exemplo de bloco IF:
delimiter //
create function calcula_imposto(salario dec(8,2))
returns dec(8,2)
begin
	declare valor_imposto dec(8,2);
	if salario < 1000.00 then
		set valor_imposto = 0.00;
	elseif salario < 2000.00 then
		set valor_imposto = salario * 0.15;
	elseif  salario < 3000.00 then
		set valor_imposto = salario * 0.22;
	else
		set valor_imposto = salario * 0.27;
	end if;
	return valor_imposto;
end //
delimiter ;

-- Vamos testar passando valores de salários como parâmetros...
-- Usaremos valores como 850, 1200 e 600 para testes:
select calcula_imposto(850.00);
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Exemplos de comandos CASE:
delimiter //
create function calcula_imposto(salario dec(8,2))
returns dec(8,2)
begin
	declare valor_imposto dec(8,2);
    case
	when salario < 1000.00 then
		set valor_imposto = 0.00;
	when salario < 2000.00 then
		set valor_imposto = salario * 0.15;
	when salario < 3000.00 then
		set valor_imposto = salario * 0.22;
	else
		set valor_imposto = salario * 0.27;
	end case;
	return valor_imposto;
end //
delimiter ;

select calcula_imposto(700.00);

-- Comandos SHOW, DESCRIBE e mysqlshow...

--  Estruturas de Repetição - comando LOOP...
delimiter //
create procedure acumula(limite int)
begin
	declare contador int default 0;
	declare soma int default 0;
	loop_teste: loop
		set contador = contador + 1;
		set soma = soma + contador;
		if contador >= limite then
			leave loop_teste;
		end if;
	end loop loop_teste;
	select soma;
end //
delimiter ;

-- Testando...
call acumula(10);

-- Estruturas de Repetição - comando REPEAT...
delimiter //
create procedure acumula_repita(limite tinyint unsigned)
begin
	declare contador tinyint unsigned default 0;
	declare soma int default 0;
    repeat
		set contador = contador + 1;
		set soma = soma + contador;
	until contador >= limite
	end repeat;
    select soma;
end //
delimiter ;

-- Testando a estrutura REPITA:
call acumula_repita(10);
call acumula_repita(0);
-- Este resultado em valor errado, pois o contador é incrementado ANTES do teste condicional....

-- Resolvendo o problema do teste de REPITA....
drop procedure if exists acumula_repita;
delimiter //
create procedure acumula_repita(limite tinyint unsigned)
main: begin
	declare contador tinyint unsigned default 0;
	declare soma int default 0;
	if limite < 1 then
		select 'O valor deve  ser maior que zero.' as Erro;
		leave main;
	end if;
	repeat
		set contador = contador + 1;
		set soma = contador + soma;
	until contador >= limite
	end repeat;
	select soma;
end //
delimiter ;

-- Restando a estrutura REPITA:
call acumula_repita(10);
call acumula_repita(0);

 -- Estruturas de Repetição - comando WHILE...
 delimiter //
 create procedure acumula_while(limite tinyint unsigned)
begin
	declare contador tinyint unsigned default 0;
	declare soma int default 0;
		while contador < limite do
		set contador = contador + 1;
		set soma = contador + soma;
	end while;
	select soma;
end //
delimiter ;

-- Testando:
call acumula_repita(10);
call acumula_repita(0);

-- Estruturas de Repetição - declaração ITERATE...
delimiter //
create procedure acumula_iterate(limite tinyint unsigned)
begin
	declare contador tinyint unsigned default 0;
	declare soma int unsigned default 0;
	teste: loop
		set contador = contador;
		set soma = soma + contador;
		if contador < limite then
			iterate teste;
		end if;
		leave teste;
	end loop teste;
	select soma;
end //
delimiter ;

call acumula_iterate(10);

delimiter //
create procedure pares(limite tinyint unsigned)
main: begin
	declare contador tinyint default 0;
	meuloop: while contador < limite do
		set contador = contador + 1;
		if mod(contador, 2) then
			iterate meuloop;
		end if;
		select concat(contador, ' é um número par') as valor;
	end while;
end //
delimiter ;

-- Testando:
call pares(20);

-- Triggers - Definição, Sintaxe e Criação...

-- Triggers:
-- "Gatilho"
-- Associado a uma tabela.
-- Procedimento invocado quando um comando DML é executado.

-- Uso do Trigger:
-- Verificação de integridade dos dados.
-- Validação dos dados.
-- Rastreamento e registros de logs de atividades nas tabelas.
-- Arquivamentos de registros excluidos.

-- Um trigger é associados a uma tabela.
-- Armazenado no BD como um arquivo separado.
-- Não são chamados diretamente, são invocados automaticamente.

-- Sintaxe dos Triggers:
create trigger nome timing operação on tabela for each row declaração
timing = before | after
operação = insert | update | delete

create table produto(
idProduto int not null auto_increment,
Nome_Produto varchar(45) null,
Preco_Normal decimal(10,2) null,
Preco_Desconto decimal(10,2) null,
primary key (idProduto));

-- Criando o Trigger:
create trigger tr_desconto before insert on produto for each row
set new.Preco_Desconto = (new.Preco_Normal * 0.90);

insert into produto(Nome_produto, Preco_Normal) values('Monitor', 1.00);

select * from produto;

--  Gerenciamento de Usuários do sistema – Criar, Consultar, Renomear e Excluir...
-- Definindo privilégios de acesso com GRANT e REVOKE...

-- Criar novo Banco de Dados e Tabelas...
select * from country;

-- O que são Subconsultas SQL (Subqueries) em Bancos de Dados....
use db_biblioteca;

select NomeLivro, PrecoLivro, IdEditora
from tbl_livro
where IdEditora =
	(select IdEditora
	from tbl_editora
	where NomeEditora = 'Wiley');
    
select * from tbl_livro;

update tbl_livro
set PrecoLivro = PrecoLivro * 1.12
where IdEditora =
	(select IdEditora
	from tbl_editora
	where NomeEditora = 'Microsoft Press');
    
-- Funções de Arredondamento no MySQL - ROUND, FLOOR, CEILING, TRUNCATE....
-- ROUND, TRUNCATE, CEILING, FLOOG...
-- Função ROUND()
select PrecoLivro as 'Preço Real',
round(PrecoLivro, 1) as 'Valores Arredondados'
from tbl_Livros where PrecoLivro > 150.00;

select avg(PrecoLivro) as 'Preço Médio',
round(avg(PrecoLivro),2) as 'Preço médio arredondado'
from tbl_Livros;

-- Função TRUNCATE...
-- Exibe o número de casas indicados, sem arredondar...
select PrecoLivro as 'Preço Real',
truncate(PrecoLivro,0) as 'Valores Arredondados'
from tbl_Livros
where PrecoLivro > 150.00;

-- TRUNCATE não tem nada a haver com TRUNCATE TABLE.....

-- Função FLOOR....
select floor(63.757) as Arredondado;

select PrecoLivro as 'Preço Real',
floor(PrecoLivro) as 'Reais sem centavos'
from tbl_livros
where PrecoLivro > 150.00;

-- Função CEILING() e Função CEIL().... 
select ceiling(63.757) as Arredondado;

select PrecoLivro as 'Preço Real',
ceiling(PrecoLivro) as 'Arredondado para cima'
from tbl_livros
where PrecoLivro > 150.00;

-- Todas as função....
select PrecoLivro as 'Preço Real', round(PrecoLivro) as 'ROUND', floor(PrecoLivro) as 'FLOOR', ceiling() as 'CEILING',
truncate(PrecoLivro) as 'TRUNCATE' from tbl_livros where PrecoLivro > 150.00 order by PrecoLivro;

-- Transações no MySQL - COMMIT e ROLLBACK...

-- Propriedades ACID
-- Atomicidade
-- Consistência
-- Isolamento
-- Durabilidade
-- Deve ser executado de forma completa ou não ter nenhum efeito nas tabela....
-- COMMIT Consolidação da transação....
-- ROLLBACK Transação totalmente desfeita...

set @@autocommit = off;
select @@autocommit;

-- Transações
-- Criar tabela para teste:
create table Dados_Livros
select NomeLivro, ISBN13, PrecoLivro
from tbl_livros;

-- Visualizar conteúdo da tabela...
select * from Dados_Livro;

-- Transição com ROLLBACK....
start transaction;
  delete from Dados_Livro;
	insert into Dados_Livro(NomeLivro, ISBN13, PrecoLivro)
	values('Ciência de Dados com Python', '9876532145632', 69.88);
  select * from Dados_Livro;
rollback;

select * from Dados_Livro;

-- Transição com COMMIT....
start transaction;
  delete from Dados_Livro;
	insert into Dados_Livro(NomeLivro, ISBN13, PrecoLivro)
	values('Ciência de Dados com Python', '9876532145632', 69.88);
  select * from Dados_Livro;
commit;

select * from Dados_Livro;

-- Exemplos com STORED PROCEDURE....
delimiter //
create procedure insere_dados()
begin
declare erro_sql tinyint default false;
declare continue handler for sqlexception set erro_sql = true;
start transaction;
	insert into Dados_Livro(NomeLivro, ISBN13, PrecoLivro) values
	      ('História da Numismática', '9789865321456', 78.60);
	insert into Dados_Livro(NomeLivro, ISBN13, PrecoLivro) values
	      ('Biologia Marinha', '9784233876972', 177.50);
	insert into Dados_Livro(NomeLivro, ISBN13, PrecoLivro) values
		  ('Quimica experimental', '9784523415974', 165.32);
	insert into Dados_Livro(NomeLivro, ISBN13, PrecoLivro) values
		  ('Artes Plásticas', '9784523415974', 98.00);
	if erro_sql = false then
		commit;
        select 'Transação efetivada com sucesso.' as Resultado;
	else
		rollback;
        select 'Erro na transação' as Resultado;
	end if;
end//
delimiter ;

call insere_dados();
select * from Dados_Livro;

-- Como retornar linhas aleatórias de uma tabela no MySQL com a função RAND.....
-- Função:
select floor(5 + round() * (5)) as Aleatorio;

select * from tbl_livros order by rand() limit 3;

-- Como unir consultas com operador UNION no MySQL.....

-- Exercício 01: Retornar de livros e preços dos livros. Caso o preço de livro seja igual ou superior a R$ 150,00, mostrar a mensagem "Livro Caro" em uma coluna á direita no resultado da consulta.
-- Caso ao contrário, mostrar a mensagem "Preço Razoável" ordenar por preço, do mais barato para o mais caro.
select NomeLivro Livro, PrecoLivro Preco, 'Livro Caro' Resultado from tbl_Livros
where PrecoLivro >= 150.00
union
select NomeLivro Livro, PrecoLivro Preco, 'Preço Razoável' Resultado from tbl_Livros
where PrecoLivro < 150.00
order by Preco;

-- Exercício 01: Retornar nomes do Livros, preços e assuntos dos Livros. Caso o assunto seja Eletrônico, mostrar o preço acrescido de 15% em seu valor.
-- Caso o Livro custe mais de R$ 200,00, descontar 10% em seu valor.
-- Ordenar por preço ajsutado, do mais caro para o mais barato.
select L.NomeLivro Livro, L.LivroPreco 'Preço Normal',
L.PrecoLivro * 0.90 'Preço Ajustado', A.Assunto
from tbl_Livro L inner join tbl_Assuntos A
on L.IdAssunto = A.IdAssunto where L.PrecoLivro > 200.00
union
select L.NomeLivro Livro, L.PrecoLivro 'Preço Normal';

select L.NomeLivro Livro, L.PrecoLivro 'Preço Normal',
L.PrecoLivro * 1.15 'Preço Ajustado', A.Assunto
from tbl_Livro L inner join tbl_Assuntos A
on L.IdAssunto = A.IdAssunto where A.Assunto = 'Eletrônica'
order by 'Preço Ajustado', dessc;

-- Formatação de Data em consultas e registros de dados...
select * from tbl_livro;

select NomeLivro, date_format(DataPub, "%d%m%Y") as 'Data de Publicação'
from tbl_livro;

insert into tbl_livro(NomeLivro, ISBN, PrecoLivro, NumPaginas, Edicao, DataPub, IdEditora, IdAssunto)
values ('Banco de Dados com MySQL', '9563214532178', 100.00, 400, 2, str_to_date("21/12/1985", "%d%m%y"), 1, 1);

select NomeLivro, date_format(DataPub, "%d%m%Y") as 'Data de Publicação'
from tbl_livro
where DataPub between
(str_to_date("20/12/1985", "%d%m%y")) and
(str_to_date("20/12/1985", "%d%m%y"));