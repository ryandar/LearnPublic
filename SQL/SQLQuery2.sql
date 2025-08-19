

--drop table Table1
--drop table Table2


--create table Table1
--(
--    field1 int,
--    field2 int,
--    field3 int
--)

--create table Table2
--(
--    field1 int,
--    field2 int,
--    field3 int
--)

--select * from Table1
--select * from Table2

--insert into Table1 (field1, field2, field3) values (1, 12, 100)
--insert into Table1 (field1, field2, field3) values (2, 10, 100)
--insert into Table1 (field1, field2, field3) values (3, 20, 100)
--insert into Table1 (field1, field2, field3) values (4, 30, 100)
--insert into Table1 (field1, field2, field3) values (5, 22, 100)
--insert into Table2 (field1, field2, field3) values (1, 12, 100)
--insert into Table2 (field1, field2, field3) values (2, 10, 100)
--insert into Table2 (field1, field2, field3) values (3, 20, 100)
--insert into Table2 (field1, field2, field3) values (4, 30, 100)
--insert into Table2 (field1, field2, field3) values (5, 22, 100)

--SET STATISTICS IO ON;
--SET STATISTICS TIME ON;


-- 5%
UPDATE t1
SET t1.field1 = t2.field2Sum
FROM table1 t1
INNER JOIN (select field3, sum(field2) as field2Sum
   from table2
  group by field3) as t2
on t2.field3 = t1.field3  
GO

-- 44 %
UPDATE table1
SET field1 = (
    SELECT SUM(t2.field2) 
    FROM TABLE2 t2 
    WHERE t2.field3 = field2
    )
GO

-- 51 %
UPDATE table1
SET field1 = (
    SELECT SUM(field2)
    FROM table2 AS t2
    WHERE t2.field3 = t1.field3
    )
FROM table1 AS t1
GO


SELECT name, is_auto_create_stats_on, is_auto_update_stats_on
FROM sys.databases
WHERE name = 'InterviewPrep';

SELECT name, * FROM sys.stats WHERE object_id = OBJECT_ID('table1');

DBCC SHOW_STATISTICS ('table1', '_WA_Sys_00000003_2A4B4B5E')

