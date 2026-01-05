##Track recent object changes.
SELECT
    owner,
    object_name,
    object_type,
    last_ddl_time
FROM dba_objects
WHERE last_ddl_time > SYSDATE - 1
ORDER BY last_ddl_time DESC;
