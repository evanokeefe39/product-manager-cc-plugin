---
name: Tool Detection & Integration
description: >-
  This skill should be used when the user asks to "set up product management tools",
  "detect installed tools", "configure PM integrations", "connect Notion for PM",
  "use Linear for tracking", "change documentation tool", "switch to Notion",
  "update PM tool preferences", "reconfigure PM tools", "add a new PM integration",
  or when initializing a new product management project that needs to detect and
  configure companion tools like Notion, Linear, Jira, GitHub, or Slack for product
  management workflows. Also activates mid-project when the user wants to change,
  add, or reconfigure their PM tool stack. Do NOT use for general MCP server setup,
  non-PM tool configuration, or debugging tool connectivity issues.
version: 0.1.0
---

# Tool Detection & Integration for Product Management

## Purpose

Detect companion tools (MCP servers, plugins) installed in the user's Claude Code environment and offer to integrate them into the product management workflow. Store preferences in CLAUDE.md so all future PM work uses the right systems.

## Triggers

This skill activates when:
- User runs `/pm:init` (called by the init command)
- User asks to set up, detect, or configure PM tools
- User wants to connect a specific tool (Notion, Linear, etc.) to their PM workflow
- User asks to change, switch, or reconfigure their PM tool preferences mid-project
- User installs a new MCP server and wants to integrate it with PM workflows

## Inputs

- **MCP server list** — from `ListMcpResourcesTool` and `.mcp.json` files
- **Existing preferences** — from CLAUDE.md PM configuration section (if any)
- **User request** — specific tool to configure or general setup request

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

Present detected tools to the user in a clear summary, actively recommending configured tools over local markdown.

**For greenfield projects** (no existing PM artifacts), recommend detected tools as the primary choice:

```
I detected the following tools in your environment:
- Notion (MCP server configured) — RECOMMENDED for documentation
  Provides better collaboration, search, and organization than local markdown files
- Linear (MCP server configured) — RECOMMENDED for task tracking
  Provides real-time status, assignments, and sprint planning beyond a local checklist
- PostHog (plugin installed) — RECOMMENDED for analytics
  Connects directly to your product data for metrics and experiments

Local markdown files are available as a no-setup fallback if you prefer to keep everything in the repo.
```

**For brownfield projects** (existing PM artifacts detected), ask whether to adopt detected tools or continue with existing systems:

```
I detected tools that could enhance your workflow:
- Notion (available) — You mentioned your docs currently live in [current location]. Would you like to adopt Notion going forward, or continue with your existing setup?
- Linear (available) — You currently track tasks in [current tracker]. Would you like to switch to Linear, or keep your current system?
```

Ask the user which tools they want to use for each PM duty. Frame configured tools as the primary option and local markdown as the fallback.

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

### Local Markdown (Fallback)

When no external tool is configured or available:
- Generate all artifacts as markdown files in `product-management/`
- Track progress in `product-management/checklist.md`
- Use frontmatter metadata for structured data
- Keep everything in the repo for version control

## Output Routing Rules

When generating artifacts or tracking tasks, use this priority hierarchy:

1. **If the user configured a tool for this duty** → use that tool as the primary target
2. **If no tool is configured but one is available** → suggest adopting it
3. **If no tool is available** → fall back to local markdown

All commands and agents should check CLAUDE.md for tool preferences before writing any artifact. The configured tool is the primary destination; local markdown is the fallback, not the default.

## Updating Preferences

If the user later installs new tools or wants to change preferences:
- Re-run tool detection via `/pm:init`
- Update the CLAUDE.md PM configuration section
- Migrate existing artifacts if the user requests it (e.g., copy markdown docs to Notion)

## Important Notes

- Fall back to local markdown if no preference is stated and no tool is available
- Never assume a tool should be used just because it's installed — always ask
- Respect existing CLAUDE.md content — append or update the PM section, never overwrite the whole file
- Store tool preferences at the project level, not globally

## Constraints and Guardrails

- Only configure tools the user explicitly approves — never auto-enable
- Do not modify global Claude Code configuration, only project-level CLAUDE.md
- Do not attempt to install or set up MCP servers — only detect what's already available
- When updating CLAUDE.md, preserve all existing content outside the PM section
