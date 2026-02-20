---
description: View and manage the 166-task design phase checklist
allowed-tools: Read, Write, Edit, Grep, Glob, AskUserQuestion, ListMcpResourcesTool
argument-hint: "[action] (e.g., show, complete 5, reset 12, phase A)"
---

# Product Management Checklist Manager

View and manage the 166-task SaaS product design phase checklist.

## Parse the Action

Interpret "$ARGUMENTS" as one of these actions:

- **No argument** or `show` → Show full checklist summary with progress
- **`complete [number]`** or `done [number]` → Mark task(s) as complete
- **`reset [number]`** or `undo [number]` → Mark task(s) as incomplete
- **`phase [A-M]`** → Show tasks for a specific phase only
- **`next`** → Show the next recommended tasks to work on
- **`search [keyword]`** → Search tasks by keyword

## Load Checklist and Tool Preferences

Read `product-management/checklist.md`.

If it doesn't exist, tell the user:
> No checklist found. Run `/pm:init [product-name]` to create one.

Also read CLAUDE.md for task tracking tool preferences. If an external tracker is configured (Linear, Jira, GitHub Issues, etc.):
- When marking tasks complete, also update the corresponding issue in the external tracker
- When showing status, note that external tracking is configured and suggest checking there for the authoritative state
- Use `ListMcpResourcesTool` to verify the external tracker is accessible

## Action: Show (default)

Display the progress summary table showing completion for each phase, then the overall progress. Same format as `/pm:status` but focused on the checklist.

## Action: Complete / Done

Mark the specified task number(s) as complete:

1. Find the task line matching the number (e.g., task 5 → line with `- [ ] 5.`)
2. Change `- [ ]` to `- [x]`
3. Update the progress summary table at the top of the checklist
4. Save the file
5. Confirm what was marked complete

Support multiple tasks: `complete 5 6 7` or `complete 5-7`

Support phase-level completion: `complete A` marks all tasks in Phase A as complete. Confirm with the user before bulk-completing an entire phase.

## Action: Reset / Undo

Mark the specified task number(s) as incomplete:

1. Find the task line matching the number
2. Change `- [x]` to `- [ ]`
3. Update the progress summary table
4. Save the file
5. Confirm what was reset

## Action: Phase

Show all tasks for the specified phase with their completion status:

```
## Phase A: Market & Opportunity Research (3/10 complete)

- [x] 1. Define the target market segment(s)...
- [x] 2. Estimate TAM, SAM, SOM...
- [x] 3. Conduct industry and trend analysis...
- [ ] 4. Map the competitive landscape...
- [ ] 5. Perform deep competitive product teardowns...
...
```

## Action: Next

Analyze the checklist and recommend the next 3-5 tasks to work on **across all phases**, not just the first incomplete one. Users work iteratively across multiple workstreams simultaneously.

1. Scan **all phases** for incomplete tasks
2. Rank candidates by:
   - **Cross-phase dependencies** — tasks that unblock work in other phases (e.g., defining ICP in B unblocks positioning in D and pricing in L)
   - **Artifact dependencies** — tasks that produce artifacts needed by downstream tasks in any phase
   - **Cluster momentum** — if a phase is nearly complete, suggest finishing it
   - **Quick wins** — straightforward tasks that build momentum
   - **User's recent focus** — if they've been working on phases D and J, suggest related tasks in those areas
3. Present recommendations grouped by theme rather than phase order, with brief rationale for each

## Action: Search

Search all tasks for the keyword and show matching results with their phase and completion status.

## After Any Modification

After marking tasks complete or resetting them:
1. Recalculate the progress summary at the top of checklist.md
2. Show the updated count for the affected phase
3. Show overall progress (X/166 complete)
4. If an external task tracker is configured in CLAUDE.md, sync the status change there and confirm the update
