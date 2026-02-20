---
description: Generate a specific PM artifact (PRD, persona, competitive analysis, etc.)
allowed-tools: Read, Write, Edit, Glob, Grep, AskUserQuestion, WebSearch, WebFetch
argument-hint: "[artifact-type] (e.g., persona, prd, competitive-analysis, strategy, problem-statement)"
---

# Generate Product Management Artifact

Generate a specific PM artifact on demand, using templates and existing project context.

## Step 1: Identify Artifact Type

Map "$ARGUMENTS" to an artifact type:

| Argument | Artifact | Directory | Phase |
|----------|----------|-----------|-------|
| `competitive-analysis` or `competitors` | Competitive Landscape Analysis | `market-research/` | A |
| `tam` or `market-sizing` | Market Sizing (TAM/SAM/SOM) | `market-research/` | A |
| `persona` | User Persona Document | `customer-discovery/` | B |
| `jtbd` or `jobs` | Jobs to Be Done Analysis | `customer-discovery/` | B |
| `customer-journey` | Customer Journey Map | `customer-discovery/` | B |
| `problem-statement` | Problem Statement | `problem-definition/` | C |
| `product-brief` | One-Page Product Brief | `problem-definition/` | C |
| `press-release` or `prfaq` | Press Release / FAQ (Working Backwards) | `problem-definition/` | C |
| `vision` | Product Vision & Mission | `strategy/` | D |
| `strategy` | Product Strategy Document | `strategy/` | D |
| `positioning` | Positioning Document | `strategy/` | D |
| `business-model` | Business Model & Pricing | `strategy/` | D |
| `prd` | Product Requirements Document | `requirements/` | E |
| `user-stories` | User Stories with Acceptance Criteria | `requirements/` | E |
| `mvp` | MVP Scope Definition | `requirements/` | E |
| `user-flow` | User Flow Diagram | `information-architecture/` | F |
| `ia` or `sitemap` | Information Architecture | `information-architecture/` | F |
| `architecture` or `tech-design` | Technical Architecture Document | `technical-architecture/` | I |
| `data-model` | Data Model / Schema Design | `technical-architecture/` | I |
| `api-design` | API Architecture | `technical-architecture/` | I |
| `metrics` or `analytics-plan` | Metrics & Analytics Plan | `analytics/` | J |
| `event-taxonomy` | Event Taxonomy | `analytics/` | J |
| `voice-tone` | Voice & Tone Guidelines | `content/` | K |
| `launch-plan` | Go-to-Market / Launch Plan | `go-to-market/` | L |
| `pricing` | Pricing Page Structure | `go-to-market/` | L |
| `risk-register` | Risk Register | `operations/` | M |

If no argument provided or unrecognized, ask the user what they want to generate.

## Step 1.5: Route to the Correct Generator

Based on the artifact type, delegate to the appropriate agent:

**Use pm-strategic-artifact-generator for:** `competitive-analysis`, `competitors`, `tam`, `market-sizing`, `strategy`, `vision`, `positioning`, `business-model`, `prd`, `architecture`, `tech-design`, `metrics`, `analytics-plan`, `launch-plan`, `pricing`

**Use pm-artifact-generator for:** `problem-statement`, `product-brief`, `persona`, `jtbd`, `jobs`, `customer-journey`, `press-release`, `prfaq`, `user-stories`, `mvp`, `voice-tone`, `ia`, `sitemap`

**Use pm-structured-artifact-generator for:** `user-flow`, `state-transitions`, `data-model`, `api-design`, `event-taxonomy`, `requirements-traceability`, `risk-register`, `raci`, `process-docs`, `ui-copy`, `onboarding-copy`, `email-copy`, `help-content`

## Step 2: Gather Context

1. Read CLAUDE.md for product details and tool preferences
2. Scan `product-management/` for existing artifacts that inform this one
3. Read any previously generated artifacts that are prerequisites:
   - PRD needs: problem statement, strategy, personas
   - Strategy needs: market research, customer discovery findings
   - User stories need: PRD, personas
   - Architecture needs: requirements, user flows

If key prerequisite artifacts are missing, note this but proceed — ask the user for the context directly.

## Step 3: Gather Artifact-Specific Inputs

Use AskUserQuestion to collect information needed for this artifact type. Tailor questions to what's NOT already available from existing artifacts.

For example, for a persona:
- Target user role/title
- Key pain points
- Current tools they use
- Goals and motivations

For a PRD:
- Feature area to cover
- Priority level
- Key use cases

## Step 4: Generate Artifact

Load the template structure from `${CLAUDE_PLUGIN_ROOT}/skills/saas-pm-playbook/references/artifact-templates.md` and generate a complete, practical artifact.

Guidelines:
- Fill in all sections with real, actionable content (not placeholder text)
- Reference data from existing artifacts when available
- Use industry knowledge and SaaS best practices to fill gaps
- Keep it practical — solo founders need actionable docs, not academic ones
- Include concrete examples and specifics rather than generic advice

## Step 5: Save and Update

1. Read CLAUDE.md for tool preferences
2. **If a documentation tool is configured** (e.g., Notion): create the artifact there as the primary target. Optionally also save a local markdown copy for version control
3. **If no tool is configured**: write the artifact to the appropriate directory under `product-management/` with a descriptive filename (e.g., `persona-startup-founder.md`, `prd-user-onboarding.md`)
4. Update `product-management/checklist.md` — mark relevant tasks as complete
5. Report where the artifact was saved (tool name and/or file path)

## Step 6: Summary

Present:
- What was generated and where it was saved
- Which checklist tasks were completed
- What artifacts to generate next based on the workflow
