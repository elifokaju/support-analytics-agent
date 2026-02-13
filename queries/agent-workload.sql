-- Agent workload distribution
-- Shows how tickets are distributed across agents

SELECT
  assigned_to,
  COUNT(*) as total_tickets,
  COUNT(CASE WHEN status = 'open' THEN 1 END) as open_tickets,
  ROUND(AVG(TIMESTAMP_DIFF(resolved_at, created_at, MINUTE)) / 60.0, 1) as avg_hours
FROM `support_tickets.tickets`
GROUP BY assigned_to
ORDER BY total_tickets DESC
