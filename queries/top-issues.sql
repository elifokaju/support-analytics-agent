-- Top issues this week vs last week
-- Shows which issue types are trending up or down

SELECT
  issue_type,
  COUNT(CASE WHEN created_at >= '2024-02-05' THEN 1 END) as this_week,
  COUNT(CASE WHEN created_at < '2024-02-05' THEN 1 END) as last_week,
  ROUND(
    (COUNT(CASE WHEN created_at >= '2024-02-05' THEN 1 END) -
     COUNT(CASE WHEN created_at < '2024-02-05' THEN 1 END)) * 100.0 /
    NULLIF(COUNT(CASE WHEN created_at < '2024-02-05' THEN 1 END), 0), 1
  ) as pct_change
FROM `support_tickets.tickets`
GROUP BY issue_type
ORDER BY this_week DESC
