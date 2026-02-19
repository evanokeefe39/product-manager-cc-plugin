# Artifact Templates & Structure Guides

This reference provides templates and structural guidance for each major PM artifact. Use these when generating documents for the user's product.

---

## Problem Statement

**File**: `problem-definition/problem-statement.md`

```markdown
# Problem Statement

## Who
[Target user/persona with specific characteristics]

## What
[The specific problem they face, described in concrete terms]

## Why It Matters
[Business impact, frequency, severity — quantified where possible]

## Current Workarounds
[How users solve this today and why those solutions fall short]

## Success Criteria
[What "solved" looks like from the customer's perspective]
```

---

## Product Brief (One-Pager)

**File**: `problem-definition/product-brief.md`

```markdown
# Product Brief: [Product Name]

## Opportunity
[2-3 sentences on the market opportunity]

## Problem
[The core problem being solved]

## Target Customer
[ICP description]

## Proposed Solution
[High-level solution approach]

## Key Differentiators
[What makes this different from alternatives]

## Business Model
[Revenue model overview]

## Success Metrics
[How success will be measured]

## Risks & Assumptions
[Key risks and what must be true for this to work]
```

---

## Persona Document

**File**: `customer-discovery/persona-[name].md`

```markdown
# Persona: [Name]

## Demographics
- **Role**: [Job title]
- **Company size**: [Range]
- **Industry**: [Sector]
- **Experience**: [Years in role]

## Goals
- [Primary goal]
- [Secondary goal]

## Pain Points
- [Pain point 1 — with severity and frequency]
- [Pain point 2]

## Current Workflow
[Step-by-step description of how they handle the problem today]

## Jobs to Be Done
- **Functional**: [What they need to accomplish]
- **Emotional**: [How they want to feel]
- **Social**: [How they want to be perceived]

## Buying Criteria
- [What matters most when choosing a solution]

## Quotes (from interviews)
> "[Verbatim quote illustrating a key insight]"

## Tools Currently Used
[List of tools in their current stack]
```

---

## Competitive Analysis

**File**: `market-research/competitive-analysis.md`

```markdown
# Competitive Landscape Analysis

## Market Overview
[Brief description of the market category and dynamics]

## Competitor Matrix

| Feature / Attribute | Our Product | Competitor A | Competitor B | Competitor C |
|---------------------|-------------|-------------|-------------|-------------|
| Core capability 1   |             |             |             |             |
| Core capability 2   |             |             |             |             |
| Pricing model       |             |             |             |             |
| Target segment      |             |             |             |             |
| GTM motion          |             |             |             |             |
| Key strength        |             |             |             |             |
| Key weakness        |             |             |             |             |

## Detailed Competitor Profiles

### [Competitor Name]
- **Overview**: [What they do]
- **Target market**: [Who they serve]
- **Pricing**: [Model and price points]
- **Strengths**: [What they do well]
- **Weaknesses**: [Where they fall short — from reviews, user feedback]
- **GTM approach**: [PLG, sales-led, etc.]

## Market Gaps & Opportunities
[Where competitors underserve the market]

## Positioning Implications
[How this analysis informs our positioning]
```

---

## Product Strategy Document

**File**: `strategy/product-strategy.md`

```markdown
# Product Strategy: [Product Name]

## Vision
[Aspirational statement of the future state being created]

## Mission
[Specific purpose and scope of the product]

## Target Customer
[ICP with specificity]

## Unique Value Proposition
[Why a customer should choose this over alternatives]

## Core Positioning
- **Category**: [What category does this create or compete in]
- **Target audience**: [Primary buyer/user]
- **Key benefit**: [Single most important benefit]
- **Differentiation**: [What makes this uniquely valuable]

## Business Model
- **Pricing model**: [Per seat, usage-based, etc.]
- **Tier structure**: [Free, Pro, Enterprise, etc.]
- **Billing**: [Monthly, annual, etc.]

## Go-to-Market Motion
[PLG, sales-led, hybrid — and why]

## Product Principles
1. [Principle 1 — guardrail for decisions]
2. [Principle 2]
3. [Principle 3]

## Moat Strategy
[What creates defensibility over time]

## 12-Month Roadmap Themes
- **Q1**: [Theme/outcome]
- **Q2**: [Theme/outcome]
- **Q3**: [Theme/outcome]
- **Q4**: [Theme/outcome]

## Key Metrics
- **North Star**: [Metric]
- **Activation**: [Metric]
- **Retention**: [Metric]
- **Revenue**: [Metric]
```

---

## PRD (Product Requirements Document)

**File**: `requirements/prd-[feature-area].md`

```markdown
# PRD: [Feature Area]

## Overview
[What this feature area does and why it matters]

## Background
[Context, research findings, and rationale]

## Goals
- [Measurable goal 1]
- [Measurable goal 2]

## Non-Goals (Explicitly Out of Scope)
- [What this does NOT include]

## Use Cases

### Use Case 1: [Name]
**As a** [persona], **I want to** [action] **so that** [outcome].

**Acceptance Criteria:**
- [ ] [Criterion 1]
- [ ] [Criterion 2]

## Functional Requirements
| ID | Requirement | Priority | Notes |
|----|-------------|----------|-------|
| FR-1 | [Requirement] | Must | |
| FR-2 | [Requirement] | Should | |

## Non-Functional Requirements
- **Performance**: [Targets]
- **Security**: [Requirements]
- **Accessibility**: [WCAG level]

## Data Requirements
[What data is needed, stored, displayed]

## Integration Requirements
[Third-party systems involved]

## Open Questions
- [Unresolved question 1]

## Success Metrics
[How feature success will be measured post-launch]
```

---

## User Flow Document

**File**: `information-architecture/user-flow-[name].md`

```markdown
# User Flow: [Flow Name]

## Trigger
[What initiates this flow]

## Actors
[Who is involved]

## Happy Path
1. [Step 1]
2. [Step 2]
3. [Step 3]
   → **Decision point**: [Condition]
   - If yes → [Step 4a]
   - If no → [Step 4b]

## Error States
- [Error condition] → [What happens]

## Empty States
- [When there's no data] → [What the user sees]

## Edge Cases
- [Edge case 1] → [Handling]
```

---

## Technical Architecture Document

**File**: `technical-architecture/architecture-overview.md`

```markdown
# Technical Architecture: [Product Name]

## Architecture Overview
[High-level architecture description and diagram]

## Technology Stack
| Layer | Choice | Rationale |
|-------|--------|-----------|
| Frontend | | |
| Backend | | |
| Database | | |
| Infrastructure | | |
| Auth | | |

## Data Model
[Core entities and relationships]

## API Design
[REST/GraphQL approach, key endpoints]

## Multi-Tenancy
[Data isolation strategy]

## Security
[Auth, encryption, secrets management]

## Scalability
[How the system scales]

## Deployment
[CI/CD, environments, release strategy]

## Architecture Decision Records
[Link to or inline ADRs for key decisions]
```

---

## Metrics & Analytics Plan

**File**: `analytics/metrics-plan.md`

```markdown
# Metrics & Analytics Plan

## North Star Metric
**[Metric name]**: [Definition and why it captures core value]

## Input Metrics
| Category | Metric | Definition | Target |
|----------|--------|-----------|--------|
| Acquisition | | | |
| Activation | | | |
| Engagement | | | |
| Retention | | | |
| Revenue | | | |

## Activation Definition
[Specific action(s) that signal a user has experienced core value]

## Event Taxonomy
| Event Name | Trigger | Properties |
|-----------|---------|------------|
| | | |

## Key Dashboards
1. [Dashboard name] — [What it shows]

## Experiment Framework
[How A/B tests will be run and decided]
```

---

## Go-to-Market Plan

**File**: `go-to-market/launch-plan.md`

```markdown
# Go-to-Market Plan: [Product Name]

## Launch Strategy
[Private beta → Public beta → GA, or other approach]

## Beta Program
- **Criteria**: [Who qualifies]
- **Size**: [Target number]
- **Duration**: [Timeline]
- **Feedback**: [How collected]

## Positioning
- **Category**: [Market category]
- **For**: [Target audience]
- **Who**: [Key need]
- **Unlike**: [Alternative]
- **Our product**: [Key differentiator]

## Pricing
[Tier structure, price points, free/trial model]

## Support Model
[Self-serve, chat, email — at launch]

## Success Metrics (30/60/90 days)
| Timeframe | Metric | Target |
|-----------|--------|--------|
| 30 days | | |
| 60 days | | |
| 90 days | | |
```
