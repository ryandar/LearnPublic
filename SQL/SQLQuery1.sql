
drop table Table1
drop table Table2

create table Table1
(
    Column1 int,
    Column2 VARCHAR(MAX)
)

create table Table2
(
    Column1 int,
    Column2 DateTime
)

create table Table3
(
    Column1 int,
    Column2 int
)

insert into table1 (Column1, Column2) values (1, 'One')
insert into table1 (Column1, Column2) values (2, 'Two')
insert into table1 (Column1, Column2) values (3, 'Three')
insert into table1 (Column1, Column2) values (4, 'Four')
insert into table1 (Column1, Column2) values (5, 'Five')
insert into table2 (Column1, Column2) values (1, '2025-01-20')
insert into table2 (Column1, Column2) values (2, '2025-02-20')
insert into table2 (Column1, Column2) values (5, '2025-05-20')
insert into table3 (Column1, Column2) values (1, 12)
insert into table3 (Column1, Column2) values (2, 10)
insert into table3 (Column1, Column2) values (2, 20)
insert into table3 (Column1, Column2) values (2, 30)
insert into table3 (Column1, Column2) values (5, 22)


--delete from table1 where Column1 = 'Three'

select * from table1 order by column1


select t1.Column1,  t2.Column2  from table1 t1
left join table2 t2 on t2.Column1 = t1.Column1
order by t1.column1 


select t1.Column1, sum(t3.Column2)
from table1 t1
left join table3 t3 on t3.Column1 = t1.Column1
group by t1.Column1, t3.Column1 
order by t1.column1 




