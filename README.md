# Product Manager — Claude Code Plugin

A comprehensive SaaS product management plugin that guides solo founders through the complete design phase — from initial concept to validated, buildable specification. Based on a 166-task playbook covering 13 workstreams.

## Features

- **Full Playbook Coverage** — 13 workstreams (A-M) with 166 tracked tasks
- **Smart Progress Tracking** — Markdown checklist with completion percentages
- **Artifact Generation** — Templates for PRDs, personas, competitive analyses, strategy docs, and more
- **Tool Detection** — Auto-detects Notion, Linear, PostHog, and other MCPs; stores preferences in CLAUDE.md
- **Adaptive Workflow** — Suggests priority tasks based on progress and dependencies

## Installation

### Local Testing

```bash
claude --plugin-dir /path/to/product-manager-cc-plugin
```

### Project Installation

Copy to your project's `.claude-plugin/` directory or add to your plugin configuration.

## Commands

| Command | Description |
|---------|-------------|
| `/pm:init [product-name]` | Initialize a new PM project, detect tools, create checklist |
| `/pm:status` | Show progress dashboard across all 13 workstreams |
| `/pm:phase [A-M]` | Work on a specific design phase with guided tasks |
| `/pm:generate [type]` | Generate a specific artifact (persona, prd, strategy, etc.) |
| `/pm:checklist [action]` | View/manage the 166-task checklist |

## Artifact Types

Generate any of these with `/pm:generate [type]`:

- `competitive-analysis` — Competitive landscape analysis
- `persona` — User persona document
- `problem-statement` — Problem statement
- `product-brief` — One-page product brief
- `strategy` — Product strategy document
- `positioning` — Positioning document
- `prd` — Product requirements document
- `user-stories` — User stories with acceptance criteria
- `mvp` — MVP scope definition
- `architecture` — Technical architecture document
- `metrics` — Metrics & analytics plan
- `launch-plan` — Go-to-market plan
- And more (see `/pm:generate` for full list)

## The 13 Workstreams

| Phase | Workstream | Tasks |
|-------|-----------|-------|
| A | Market & Opportunity Research | 10 |
| B | Customer Discovery & Research | 13 |
| C | Problem Definition & Framing | 9 |
| D | Product Strategy & Vision | 11 |
| E | Requirements Definition | 18 |
| F | Information Architecture & Interaction Design | 17 |
| G | Visual & UI Design | 18 |
| H | Prototyping & Validation | 12 |
| I | Technical Design & Architecture | 19 |
| J | Analytics, Metrics & Instrumentation | 10 |
| K | Content & Copy Design | 9 |
| L | Go-to-Market Design | 10 |
| M | Operational & Process Design | 10 |

## Getting Started

1. Run `/pm:init My SaaS Product` to initialize
2. The plugin detects your installed tools and asks preferences
3. Run `/pm:status` to see the dashboard
4. Run `/pm:phase A` to start with market research
5. Use `/pm:generate` to create specific artifacts anytime

## Tool Integration

The plugin auto-detects and integrates with:

- **Notion** — Documentation, wikis, databases
- **Linear** — Task tracking, sprints, roadmap
- **PostHog** — Product analytics, feature flags
- **Tinybird** — Analytics queries, dashboards
- **GitHub** — Issues, project boards

Preferences are stored in your project's `CLAUDE.md` for persistence across sessions.

## Project Structure

When initialized, the plugin creates:

```
product-management/
├── checklist.md              # Master 166-task checklist
├── market-research/          # Phase A artifacts
├── customer-discovery/       # Phase B artifacts
├── problem-definition/       # Phase C artifacts
├── strategy/                 # Phase D artifacts
├── requirements/             # Phase E artifacts
├── information-architecture/ # Phase F artifacts
├── visual-design/            # Phase G artifacts
├── prototyping/              # Phase H artifacts
├── technical-architecture/   # Phase I artifacts
├── analytics/                # Phase J artifacts
├── content/                  # Phase K artifacts
├── go-to-market/             # Phase L artifacts
└── operations/               # Phase M artifacts
```
