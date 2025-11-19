SELECT 
    qsqt.query_sql_text,
    qsp.plan_id,
    qsr.avg_duration,
    qsr.last_execution_time
FROM sys.query_store_query_text AS qsqt
JOIN sys.query_store_query AS qsq
    ON qsqt.query_text_id = qsq.query_text_id
JOIN sys.query_store_plan AS qsp
    ON qsq.query_id = qsp.query_id
JOIN sys.query_store_runtime_stats AS qsr
    ON qsp.plan_id = qsr.plan_id
ORDER BY qsr.avg_duration DESC;
