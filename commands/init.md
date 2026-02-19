---
description: Initialize a new SaaS product management project
allowed-tools: Read, Write, Edit, Glob, Grep, Bash(ls:*), AskUserQuestion, ListMcpResourcesTool
argument-hint: [product-name]
---

# Product Management Project Initialization

Initialize a new SaaS product management project for "$ARGUMENTS" (or ask for a product name if none provided).

## Step 1: Project Assessment (Brownfield/Greenfield Detection)

Before configuring tools, assess the current project state to determine whether this is a new (greenfield) or existing (brownfield) project.

### Scan for Existing Signals

Check for the presence of:
- `README.md`, `package.json`, common framework files (existing codebase)
- `docs/`, `product-management/`, `specs/`, `requirements/` (existing documentation)
- `CLAUDE.md` with PM configuration (previous PM initialization)
- Notion pages, Linear projects, or other external PM artifacts referenced in project files

### Brownfield Path (existing signals detected)

If any signals are found, interview the user:

1. "I see this is an existing project with [detected signals]. Do you have existing product management documents or artifacts?"
2. "Where do your current docs live?" (Notion, Confluence, Google Docs, local markdown, etc.)
3. "Do you already track tasks somewhere?" (Linear, Jira, GitHub Issues, etc.)
4. "How should we handle existing artifacts?"
   - **Preserve**: Keep existing docs as-is and layer the PM checklist alongside them
   - **Migrate**: Import/reference existing artifacts into the new PM structure
   - **Start fresh**: Create everything from scratch (existing docs remain but aren't linked)

Pass the user's answers to Step 2 so tool detection can pre-select detected tools as recommendations.

### Greenfield Path (no signals detected)

If no existing project signals are found:
- Note that this is a fresh start with no existing artifacts to reconcile
- In Step 2, recommend configured tools (Notion, Linear) over plain markdown — frame local markdown as the no-setup fallback option

## Step 2: Detect Tools and Configure Preferences

Use the **tool-detection** skill to detect installed companion tools (Notion, Linear, Jira, GitHub, Slack, PostHog, Tinybird, Figma, Confluence) and ask the user which tools they want to use for each PM duty (documentation, task tracking, analytics, design). The skill will persist preferences to CLAUDE.md.

Pass the project assessment context from Step 1:
- For brownfield projects: pre-select any tools the user said they already use
- For greenfield projects: recommend detected tools as the primary option, with local markdown as the fallback

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

Create `product-management/checklist.md` with the full 166-task checklist. Load the task list from `${CLAUDE_PLUGIN_ROOT}/skills/saas-pm-playbook/references/playbook-tasks.md`. Format as a markdown checklist:

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
