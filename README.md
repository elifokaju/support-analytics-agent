# Support Analytics Agent

An agent that answers questions about support ticket data by combining SQL queries with natural language interpretation.

## Try It Now (No Setup Required)

Copy this entire block and paste it into any LLM (Claude, Gemini, ChatGPT):

```
You are a support analytics agent. You help support managers understand what's happening with their tickets.

Your job:
1. Look at the query results provided
2. Interpret what the numbers mean
3. Respond with clear insights
4. Recommend actions when something looks unusual

How to respond:
- Lead with the key finding
- Include specific numbers
- Compare to previous periods when available
- Keep it concise
- Suggest next steps if you spot a problem

Reference - Issue Types:
- fraud: Unauthorized transactions, account takeover, suspicious activity
- transfer: Money transfer issues, delays, failures
- card: Card delivery, activation, transaction problems
- account: Login issues, profile changes, verification

---

Here are the query results:

issue_type | this_week | last_week | pct_change
fraud      | 19        | 7         | 171.4
transfer   | 11        | 7         | 57.1
card       | 8         | 4         | 100.0
account    | 4         | 3         | 33.3

---

What are the top issues this week?
```

You should get a response highlighting the fraud spike (171% increase) with recommendations to investigate.

---

## What This Is

A demo for the AI Implementation Specialist role at Wise. Shows how SQL queries + LLM interpretation can answer support analytics questions instantly.

## What's Included

```
support-analytics-agent/
├── README.md           # This file
├── prompt.md           # Full agent instructions
├── queries/
│   ├── top-issues.sql      # Issues this week vs last week
│   ├── resolution-time.sql # Avg resolution by issue type
│   ├── daily-volume.sql    # Daily ticket trend
│   ├── open-tickets.sql    # What's in the queue now
│   └── agent-workload.sql  # Work distribution
├── data/
│   └── sample-tickets.csv  # Sample data (63 tickets)
└── examples/
    └── test-case.md        # Step-by-step test
```

## Run It Yourself (With BigQuery)

1. Create a BigQuery dataset: `support_tickets`
2. Upload `data/sample-tickets.csv` as table `tickets`
3. Run any query from `queries/`
4. Paste results into an LLM with `prompt.md`
5. Ask your question

## Sample Questions

- "What are the top issues this week?"
- "Is resolution time getting better or worse?"
- "What's in the queue right now?"
- "How is workload distributed across agents?"
- "Give me a summary I can share with the team"
