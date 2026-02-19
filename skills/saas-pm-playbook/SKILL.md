---
name: SaaS PM Playbook
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
version: 0.1.0
---

# SaaS Product Management Design Phase Playbook

## Purpose

Guide solo founders and small teams through the complete SaaS product design phase — from initial concept to a validated, buildable specification. The design phase is not purely visual design; it encompasses strategic design, experience design, and technical design across 13 interconnected workstreams.

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

### Phase Sequencing

Process phases roughly in order (A through M), expecting iteration. Key dependencies:

- **A & B first** — Market research and customer discovery inform everything else
- **C before D** — Frame the problem before defining strategy
- **D before E** — Strategy drives requirements
- **E before F-G** — Requirements inform design
- **F-G before H** — Design before prototyping
- **I can run parallel to F-G** — Technical and UX design can happen concurrently
- **J-K-L-M can overlap** — These supporting workstreams progress alongside core design

### Smart Adaptive Approach

When working on a phase:

1. **Show overview** — Present all tasks in the phase with completion status
2. **Suggest priorities** — Based on what's already done, recommend the highest-impact next tasks
3. **Guide execution** — Walk through selected tasks, generating artifacts along the way
4. **Track progress** — Update the project checklist after each task

### Artifact Generation

Generate artifacts as markdown files by default in the project's `product-management/` directory, organized by type (see Artifact Subdirectory Mapping below). The master checklist lives at `product-management/checklist.md`.

If companion tools are configured (Notion, Linear, etc.), artifacts should also be offered in those systems. Consult CLAUDE.md for user preferences on which system to use for different PM duties.

## Critical Concepts

Reference these SaaS-specific concepts when relevant:

- **Product-Market Fit (PMF)** — Measured through retention, NPS, Sean Ellis test
- **North Star Metric** — The single metric capturing core value delivered
- **Activation** — The moment a new user first experiences core value
- **Time to Value (TTV)** — Sign-up to first meaningful outcome; shorter is better
- **Net Revenue Retention (NRR)** — Revenue retained from existing customers including expansion/churn
- **Cohort Analysis** — Tracking behavior of user groups over time
- **Feature Adoption Curve** — How new features move from early adopters to mainstream
- **Switching Costs and Moats** — Defensibility through data, workflows, habits

## Prioritization Frameworks

When helping prioritize features or tasks, apply the appropriate framework:

- **RICE** — Reach, Impact, Confidence, Effort. Best for comparing feature candidates.
- **ICE** — Impact, Confidence, Ease. Lighter-weight alternative to RICE.
- **MoSCoW** — Must/Should/Could/Won't. Best for scope definition.
- **Kano Model** — Basic/Performance/Excitement. Best for understanding satisfaction drivers.
- **Opportunity Scoring** — Importance vs. Satisfaction. Best for identifying unmet needs.

## Standard Operating Procedures

Reference these cadences when planning ongoing PM work:

- **Weekly product review** — Progress against OKRs, blockers, decisions needed
- **Bi-weekly discovery sync** — Research findings, customer insights
- **Monthly roadmap review** — Reassess priorities against strategy
- **Quarterly planning (OKR cycle)** — Set objectives, align teams
- **Post-launch review** — 2-4 weeks after launch, review adoption metrics
- **Continuous backlog grooming** — Refine and reprioritize weekly

## Additional Resources

### Reference Files

For the complete task lists and detailed guidance, consult:

- **`references/playbook-tasks.md`** — Full 166-task checklist organized by workstream (A-M) with detailed descriptions
- **`references/artifact-templates.md`** — Templates and structure guides for each artifact type (PRD, persona, competitive analysis, etc.)

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
