---
description: Show product management progress dashboard
allowed-tools: Read, Grep, Glob, ListMcpResourcesTool
---

# Product Management Status Dashboard

Display the current progress across all 13 design phase workstreams.

## Step 1: Load Checklist and Tool Preferences

Read `product-management/checklist.md` to get the current state of all tasks.

If the checklist file does not exist, inform the user:
> No product management project found. Run `/pm:init [product-name]` to get started.

Also read CLAUDE.md for tool preferences. If a task tracking tool is configured (Linear, Jira, etc.), query it for authoritative status alongside the local checklist. If the external tracker and local checklist differ, show both sources and note the discrepancy.

## Step 2: Calculate Progress

For each of the 13 phases (A through M), count:
- Total tasks in the phase
- Completed tasks (lines matching `- [x]`)
- Remaining tasks (lines matching `- [ ]`)
- Completion percentage

## Step 3: Display Dashboard

Present a clear progress dashboard:

```
# [Product Name] — Design Phase Progress

Overall: [X]/166 tasks complete ([Y]%)

| Phase | Workstream                        | Done | Total | Progress |
|-------|-----------------------------------|------|-------|----------|
| A     | Market & Opportunity Research     | X/10 |  10   | ████░░ X% |
| B     | Customer Discovery & Research     | X/13 |  13   | ░░░░░░ X% |
| C     | Problem Definition & Framing      | X/9  |   9   | ░░░░░░ X% |
| D     | Product Strategy & Vision         | X/11 |  11   | ░░░░░░ X% |
| E     | Requirements Definition           | X/18 |  18   | ░░░░░░ X% |
| F     | IA & Interaction Design           | X/17 |  17   | ░░░░░░ X% |
| G     | Visual & UI Design                | X/18 |  18   | ░░░░░░ X% |
| H     | Prototyping & Validation          | X/12 |  12   | ░░░░░░ X% |
| I     | Technical Design & Architecture   | X/19 |  19   | ░░░░░░ X% |
| J     | Analytics & Instrumentation       | X/10 |  10   | ░░░░░░ X% |
| K     | Content & Copy Design             | X/9  |   9   | ░░░░░░ X% |
| L     | Go-to-Market Design               | X/10 |  10   | ░░░░░░ X% |
| M     | Operational & Process Design      | X/10 |  10   | ░░░░░░ X% |
```

## Step 4: Recommendations

Based on the current progress, suggest:

1. **Current focus** — Which phase is actively in progress (partially complete)
2. **Next up** — What phase to start next based on dependencies
3. **Quick wins** — Any tasks that are easy to complete and would unblock other work

Remind the user they can work on a specific phase with `/pm:phase [A-M]`.

## Step 5: Check for Artifacts

Scan the `product-management/` subdirectories for generated artifacts. List any key documents that have been created:

```
Generated Artifacts:
- market-research/competitive-analysis.md
- customer-discovery/persona-founder.md
- problem-definition/problem-statement.md
...
```

## Step 6: Show Tool Configuration

If CLAUDE.md has tool preferences configured, display them:

```
Configured Tools:
- Documentation: Notion (primary) | Local markdown (fallback)
- Task Tracking: Linear (primary) | Local checklist (fallback)
- Analytics: PostHog
```

If an external tracker is configured, note that it is the authoritative source for task status and suggest checking there for the most up-to-date state.
