# Support Analytics Agent

An agent that answers questions about support ticket data by combining SQL queries with natural language interpretation.

## What This Is

A demo for the AI Implementation Specialist role at Wise.

## How to Test

1. Run a SQL query in BigQuery against the sample data
2. Copy the results
3. Paste the prompt (`prompt.md`) into any LLM
4. Paste the query results
5. Ask your question

See `examples/test-case.md` for a complete walkthrough.

## What's Included

```
support-analytics-agent/
├── README.md           # This file
├── prompt.md           # Agent instructions
├── queries/
│   ├── top-issues.sql      # Issues this week vs last week
│   ├── resolution-time.sql # Avg resolution by issue type
│   ├── daily-volume.sql    # Daily ticket trend
│   ├── open-tickets.sql    # What's in the queue now
│   └── agent-workload.sql  # Work distribution
├── data/
│   └── sample-tickets.csv  # Sample data (loaded into BigQuery)
└── examples/
    └── test-case.md        # Step-by-step test
```

## Sample Questions

- "What are the top issues this week?"
- "Is resolution time getting better or worse?"
- "What's in the queue right now?"
- "How is workload distributed across agents?"
- "Give me a summary I can share with the team"

## BigQuery Setup

Dataset: `support_tickets`
Table: `tickets`

The sample data includes 63 tickets across two weeks, with a fraud spike in week 2 to demonstrate trend detection.
