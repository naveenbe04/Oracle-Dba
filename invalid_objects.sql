SELECT owner, object_type, object_name, status
FROM dba_objects
WHERE status='INVALID'
ORDER BY owner, object_type;
