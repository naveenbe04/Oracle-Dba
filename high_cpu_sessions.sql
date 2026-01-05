##querry to find high cpu sessions
SELECT
    s.sid,
    s.username,
    ROUND(t.value/100,2) cpu_seconds
FROM v$sesstat t
JOIN v$statname n ON t.statistic# = n.statistic#
JOIN v$session s ON t.sid = s.sid
WHERE n.name = 'CPU used by this session'
ORDER BY cpu_seconds DESC;
