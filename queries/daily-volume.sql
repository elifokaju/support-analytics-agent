-- Daily ticket volume trend
-- Shows ticket counts per day with fraud breakdown

SELECT
  DATE(created_at) as date,
  COUNT(*) as tickets,
  COUNT(CASE WHEN issue_type = 'fraud' THEN 1 END) as fraud_tickets
FROM `support_tickets.tickets`
GROUP BY DATE(created_at)
ORDER BY date
