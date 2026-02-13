# Test Case: "What are the top issues this week?"

## Step 1: Run the SQL query

In BigQuery, run `queries/top-issues.sql`:

```sql
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
```

## Step 2: Get the results

```
issue_type | this_week | last_week | pct_change
fraud      | 19        | 7         | 171.4
transfer   | 11        | 7         | 57.1
card       | 8         | 4         | 100.0
account    | 4         | 3         | 33.3
```

## Step 3: Ask the agent

Open any LLM (Claude, Gemini, ChatGPT) and paste:

1. The contents of `prompt.md`
2. Then say: "Here are the query results:"
3. Paste the results above
4. Ask: "What are the top issues this week?"

## Step 4: Expected response

The agent should respond with something like:

> "Fraud is your top issue this week with 19 tickets, up 171% from last week. This is a significant spike that needs attention.
>
> Transfer issues are second with 11 tickets (up 57%). Card issues doubled but remain lower volume at 8 tickets.
>
> Recommend investigating the fraud spike to identify if there's a specific pattern or fraud type driving the increase."
