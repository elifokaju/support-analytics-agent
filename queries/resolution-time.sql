-- Average resolution time by issue type
-- Shows which issues take longest to resolve

SELECT
  issue_type,
  ROUND(AVG(TIMESTAMP_DIFF(resolved_at, created_at, MINUTE)) / 60.0, 1) as avg_hours
FROM `support_tickets.tickets`
WHERE resolved_at IS NOT NULL
GROUP BY issue_type
ORDER BY avg_hours DESC
