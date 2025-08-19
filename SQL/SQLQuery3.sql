
SELECT TOP 10
    qs.total_worker_time / 1000.0 AS TotalCPU_ms,
    qs.execution_count,
    qs.total_worker_time / qs.execution_count / 1000.0 AS AvgCPU_ms,
    qs.total_elapsed_time / 1000.0 AS TotalDuration_ms,
    qs.total_elapsed_time / qs.execution_count / 1000.0 AS AvgDuration_ms,
    SUBSTRING(st.text, (qs.statement_start_offset / 2) + 1,
              ((CASE qs.statement_end_offset
                   WHEN -1 THEN DATALENGTH(st.text)
                   ELSE qs.statement_end_offset
                 END - qs.statement_start_offset) / 2) + 1) AS query_text,
    db_name(st.dbid) AS database_name
FROM sys.dm_exec_query_stats qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) st
ORDER BY TotalCPU_ms DESC;


