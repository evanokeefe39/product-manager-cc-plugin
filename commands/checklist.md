---
description: View and manage the 166-task design phase checklist
allowed-tools: Read, Write, Edit, Grep, Glob, AskUserQuestion
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

## Load Checklist

Read `product-management/checklist.md`.

If it doesn't exist, tell the user:
> No checklist found. Run `/pm:init [product-name]` to create one.

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

Analyze the checklist and recommend the next 3-5 tasks to work on:

1. Find the first incomplete phase (or partially complete)
2. Within that phase, identify tasks that:
   - Don't depend on other incomplete tasks
   - Produce artifacts needed by downstream tasks
   - Are quick wins that build momentum
3. Present recommendations with brief rationale

## Action: Search

Search all tasks for the keyword and show matching results with their phase and completion status.

## After Any Modification

After marking tasks complete or resetting them:
1. Recalculate the progress summary at the top of checklist.md
2. Show the updated count for the affected phase
3. Show overall progress (X/166 complete)
