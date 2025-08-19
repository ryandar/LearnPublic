--SELECT TOP (1000) [Id]
--      ,[Value]
--      ,[CreatedDateUtc]
--      ,[DataVersion]
--  FROM [PH].[Core].[Tag]

select [value] from ph.core.tag nolock

select distinct [value] from ph.core.tag nolock

select value, count([value]) from ph.core.tag nolock
group by value


select value,
(
    select count(value) from core.Tag it where it.value = t.Value 
) as count
from core.Tag t

select * from core.Question nolock
select * from core.QuestionTag nolock

select * from core.Result nolock

select 
    q.QuestionText, 
    t.Value 
from core.Question q (NOLOCK)
join core.QuestionTag qt (NOLOCK) on qt.QuestionId = q.Id
join core.Tag t (NOLOCK) on t.Id = qt.TagId

select 
    q.QuestionText, 
    t.Value 
from core.Question q (NOLOCK)
join core.QuestionTag qt (NOLOCK) on qt.QuestionId = q.Id
join core.Tag t (NOLOCK) on t.Id = qt.TagId
where lower(t.Value) = 'typable'


