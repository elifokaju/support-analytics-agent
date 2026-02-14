# Support Analytics Agent

An agent skill that answers questions about support ticket data by combining SQL queries with natural language interpretation.

## Install

```bash
npx skills add elifokaju/support-analytics-agent
```

Works with Claude Code, Cursor, Windsurf, and [40+ other AI coding agents](https://github.com/vercel-labs/skills).

## Try It Manually

```bash
# Clone the repo
git clone https://github.com/elifokaju/support-analytics-agent.git
cd support-analytics-agent

# Run a query
sqlite3 -header -column data/tickets.db < queries/top-issues.sql
```

Then paste the results into any LLM with the prompt from `SKILL.md` and ask: "What are the top issues this week?"

## What This Demonstrates

| Skill | How It's Shown |
|-------|----------------|
| **SQL Proficiency** | 5 analytics queries covering volume, trends, resolution time, workload |
| **Prompt Engineering** | SKILL.md structures how the agent interprets and responds |
| **Agent Design** | Clear workflow: understand → query → interpret → recommend |
| **Practical Application** | Real support analytics use case with sample data |

## Structure

```
support-analytics-agent/
├── SKILL.md              # Agent instructions (the "brain")
├── data/
│   ├── tickets.db        # SQLite database (63 tickets)
│   └── sample-tickets.csv
├── queries/
│   ├── top-issues.sql        # Week-over-week comparison
│   ├── resolution-time.sql   # Avg hours by issue type
│   ├── daily-volume.sql      # Daily trend with fraud breakdown
│   ├── open-tickets.sql      # Current queue by urgency
│   └── agent-workload.sql    # Distribution across agents
└── README.md
```

## Sample Output

**Query:** `top-issues.sql`
```
issue_type  this_week  last_week  pct_change
fraud       19         7          171.4
transfer    11         7          57.1
card        8          4          100.0
account     4          3          33.3
```

**Agent Response:**
> Fraud is your top issue this week with 19 tickets — up 171% from last week. This spike needs immediate attention.
>
> Transfer issues are second at 11 tickets (+57%). Card issues doubled but remain lower volume.
>
> **Recommendation:** Investigate the fraud spike to identify if there's a specific pattern driving the increase.

## Why This Pattern Works

1. **SQL handles the data** — Fast, precise, auditable queries
2. **LLM handles interpretation** — Context-aware insights humans can act on
3. **Pre-built queries reduce hallucination** — Agent selects from tested queries rather than generating SQL
4. **Portable** — Works with any LLM (Claude, Gemini, GPT) and any SQL database

## Extending This

To adapt for production:
- Replace SQLite with Snowflake/BigQuery connection
- Add query generation for ad-hoc questions
- Integrate with Slack/email for automated alerts
- Add Credal for security/governance layer
