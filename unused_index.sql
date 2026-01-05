##querry to find the unused index
SELECT
    owner,
    index_name,
    table_name
FROM dba_indexes
WHERE last_analyzed < SYSDATE - 180
AND owner NOT IN ('SYS','SYSTEM');
