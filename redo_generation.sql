##Top SQLs Generating Redo
SELECT
    s.sql_id,
    s.parsing_schema_name,
    ROUND(s.delta_redo_bytes/1024/1024,2) AS redo_mb,
    s.executions_delta,
    SUBSTR(s.sql_text,1,80) sql_text
FROM dba_hist_sqlstat ss
JOIN dba_hist_sqltext s ON ss.sql_id = s.sql_id
WHERE ss.delta_redo_bytes > 0
ORDER BY ss.delta_redo_bytes DESC
FETCH FIRST 10 ROWS ONLY;
