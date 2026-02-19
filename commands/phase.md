---
description: Work on a specific design phase (A-M)
allowed-tools: Read, Write, Edit, Glob, Grep, Bash(ls:*), AskUserQuestion, WebSearch, WebFetch
argument-hint: "[A-M] or phase name (e.g., A, B, 'market research')"
---

# Work on Design Phase

Guide the user through the specified design phase using a smart adaptive approach.

## Step 1: Identify the Phase

Map the argument "$ARGUMENTS" to a phase:
- **A** or "market research" → A. Market and Opportunity Research (tasks 1-10)
- **B** or "customer discovery" → B. Customer Discovery and Research (tasks 11-23)
- **C** or "problem definition" → C. Problem Definition and Framing (tasks 24-32)
- **D** or "strategy" or "vision" → D. Product Strategy and Vision (tasks 33-43)
- **E** or "requirements" → E. Requirements Definition (tasks 44-61)
- **F** or "information architecture" or "IA" → F. Information Architecture and Interaction Design (tasks 62-78)
- **G** or "visual design" or "UI" → G. Visual and UI Design (tasks 79-96)
- **H** or "prototyping" or "validation" → H. Prototyping and Validation (tasks 97-108)
- **I** or "technical" or "architecture" → I. Technical Design and Architecture Planning (tasks 109-127)
- **J** or "analytics" or "metrics" → J. Analytics, Metrics, and Instrumentation Design (tasks 128-137)
- **K** or "content" or "copy" → K. Content and Copy Design (tasks 138-146)
- **L** or "GTM" or "go-to-market" or "launch" → L. Go-to-Market Design (tasks 147-156)
- **M** or "operations" or "process" → M. Operational and Process Design (tasks 157-166)

If no argument provided or unrecognized, ask the user which phase to work on.

## Step 2: Load Current State

1. Read `product-management/checklist.md` to see which tasks in this phase are complete vs. remaining
2. Read CLAUDE.md for tool preferences and product context
3. Scan `product-management/` subdirectories for existing artifacts from this phase

If checklist doesn't exist, suggest running `/pm:init` first.

## Step 3: Present Phase Overview

Show the phase status:

```
## Phase [X]: [Phase Name]

Progress: [completed]/[total] tasks complete

### Completed
- [x] Task description...

### Remaining
- [ ] Task description... ← SUGGESTED NEXT
- [ ] Task description...
```

## Step 4: Suggest Priority Tasks

Analyze remaining tasks and suggest which to tackle next based on:

1. **Sequential dependencies** — Some tasks naturally build on others (e.g., define ICP before conducting interviews)
2. **Artifact dependencies** — Tasks that produce artifacts needed by later phases
3. **Quick wins** — Tasks that are straightforward and provide immediate value
4. **Blocking tasks** — Tasks that block progress in other phases

Present 2-3 recommended next tasks with brief rationale.

## Step 5: Guide Through Selected Tasks

When the user selects a task (or accepts the suggestion):

1. **Provide context** — Explain what this task involves and why it matters
2. **Ask targeted questions** — Gather information needed to complete the task (product-specific details, decisions, preferences)
3. **Generate artifacts** — Create the appropriate document using templates from `${CLAUDE_PLUGIN_ROOT}/skills/saas-pm-playbook/references/artifact-templates.md`
4. **Save artifacts** — Write to the correct subdirectory under `product-management/`
5. **Update checklist** — Mark the task as complete in `product-management/checklist.md` by changing `- [ ]` to `- [x]`
6. **Route by tool preference** — Check CLAUDE.md for the user's configured tool for this artifact type. If a tool is configured (Notion, Linear, etc.), create the artifact there as the primary target. Use local markdown only as a fallback when no tool is configured for that duty

## Step 6: After Task Completion

After completing a task:

1. Show updated phase progress
2. Suggest the next task to work on
3. Ask if the user wants to continue with this phase or switch to something else

## Important Guidelines

- Use the saas-pm-playbook skill for methodology knowledge and templates
- Check CLAUDE.md for tool preferences before generating artifacts
- Always update the checklist after completing a task
- For research-heavy tasks (market research, customer discovery), offer to use WebSearch to gather real data
- For strategy tasks, reference completed research artifacts to inform decisions
- Keep artifacts practical and actionable, not academic
- Tailor advice to solo founders — skip tasks that only apply to large teams unless the user requests them
