-- Average resolution time by issue type
-- Shows which issues take longest to resolve

SELECT
  issue_type,
  ROUND(AVG((julianday(resolved_at) - julianday(created_at)) * 24), 1) as avg_hours
FROM tickets
WHERE resolved_at IS NOT NULL
GROUP BY issue_type
ORDER BY avg_hours DESC
