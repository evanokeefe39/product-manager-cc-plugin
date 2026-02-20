---
name: Product Management
description: >-
  This skill should be used when the user asks to "plan a SaaS product",
  "start product discovery", "create a PRD", "do market research",
  "define product strategy", "write user stories", "create personas",
  "design information architecture", "plan go-to-market", "define MVP scope",
  "run customer discovery", "prioritize features", "define metrics",
  "plan product launch", "build a product roadmap", "map user flows",
  "define pricing model", "define product-market fit", or mentions
  product management design phase tasks. Guides the user through a complete
  SaaS product management design phase methodology covering 13 workstreams
  and 166 tasks from initial concept to validated, buildable specification.
  Do NOT use for general software architecture, business strategy consulting,
  analytics implementation, or engineering work outside SaaS product design
  phase context. Not for code reviews, debugging, or DevOps tasks.
version: 0.1.0
---

# SaaS Product Management Design Phase Playbook

## Purpose

Guide solo founders and small teams through the complete SaaS product design phase — from initial concept to a validated, buildable specification. The design phase is not purely visual design; it encompasses strategic design, experience design, and technical design across 13 interconnected workstreams.

## Triggers

This skill activates when:
- User starts a new product management project (`/pm:init`)
- User asks to work on a specific phase (`/pm:phase [A-M]`)
- User requests any PM artifact (PRD, persona, strategy doc, etc.)
- User asks about product management methodology, prioritization, or planning
- User mentions SaaS product design tasks (market research, customer discovery, etc.)

## Inputs

- **Product name** — from CLAUDE.md or user prompt
- **Current phase** — from `product-management/checklist.md` progress
- **Tool preferences** — from CLAUDE.md PM configuration section
- **Existing artifacts** — from `product-management/` subdirectories
- **User request** — specific phase, task, or artifact to work on

## Smart Adaptive Approach

When working on a phase:

1. **Show overview** — Present all tasks in the phase with completion status
2. **Suggest priorities** — Based on what's already done, recommend the highest-impact next tasks
3. **Guide execution** — Walk through selected tasks, generating artifacts along the way
4. **Track progress** — Update the project checklist after each task

## Core Principles

Apply these principles throughout all product management work:

1. **Outcome over output** — Measure success by customer and business outcomes, not features shipped.
2. **Continuous discovery** — Discovery is ongoing, not a one-time phase.
3. **Jobs to be done** — Understand the job customers hire the product for, not just feature requests.
4. **Data-informed, not data-driven** — Use quantitative data for patterns, qualitative for understanding why, and judgment to decide.
5. **Minimize time to value** — SaaS lives and dies by how quickly users reach their first meaningful outcome.
6. **Build for retention** — Revenue compounds through retention and expansion.
7. **Ship to learn** — Reduce batch size. Get real feedback early.
8. **Solve problems, not build features** — Features are hypotheses. The problem is the constant.
9. **Ruthless prioritization** — Use frameworks (RICE, ICE, opportunity scoring) but own the judgment call.
10. **Product-led growth where possible** — Let the product drive acquisition, conversion, and expansion.

## The 13 Workstreams

The design phase spans these interconnected workstreams. Each contains specific tasks tracked in the project checklist.

| Phase | Workstream | Key Outputs |
|-------|-----------|-------------|
| **A** | Market & Opportunity Research | TAM/SAM/SOM, competitive landscape, market gaps |
| **B** | Customer Discovery & Research | ICPs, personas, JTBD, opportunity scores |
| **C** | Problem Definition & Framing | Problem statement, scope boundary, product brief |
| **D** | Product Strategy & Vision | Vision, UVP, business model, roadmap themes |
| **E** | Requirements Definition | Use cases, user stories, MVP scope, NFRs |
| **F** | Information Architecture & Interaction Design | Object model, IA, user flows, wireframes |
| **G** | Visual & UI Design | Design system, component library, high-fidelity mockups |
| **H** | Prototyping & Validation | Interactive prototypes, usability test results |
| **I** | Technical Design & Architecture | System architecture, data model, API design |
| **J** | Analytics, Metrics & Instrumentation | North Star Metric, event taxonomy, dashboards |
| **K** | Content & Copy Design | Voice/tone guidelines, UI copy, help content |
| **L** | Go-to-Market Design | Launch strategy, pricing, beta program |
| **M** | Operational & Process Design | Team structure, dev methodology, release process |

## Recommended Workflow

### Iterative, Non-Linear Workflow

Users rarely work through phases A–M sequentially. Expect them to work across multiple workstreams simultaneously, jump between phases, and bring existing research or notes that cover tasks in various phases. Key dependency guidance (soft, not enforced):

- **A & B are foundational** — Market research and customer discovery inform most other phases, but partial progress is fine
- **C before D** — Frame the problem before defining strategy
- **D before E** — Strategy drives requirements
- **E before F-G** — Requirements inform design
- **F-G before H** — Design before prototyping
- **I can run parallel to F-G** — Technical and UX design can happen concurrently
- **J-K-L-M can overlap with everything** — These supporting workstreams progress alongside any core work

### Accepting Existing Work

When a user shares existing notes, research, or artifacts (pasted text, uploaded docs, verbal summaries):

1. **Map to tasks** — Identify which specific checklist tasks (by number) the notes cover, even partially
2. **Confirm coverage** — Tell the user which tasks you believe their notes satisfy and ask for confirmation
3. **Generate artifacts** — Offer to formalize their notes into proper artifacts using the templates
4. **Update checklist** — Mark confirmed tasks as complete
5. **Identify gaps** — Point out any closely related tasks their notes don't fully cover

### Artifact Generation

Check CLAUDE.md for tool preferences before generating any artifact. Route artifacts to the user's configured tool as the primary target. Use local markdown only as a fallback when no tool is configured for that duty.

The master checklist lives at `product-management/checklist.md` (always maintained as the local source of truth for progress tracking).

### Tool Preference Routing

| PM Duty | If Tool Configured | If No Tool Configured |
|---------|-------------------|----------------------|
| Documentation & artifacts | Create in configured tool (Notion, Confluence, etc.) as primary target | Write to `product-management/` as markdown |
| Task tracking | Create/update in configured tool (Linear, Jira, etc.) | Update `product-management/checklist.md` |
| Analytics | Reference configured tool (PostHog, Tinybird, etc.) for real data | Define metrics in local markdown |

When a tool is configured:
- The configured tool is the **primary** destination for that duty
- A local markdown copy may optionally be saved for version control
- Always report where the artifact was saved

## Constraints and Guardrails

- **Scope**: This playbook covers the design phase only — not development, deployment, or ongoing operations
- **Team size**: Optimized for solo founders and teams of 1-3; larger teams may need additional coordination processes
- **File safety**: Never overwrite existing artifacts without confirmation; append or create new versions
- **Batch size**: Work on 1-3 tasks per session to maintain quality; avoid generating all 166 tasks at once
- **Prerequisite**: A PM project must be initialized (`/pm:init`) before using phase-specific commands
- **Tool boundaries**: Only use companion tools (Notion, Linear, etc.) that the user has explicitly configured in CLAUDE.md

## Additional Resources

### Reference Files

For the complete task lists and detailed guidance, consult:

- **`${CLAUDE_PLUGIN_ROOT}/skills/saas-pm-playbook/references/playbook-tasks.md`** — Full 166-task checklist organized by workstream (A-M) with detailed descriptions
- **`${CLAUDE_PLUGIN_ROOT}/skills/saas-pm-playbook/references/artifact-templates.md`** — Templates and structure guides for each artifact type (PRD, persona, competitive analysis, etc.)
- **`${CLAUDE_PLUGIN_ROOT}/skills/saas-pm-playbook/references/pm-concepts.md`** — SaaS-specific concepts (PMF, NRR, activation, etc.), prioritization frameworks (RICE, ICE, MoSCoW, Kano), and standard operating procedures

### Artifact Subdirectory Mapping

| Artifact Type | Directory | Phases |
|--------------|-----------|--------|
| Competitive analysis | `market-research/` | A |
| Personas | `customer-discovery/` | B |
| Problem statement, product brief | `problem-definition/` | C |
| Vision doc, strategy doc, positioning | `strategy/` | D |
| PRD, user stories, requirements | `requirements/` | E |
| IA diagrams, wireframes, user flows | `information-architecture/` | F |
| Design system, mockups | `visual-design/` | G |
| Prototype notes, usability reports | `prototyping/` | H |
| Architecture docs, data model, API spec | `technical-architecture/` | I |
| Metrics definitions, event taxonomy | `analytics/` | J |
| Voice/tone guide, UI copy doc | `content/` | K |
| Launch plan, pricing doc, beta plan | `go-to-market/` | L |
| Team RACI, process docs, risk register | `operations/` | M |
