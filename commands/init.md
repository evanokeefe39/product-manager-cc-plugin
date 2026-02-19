---
description: Initialize a new SaaS product management project
allowed-tools: Read, Write, Edit, Glob, Grep, Bash(ls:*), AskUserQuestion, ListMcpResourcesTool
argument-hint: [product-name]
---

# Product Management Project Initialization

Initialize a new SaaS product management project for "$ARGUMENTS" (or ask for a product name if none provided).

## Step 1: Detect Installed Tools

Scan the environment for product management-relevant tools:

1. Use `ListMcpResourcesTool` to check for available MCP servers
2. Check for these PM-relevant tools and note which are available:
   - **Notion** — for documentation, wikis, databases
   - **Linear** — for task tracking, sprints, roadmap
   - **Jira** — for task/issue tracking
   - **GitHub** — for code repos, issues, project boards
   - **Slack** — for team communication
   - **PostHog** — for product analytics, feature flags
   - **Tinybird** — for analytics queries, dashboards
   - **Figma** — for design files
   - **Confluence** — for documentation

3. Present findings to the user:
   ```
   Detected tools:
   - [Tool name] (available via MCP)
   ...

   Not detected:
   - [Tool name]
   ...
   ```

## Step 2: Ask User Preferences

Use AskUserQuestion to ask the user which tools they want to use for each PM duty:

- **Documentation & knowledge base** — Options: [detected tools that fit], Local markdown (default)
- **Task tracking & roadmap** — Options: [detected tools that fit], Local checklist (default)
- **Analytics & metrics** — Options: [detected tools that fit], Define later
- **Design artifacts** — Options: [detected tools that fit], Local references

Default to "Local markdown" for any category where the user doesn't have a preference or tool.

## Step 3: Create Project Structure

Create the following directory structure:

```
product-management/
├── checklist.md
├── market-research/
├── customer-discovery/
├── problem-definition/
├── strategy/
├── requirements/
├── information-architecture/
├── visual-design/
├── prototyping/
├── technical-architecture/
├── analytics/
├── content/
├── go-to-market/
└── operations/
```

## Step 4: Generate Checklist

Create `product-management/checklist.md` with the full 166-task checklist. Load the task list from the saas-pm-playbook skill's `references/playbook-tasks.md` reference file. Format as a markdown checklist:

```markdown
# [Product Name] — Design Phase Checklist

**Started**: [today's date]
**Current Phase**: A - Market & Opportunity Research

## Progress Summary
| Phase | Tasks | Completed | Status |
|-------|-------|-----------|--------|
| A. Market Research | 10 | 0 | Not started |
| B. Customer Discovery | 13 | 0 | Not started |
| ... (all 13 phases) |

---

## A. Market and Opportunity Research

- [ ] 1. Define the target market segment(s)...
- [ ] 2. Estimate TAM, SAM, SOM...
... (all tasks as checkboxes)
```

## Step 5: Update CLAUDE.md

Read the existing CLAUDE.md if it exists (or create a new one). Append or update a "Product Management Configuration" section:

```markdown
## Product Management Configuration

### Product
- **Name**: [product name]
- **Initialized**: [date]
- **Checklist**: `product-management/checklist.md`

### Tool Preferences
- **Documentation**: [chosen tool or "Local markdown"]
- **Task Tracking**: [chosen tool or "Local checklist"]
- **Analytics**: [chosen tool or "Define later"]
- **Design**: [chosen tool or "Local references"]
- **Default Output**: Local markdown in `product-management/` directory
```

Do NOT overwrite existing CLAUDE.md content — only append/update the PM section.

## Step 6: Summary

Present a summary:
- Product name and initialization date
- Tool preferences configured
- Directory structure created
- Next steps: suggest starting with Phase A (Market Research) using `/pm:phase A`
