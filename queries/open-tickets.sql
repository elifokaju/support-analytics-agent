-- Open tickets needing attention
-- Shows what's still in the queue by urgency

SELECT
  issue_type,
  urgency,
  COUNT(*) as open_tickets
FROM tickets
WHERE status = 'open'
GROUP BY issue_type, urgency
ORDER BY
  CASE urgency
    WHEN 'critical' THEN 1
    WHEN 'high' THEN 2
    WHEN 'medium' THEN 3
    ELSE 4
  END
