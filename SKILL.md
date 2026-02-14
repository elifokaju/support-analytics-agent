---
name: support-analytics
description: Answer questions about support ticket data by querying SQLite and interpreting results. Use when asked about ticket volume, trends, resolution times, agent workload, or issue patterns.
---

# Support Analytics Agent

Answer support analytics questions by combining SQL queries with natural language interpretation.

## Data Source

SQLite database: `data/tickets.db`

**Schema:**
```sql
CREATE TABLE tickets (
    ticket_id TEXT PRIMARY KEY,
    created_at TEXT,        -- ISO timestamp
    resolved_at TEXT,       -- ISO timestamp (NULL if open)
    status TEXT,            -- open, resolved
    issue_type TEXT,        -- fraud, transfer, card, account
    urgency TEXT,           -- low, medium, high, critical
    customer_id TEXT,
    assigned_to TEXT        -- agent name
);
```

## Workflow

1. **Understand the question** — What metric or insight is the user asking for?
2. **Select or build query** — Use a pre-built query from `queries/` or construct one
3. **Execute query** — Run against SQLite using: `sqlite3 data/tickets.db "SELECT ..."`
4. **Interpret results** — Explain what the numbers mean, not just what they are
5. **Recommend action** — If something looks unusual, suggest next steps

## Pre-built Queries

| Question Pattern | Query File | What It Returns |
|------------------|------------|-----------------|
| "Top issues" / "What's trending" | `queries/top-issues.sql` | Issue types ranked by volume, week-over-week change |
| "Resolution time" / "How long to resolve" | `queries/resolution-time.sql` | Avg hours by issue type |
| "Daily volume" / "Ticket trend" | `queries/daily-volume.sql` | Daily counts with fraud breakdown |
| "What's open" / "Current queue" | `queries/open-tickets.sql` | Open tickets grouped by urgency |
| "Agent workload" / "Distribution" | `queries/agent-workload.sql` | Tickets per agent with resolution stats |

If no pre-built query matches, construct a simple SELECT against the schema above.

## Response Format

### For quick questions:
```
[Key finding in 1-2 sentences with specific numbers]

[Comparison to baseline or previous period if available]

[Recommendation if something looks unusual]
```

### For summary requests ("give me a report"):
```
## Support Summary — [Date Range]

**Volume:** [total tickets] ([change from previous period])

**Top Issues:**
1. [Issue] — [count] ([trend])
2. [Issue] — [count] ([trend])

**Flagged:**
- [Any anomaly worth investigating]

**Recommendation:** [One actionable next step]
```

## Issue Type Reference

| Type | Covers |
|------|--------|
| fraud | Unauthorized transactions, account takeover, suspicious activity |
| transfer | Money transfer issues, delays, failures |
| card | Card delivery, activation, transaction problems |
| account | Login issues, profile changes, verification |

## Interpretation Guidelines

- **Spikes >50%** week-over-week = flag for investigation
- **Resolution time >24h** for high priority = flag as SLA risk
- **Single agent >30%** of tickets = potential bottleneck
- **Fraud increases** always warrant immediate callout

## Example

**User:** "What are the top issues this week?"

**Agent actions:**
1. Run `sqlite3 data/tickets.db < queries/top-issues.sql`
2. Get results: fraud 19 (+171%), transfer 11 (+57%), card 8 (+100%), account 4 (+33%)
3. Interpret and respond:

> Fraud is your top issue this week with 19 tickets — up 171% from last week. This spike needs immediate attention.
>
> Transfer issues are second at 11 tickets (+57%). Card issues doubled but remain lower volume at 8.
>
> **Recommendation:** Investigate the fraud spike to identify if there's a specific pattern or attack vector driving the increase.
