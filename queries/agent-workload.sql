-- Agent workload distribution
-- Shows how tickets are distributed across agents

SELECT
  assigned_to,
  COUNT(*) as total_tickets,
  COUNT(CASE WHEN status = 'open' THEN 1 END) as open_tickets,
  ROUND(AVG((julianday(resolved_at) - julianday(created_at)) * 24), 1) as avg_hours
FROM tickets
GROUP BY assigned_to
ORDER BY total_tickets DESC
