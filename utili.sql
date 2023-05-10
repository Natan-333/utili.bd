create table cliente 
(cod_clie number(4) constraint clie_cd_pk primary key, 
nome_clie varchar2(20) constraint clie_no_nn not null, 
endereco varchar2(30),cidade varchar2(15), 
cep char(8),uf char(2),cnpj char(16),ie char(12));

create table vendedor 
(cod_ven number(4) constraint ven_cod_pk primary key, 
nome_ven varchar2(20) constraint ven_no_nn not null, 
salario_fixo number(12,2),comissao char(1));

create table produto 
(cod_prod number(4) constraint pro_cod_pk primary key, 
unidade varchar2(3),descricao varchar2(20),val_unit number(10,2));

create table pedido 
(num_pedido number(4) constraint pedido_num_pk primary key, 
pr_entrega number(3) constraint entrega_pr_nn not null, 
cod_clie references cliente,cod_ven references vendedor);

create table item_pedido 
(num_pedido references pedido, 
cod_prod references produto, 
quant number(10,2));

insert into cliente values(720,'Ana','Rua 17 n.19','Niteroi','24358310','RJ','12113231/0001-34','2134');
insert into cliente values(870,'Flavio','Av. Pres. Vargas, 10','Sao Paulo','22763931','SP','22534126/9387-9','4631');
insert into cliente values(110,'Jorge','Rua Caiapo, 13','Curitiba','30078500','PR','14512764/9834-9',null);
insert into cliente values(222,'Lucia','Rua Itabira, 123','Belo Horizonte','22124391','MG','283152123/9348-8','2985');
insert into cliente values(830,'Mauricio','Av. Paulista, 1236','Sao Paulo','3012683','SP','32816985/7465-6','9343');
insert into cliente values(130,'Edmar','Rua da Praia, s/n','Salvador','30079300','BA','23463284/234-9','7121');
insert into cliente values(410,'Rodolfo','Largo da Lapa, 27','Rio de Janeiro','30078900','RJ','12835128/2346-9','743');
insert into cliente values(20,'Beth','Av. Climerio, 45','Sao Paulo','25679300','SP','32485126/7326-8','9280');
insert into cliente values(157,'Paulo','Trav. Moraes, casa 3','Londrina',null,'PR','32848223/324-2','1923');
insert into cliente values(180,'Livio','Av. Beira Mar, 1256','Florianopolis','30077500','SC','12736571/2347-4','1111');
insert into cliente values(260,'Susana','Rua Lopes Mandes, 12','Niteroi','30046500','RJ','21763571/232-9','2530');
insert into cliente values(290,'Renato','Rua Meireles, 123','Sao Paulo','30225900','SP','13276571/1231-4','1820');
insert into cliente values(390,'Sebastiao','Rua da Igreja, 10','Uberaba','30438700','MG','32176547/213-3','9071');
insert into cliente values(234,'Jose','Quadra 3, Bl. 3, sl. 1003','Brasilia','22841650','DF','21763576/1232-3','2931');
commit;

insert into vendedor values(209,'Jose','1800','C');
insert into vendedor values(111,'Carlos','2490','A');
insert into vendedor values(11,'Joao','2780','C');
insert into vendedor values(240,'Antonio','9500','C');
insert into vendedor values(720,'Felipe','4600','A');
insert into vendedor values(213,'Jonas','2300','A');
insert into vendedor values(101,'Joao','2650','C');
insert into vendedor values(310,'Josias','870','B');
insert into vendedor values(250,'Mauricio','2930','B');
commit;

commit;

delete from produto;

insert into produto values ('25','KG','Queijo',0.97);
insert into produto values ('31','BAR','Chocolate','0.87');
insert into produto values ('78','L','Vinho','2.00');
insert into produto values ('22','M','Linho','0.11');
insert into produto values ('30','SAC','Acucar','0.30');
insert into produto values ('53','M','Linha','1.80');
insert into produto values ('13','G','Ouro','6.18');
insert into produto values ('45','M','Madeira','0.25');
insert into produto values ('87','M','Cano','1.97');
insert into produto values ('77','M','Papel','1.05');
commit;

insert into pedido values ('121','20','410','209');
insert into pedido values ('97','20','720','101');
insert into pedido values ('101','15','720','101');
insert into pedido values ('137','20','720','720');
insert into pedido values ('148','20','720','101');
insert into pedido values ('189','15','870','213');
insert into pedido values ('104','30','110','101');
insert into pedido values ('203','30','830','250');
insert into pedido values ('98','20','410','209');
insert into pedido values ('143','30','20','11');
insert into pedido values ('105','30','180','240');
insert into pedido values ('111','15','260','240');
insert into pedido values ('103','20','260','11');
insert into pedido values ('91','20','260','11');
insert into pedido values ('138','20','260','11');
insert into pedido values ('108','15','290','310');
insert into pedido values ('119','30','390','250');
commit;

insert into item_pedido values ('121','25','10');
insert into item_pedido values ('121','31','35');
insert into item_pedido values ('97','77','20');
insert into item_pedido values ('101','31','9');
insert into item_pedido values ('101','78','18');
insert into item_pedido values ('101','13','5');
insert into item_pedido values ('98','77','5');
insert into item_pedido values ('148','45','8');
insert into item_pedido values ('148','31','7');
insert into item_pedido values ('148','77','3');
insert into item_pedido values ('148','25','10');
insert into item_pedido values ('148','78','30');
insert into item_pedido values ('104','53','32');
insert into item_pedido values ('203','31','6');
insert into item_pedido values ('189','78','45');
insert into item_pedido values ('143','31','20');
insert into item_pedido values ('143','78','10');
commit;

select count(*) from produto;

-- round arredondamento

select round(avg(salario_fixo),2)from vededor;

--2)
select * from cleinte;
select count(cep) from cliente where cidade = 'São Paulo';

--3)
select count(num_pedido) "total de pedidos from pedido"
where cod_clie =720;

--4)
select avg(salariofixo) 'custo salarials dos vendedores de comissão a'
from

--5)
select num(salario_fixo) from vendedor where comissao = 'c';

select * from vendedor;
select MAX (salario_fixo) from vendedor;

solução em duas partes
1 - seleção que eibe a saida de dados
select nome_ven, salario_fixo from vendedor;
2 - filtro de exibição
select max(salario_fixo) from vendedor;
3 - junstar as instruções
select nome_ven, salario_fixo from vendedor
where salario_fixo in (select max(salario_fixo) from vendedor);
funões de grupo - analisam linhas e retornam um resuultado apenas

--7)
select uf, count(cod_clie) from cliente group by uf order by 1;

--8)
select uf, count(comissao) from vendedor group by comissao orde by 1;

--9)
select * from pedido where cod_clie = 260;
select (num_pedido), count(cod_prod) from item_pedido group by num_pedido order by 1;

quais cleintes possuem mais de 1 pedido?
condição usada na função count
having condição
select cod_clie, count(num_pedido)from pedido

--5.2)
1 - seleção que exibe a saida de dados
2 - filtro de exibição
3 - junstar as instruções

select nome_ven, salario_fixo from vendedor
where salario_fixo > (select avg(salario_fixo) from vendedor);

Funções data

data dio sistema - sysdate

Exibindo a data do sistema - vendo o padrão atual
select sysdate from dual;

select * from vendedor;

alter table vendedor add dt_adm date default sysdate;
alter table vendedor add dt_dem date default sysdate;

select * from vendedor;

processamneto com datas

Data + número = data
Data - núemro = data

data - data = número

select sysdate, sysdate + 400, sysdate - 400 from dual;

Subtrair 3580 dias data de admissão dos vendedores de comissão A

update vendedor set dt_adm = dt_adm - 3580 where comissao = 'A';

Subtrair 6580 dias data de admissão dos vendedores de comissão B

update vendedor set dt_adm = dt_adm - 6580 where comissao = 'B';

Subtrair 13580 dias data de admissão dos vendedores de comissão C

update vendedor set dt_adm = dt_adm - 13580 where comissao = 'C';

-- subtrair 18 dias da data de demissão do vendedor Felipe--

update vendedor set dt_adm = dt_adm - 18 where nome_ven = 'Felipe';

--Apagar conteudo da coluna data de demissão dos vendedores do código: 101 a 310--

update vendedor set dt_adm = dt_adm where cod_ven between 101 and 310;

--subtrair 67 dias da data de demissão do vendedor Joao de código 11--

update vendedor set dt_dem = dt_dem -67 where nome_ven = 'João' and cod_ven= 11;

desc cargo
create table cargo(cd_cargo number (2) primary key,
                   nm_cargo varchar(30),
                   salario number(8,2)
);
creat table funcionario2(
cd_cargo number(2)constraint funcionario_cd__cargo nn not null;



insert into funcionario2 values  (10,'Marcel',1);
insert into funcionario2 values  (11,'Claudio',2);
insert into funcionario2 values  (12,'Amanda',2);
insert into funcionario2 values  (13,'Samantha',not null);


--criar um relatorio...-

select nm_fun, nm_cargo from cargo inner join funcionario on cd_cargo = cargofk;

--junção por...--
left join ou right join

--exiba os cargos...--
select nm_fun, nm_cargo from cargo right join funcionario on cd_cargo = cargo_fk;

select nm_fun,nm_cargo from cargo left join funcionairo on cd_cargo = cargo_fk
wehre cargo_fk is null;

--exiba o nome do cliente...--

select nome_clie, nume_pedido from cliente inner join pedido on cliente.cod_clie -= pedido.cod_cliet; 

--exiba o nome do vendedor...--

select nome_ven,num_pedido from vendedor inner join pedido om pedido.cod_ven = vendedor.cod_ven;

--eiba o nome...---

select nome_ven,num_pedido nome_clie from pedido
inner join vendedor on pedido.cod_ven = vendedor.cod_ven
inner join cldiente on pedido.cod_clie = clie.cod_clie
