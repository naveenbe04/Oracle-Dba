##FRA Health & Risk Predictor Script
SELECT
    name,
    space_limit/1024/1024/1024 AS fra_size_gb,
    space_used/1024/1024/1024 AS used_gb,
    space_reclaimable/1024/1024/1024 AS reclaimable_gb,
    ROUND((space_used/space_limit)*100,2) AS used_pct,
    CASE
        WHEN (space_used/space_limit)*100 > 90 THEN 'CRITICAL'
        WHEN (space_used/space_limit)*100 > 75 THEN 'WARNING'
        ELSE 'SAFE'
    END fra_status
FROM v$recovery_file_dest;
