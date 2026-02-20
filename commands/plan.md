---
description: Generate a goal-oriented task plan from remaining checklist tasks
allowed-tools: Read, Write, Edit, Glob, Grep, Bash(ls:*), AskUserQuestion, WebSearch, WebFetch
argument-hint: "[goal] (e.g., 'MVP in 4 weeks', 'investor demo for AI features', 'POC for onboarding flow')"
---

# Goal-Oriented Task Planner

Generate a focused, prioritized task plan by filtering the full 166-task checklist down to only what's needed for a specific goal.

## Step 1: Understand the Goal

If "$ARGUMENTS" is provided, parse it for:
- **Goal type**: POC, MVP, demo, alpha, beta, next release, or custom milestone
- **Priority constraints**: speed, completeness, audience impression, technical validation, etc.
- **Scope hints**: specific features, user segments, or product areas mentioned

If no argument or unclear, ask the user:

```
What are you trying to reach? Pick one or describe your own:

1. **POC** — Prove the core concept works (technical feasibility + basic UX)
2. **MVP** — Smallest launchable version that delivers real value to early users
3. **Investor demo** — Showcase the product vision and traction to a specific audience
4. **Alpha/Beta release** — Feature-complete enough for a structured testing program
5. **Custom milestone** — Describe what "done" looks like
```

Then ask follow-up questions as needed:
- "What's the time pressure?" (ASAP, specific date, no rush)
- "What features or areas matter most for this goal?"
- "Is there anything you definitely want to skip or defer?"
- "Who is the audience?" (yourself, users, investors, partners)

## Step 2: Load Current State

1. Read `product-management/checklist.md` to get completion status of all 166 tasks
2. Read CLAUDE.md for product context and tool preferences
3. Scan `product-management/` for existing artifacts that indicate progress beyond what's checked off

Count completed vs. remaining tasks per phase.

## Step 3: Filter Tasks by Goal

Apply goal-specific filters to the **remaining incomplete tasks**. Not every goal needs every phase.

### Goal Filters

**POC (Proof of Concept)**
- Required: C (problem definition — enough to scope), E (core requirements only — MVP use cases), I (technical architecture — stack + data model)
- Partial: A (just enough market context to justify), F (core flow wireframes only)
- Skip: B (deep discovery), G (visual polish), H (formal validation), J-K-L-M (operational overhead)
- Mindset: "Does this thing work and is the core idea viable?"

**MVP (Minimum Viable Product)**
- Required: A (market positioning), B (enough discovery to validate), C, D (strategy + positioning), E (full MVP requirements), F (IA + core flows), I (architecture)
- Partial: G (functional UI, not polished), H (lightweight validation), J (core metrics only), K (essential UI copy)
- Defer: L (launch plan — do closer to launch), M (process — keep lean)
- Mindset: "What's the smallest thing that delivers real value to real users?"

**Investor Demo**
- Required: A (market size + competitive landscape), C (problem statement), D (vision + strategy + positioning + moat)
- Partial: B (enough interviews to show customer evidence), E (headline features), G (polished screens for demo areas), H (clickable prototype of key flows)
- Scope to audience: If the investor cares about "AI features," filter further to tasks that produce artifacts about those specific features
- Skip: I (technical depth unless investor is technical), J-M (operational)
- Mindset: "What tells a compelling story about this opportunity?"

**Alpha / Beta Release**
- Required: A-F (all foundational work), G (functional design system), H (at least 1 round of testing), I (production architecture), J (core instrumentation)
- Partial: K (essential copy), L (beta program plan)
- Defer: M (full operational process)
- Mindset: "What do real test users need for a meaningful experience?"

**Custom Milestone**
- Map the user's description to the relevant phases and tasks
- Ask clarifying questions if the scope is ambiguous
- Apply the same dependency logic as other goals

### Within each included phase, further filter:

1. **Skip tasks already completed** — they're done
2. **Skip tasks irrelevant to the goal** — e.g., "design transactional email templates" isn't needed for a POC
3. **Keep tasks with downstream dependencies** — if task 24 (problem statement) is needed by task 35 (UVP), include both
4. **Respect user's stated priorities** — if they said "skip formal usability testing," drop those tasks even if the filter includes them

## Step 4: Order the Plan

Arrange the filtered tasks into a prioritized execution order:

1. **Dependency order** — tasks that unblock other tasks come first
2. **Phase clustering** — group related tasks so the user can work in focused sprints rather than context-switching constantly
3. **Quick wins early** — front-load tasks that are fast to complete and produce visible progress
4. **User's priority weighting** — if they said "features first," pull requirements and design tasks earlier; if "story first," pull strategy and market tasks earlier

## Step 5: Present the Plan

Output the plan in this format:

```markdown
## Plan: [Goal Description]

**Target**: [POC / MVP / Demo / etc.]
**Starting from**: [X]/166 tasks already complete
**Tasks in this plan**: [N] tasks across [M] phases
**Estimated effort**: [Light / Moderate / Significant] — based on task count and complexity

### Excluded Phases (not needed for this goal)
- Phase G: Visual & UI Design — POC doesn't need polish
- Phase L: Go-to-Market — premature for this milestone
- ...

---

### Sprint 1: [Theme Name] (e.g., "Foundation & Problem Framing")
*Tasks from phases A, B, C*

1. [ ] **Task 24** (Phase C) — Write problem statement ← *start here, anchors everything*
2. [ ] **Task 1** (Phase A) — Define target market segments
3. [ ] **Task 11** (Phase B) — Define initial ICP hypotheses
4. ...

### Sprint 2: [Theme Name] (e.g., "Core Requirements & Architecture")
*Tasks from phases E, I*

5. [ ] **Task 44** (Phase E) — Define primary use cases
6. [ ] **Task 46** (Phase E) — Define MVP scope
7. ...

### Sprint 3: ...

---

### Deferred (not needed for [goal], revisit later)
- Task 94: Design transactional email templates (Phase G)
- Task 148: Define beta program structure (Phase L)
- ...
```

## Step 6: Save and Next Steps

1. Save the plan to `product-management/plan-[goal-slug].md` (e.g., `plan-mvp.md`, `plan-investor-demo.md`)
2. Ask the user:
   - "Want to adjust anything — add, remove, or reorder tasks?"
   - "Ready to start working through this? I can begin with Sprint 1."
3. If they're ready, transition into working on the first sprint's tasks using the same flow as `/pm:phase` (guide through tasks, generate artifacts, update checklist)

## Important Guidelines

- A plan is a **view** over the checklist, not a separate tracking system — completing tasks in a plan updates `checklist.md`
- Multiple plans can coexist (e.g., an MVP plan and a separate investor demo plan)
- Plans can be regenerated at any time as priorities shift — they're cheap to produce
- Don't overwhelm: if the filtered list is still 80+ tasks, suggest narrowing the goal further
- Be opinionated about what to cut — the value of this command is *removing* tasks, not listing all of them
- Reference the full task descriptions from `${CLAUDE_PLUGIN_ROOT}/skills/saas-pm-playbook/references/playbook-tasks.md` when filtering
