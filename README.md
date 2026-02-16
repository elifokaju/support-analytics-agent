# Support Analytics Agent

Answer questions about support ticket data by combining SQL queries with natural language interpretation.

## The Problem

Support managers need quick answers about their tickets: What are the top issues? Is resolution time improving? Where should we focus today?

The data exists in the ticketing system, but getting to it means building reports or writing SQL.

## The Solution

An agent that answers questions instantly. Instead of building a report, you just ask:

> "What are the top issues this week?"

The agent queries the data, interprets the results, and responds:

> "Fraud is your top issue (127 tickets), up 23% from last week. Recommend checking for patterns."

## How It Works

```
Question → Agent → SQL (pulls data) → Agent (interprets) → Insight
```

**Capabilities:** Volume questions, trend tracking, top issues, anomaly detection, recommendations

**Output modes:** Quick answers for yourself, or formatted summaries to share with your team

## Install

```bash
npx skills add elifokaju/support-analytics-agent
```

Works with [Claude Code](https://claude.ai/code), [Cursor](https://cursor.com), [Windsurf](https://codeium.com/windsurf), and [40+ other AI coding agents](https://github.com/vercel-labs/skills).

## Usage

After installing, ask questions like:

- "What are the top issues this week?"
- "How long does it take to resolve tickets?"
- "Which agent has the heaviest workload?"
- "Give me a summary I can share with the team"

The agent queries the SQLite database and interprets results with actionable insights.
