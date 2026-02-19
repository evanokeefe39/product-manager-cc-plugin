---
name: Tool Detection & Integration
description: >-
  This skill should be used when the user asks to "set up product management tools",
  "detect installed tools", "configure PM integrations", "connect Notion for PM",
  "use Linear for tracking", or when initializing a new product management project
  that needs to detect and configure companion tools like Notion, Linear, Jira,
  GitHub, or Slack for product management workflows.
version: 0.1.0
---

# Tool Detection & Integration for Product Management

## Purpose

Detect companion tools (MCP servers, plugins) installed in the user's Claude Code environment and offer to integrate them into the product management workflow. Store preferences in CLAUDE.md so all future PM work uses the right systems.

## Detection Process

### Step 1: Scan for Installed MCPs

Check for MCP server configurations by reading available MCP resources and checking common configuration locations:

1. Read the project's `.mcp.json` if it exists
2. Check the global `~/.claude/.mcp.json` if accessible
3. Use the `ListMcpResourcesTool` to see what MCP servers are currently available
4. Look for known PM-relevant MCP server names in the results

### Step 2: Identify PM-Relevant Tools

Map detected tools to PM capabilities:

| Tool | PM Use Cases |
|------|-------------|
| **Notion** | Documentation, knowledge base, meeting notes, project wikis, databases for tracking |
| **Linear** | Task tracking, sprint planning, issue management, roadmap |
| **Jira** | Task tracking, sprint planning, backlog management |
| **GitHub** | Code repos, issues for technical tasks, project boards |
| **Slack** | Team communication, async updates, notifications |
| **Figma** | Design files, prototypes, design system |
| **PostHog** | Product analytics, feature flags, experiments, session replay |
| **Tinybird** | Analytics queries, data pipelines, metrics dashboards |
| **Google Docs** | Collaborative document editing |
| **Confluence** | Team documentation, knowledge base |

### Step 3: Present Findings and Ask Preferences

Present detected tools to the user in a clear summary:

```
I detected the following tools in your environment:
- Notion (MCP server configured)
- Linear (MCP server configured)
- PostHog (plugin installed)

These can be used for product management tasks:
- Documentation & knowledge base → Notion or local markdown
- Task tracking & roadmap → Linear or local checklist
- Analytics & metrics → PostHog
```

Ask the user which tools they want to use for each PM duty. Always offer "local markdown" as the default/fallback option.

### Step 4: Persist Preferences in CLAUDE.md

Write the user's tool preferences to the project's CLAUDE.md file (create if it doesn't exist, append a PM section if it does). Use this format:

```markdown
## Product Management Configuration

### Tool Preferences
- **Documentation**: Notion (workspace: [name])
- **Task Tracking**: Linear (team: [name])
- **Analytics**: PostHog (project: [name])
- **Design**: Figma (local references only)
- **Default Output**: Local markdown in `product-management/` directory

### Project Details
- **Product Name**: [name]
- **Current Phase**: [A-M indicator]
- **Checklist Location**: `product-management/checklist.md`
```

## Integration Patterns

### Notion Integration

When Notion is configured for documentation:
- Create pages for major artifacts (strategy doc, PRD, personas)
- Use Notion databases for structured data (competitive matrix, feature prioritization)
- Search existing Notion content for context before generating new artifacts
- Link Notion pages from the local checklist

### Linear Integration

When Linear is configured for task tracking:
- Create issues for actionable PM tasks
- Use labels to tag by workstream (A through M)
- Track phase progress through Linear project status
- Link Linear issues from the local checklist

### PostHog Integration

When PostHog is configured for analytics:
- Reference PostHog data when defining metrics and instrumentation plans
- Use PostHog feature flags documentation for Phase J tasks
- Query existing analytics for data-informed decisions

### Local Markdown (Default)

When no external tool is configured or preferred:
- Generate all artifacts as markdown files in `product-management/`
- Track progress in `product-management/checklist.md`
- Use frontmatter metadata for structured data
- Keep everything in the repo for version control

## Updating Preferences

If the user later installs new tools or wants to change preferences:
- Re-run tool detection via `/pm:init`
- Update the CLAUDE.md PM configuration section
- Migrate existing artifacts if the user requests it (e.g., copy markdown docs to Notion)

## Important Notes

- Always default to local markdown if no preference is stated
- Never assume a tool should be used just because it's installed — always ask
- Respect existing CLAUDE.md content — append or update the PM section, never overwrite the whole file
- Store tool preferences at the project level, not globally
