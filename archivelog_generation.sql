##quuery to find the archive log generation per hour
SELECT
    TO_CHAR(first_time,'DD-MON HH24') hour,
    ROUND(SUM(blocks*block_size)/1024/1024,2) arch_mb
FROM v$archived_log
GROUP BY TO_CHAR(first_time,'DD-MON HH24')
ORDER BY hour;
