# SaaS PM Design Phase — Complete Task Checklist

This reference contains all 166 tasks across the 13 workstreams. Use this when the user needs to see specific tasks, work through a phase, or update the project checklist.

---

## A. Market and Opportunity Research (Tasks 1-10)

1. Define the target market segment(s) with specificity (industry, company size, geography, maturity).
2. Estimate total addressable market (TAM), serviceable addressable market (SAM), and serviceable obtainable market (SOM).
3. Conduct industry and trend analysis — identify tailwinds, headwinds, and regulatory factors.
4. Map the competitive landscape: direct competitors, indirect competitors, and alternatives (including spreadsheets and manual processes).
5. Perform deep competitive product teardowns — sign up for and use competing products end to end.
6. Document competitor pricing models, packaging, and positioning.
7. Identify market gaps, underserved segments, and unmet needs from competitor reviews (G2, Capterra, Reddit, community forums).
8. Analyze competitor go-to-market strategies (PLG vs. sales-led vs. hybrid).
9. Identify potential partners, integrations, and ecosystem players.
10. Assess market timing — why now? What has changed that makes this opportunity viable today?

---

## B. Customer Discovery and Research (Tasks 11-23)

11. Define initial ideal customer profile (ICP) hypotheses.
12. Identify and recruit interview participants across ICP segments.
13. Conduct 30+ problem discovery interviews focused on current workflows, pain points, and desired outcomes.
14. Perform contextual inquiry / job shadowing — observe users in their natural work environment.
15. Map the full customer journey for the problem space (awareness through resolution, including workarounds).
16. Identify all stakeholders in the buying and usage process (buyer, user, champion, economic decision maker, IT gatekeeper).
17. Document Jobs to be Done (JTBD) — functional jobs, emotional jobs, social jobs.
18. Rank and prioritize jobs by importance and current satisfaction (opportunity scoring).
19. Create detailed persona documents for primary and secondary users.
20. Map the "hiring and firing" criteria — why do customers start using or stop using existing solutions?
21. Conduct willingness-to-pay research to validate pricing hypotheses early.
22. Survey a broader audience to validate qualitative findings at scale.
23. Synthesize all research into a customer insight repository accessible to the full team.

---

## C. Problem Definition and Framing (Tasks 24-32)

24. Write a clear, concise problem statement — who has the problem, what the problem is, and why it matters.
25. Define the scope boundary — what is in scope for V1 and what is explicitly out of scope.
26. Identify the primary job-to-be-done the product will address.
27. Document the current state workflow (how users solve the problem today, step by step).
28. Quantify the cost of the problem — time wasted, money lost, errors introduced, opportunity cost.
29. Define success criteria — what does "solved" look like from the customer's perspective?
30. Validate problem-solution fit — confirm that the problem is painful enough and frequent enough to warrant a new product.
31. Write a press release / FAQ (Amazon "working backwards" method) to crystallize the value proposition.
32. Create a one-page product brief summarizing the opportunity, problem, proposed solution, and expected outcomes.

---

## D. Product Strategy and Vision (Tasks 33-43)

33. Define the product vision — a compelling, aspirational statement of the future state you are creating.
34. Define the product mission — the specific purpose and scope of the product.
35. Articulate the unique value proposition (UVP) — why should a customer choose this over alternatives?
36. Define the product's core positioning (category, differentiation, target audience, key benefit).
37. Choose the initial go-to-market motion: product-led growth (PLG), sales-led, hybrid, or community-led.
38. Define the business model: pricing model (per seat, usage-based, flat rate, freemium, free trial), billing frequency, tier structure.
39. Map the product to a strategic narrative — what broader shift in the market does this product ride?
40. Define the initial product principles — 3-5 decision-making guardrails for the team.
41. Create a product strategy document that connects vision, target customer, value proposition, differentiation, and business model into one coherent narrative.
42. Define the moat strategy — what will make this product defensible over time (data, network effects, integrations, workflow lock-in, brand)?
43. Define the initial product roadmap at the theme/outcome level for the first 12 months.

---

## E. Requirements Definition (Tasks 44-61)

44. Define the primary use cases (3-5) the product must support at launch.
45. Write detailed user stories for each use case with acceptance criteria.
46. Define the minimum viable product (MVP) scope — the smallest version that delivers the core value proposition.
47. Prioritize features using a structured framework (RICE, MoSCoW, opportunity scoring, Kano model).
48. Define "table stakes" features — the baseline capabilities customers expect from any product in this category.
49. Define differentiating features — the capabilities that set this product apart.
50. Document functional requirements for each feature area.
51. Document non-functional requirements: performance, scalability, reliability, security, compliance, accessibility (WCAG).
52. Define data requirements — what data the system needs to collect, store, process, and display.
53. Define integration requirements — which third-party systems must the product connect to at launch?
54. Define multi-tenancy requirements — data isolation, tenant configuration, admin controls.
55. Define role and permission model — what roles exist, what can each role do?
56. Define notification and communication requirements — email, in-app, webhooks.
57. Define reporting and analytics requirements — what insights do users need from the product?
58. Define onboarding requirements — what does a new user need to experience in their first session?
59. Define billing and subscription management requirements.
60. Document regulatory and compliance requirements (GDPR, SOC 2, HIPAA, etc.) that affect product design.
61. Create a requirements traceability matrix linking each requirement to a user need or business objective.

---

## F. Information Architecture and Interaction Design (Tasks 62-78)

62. Define the product's core object model — what are the primary entities and how do they relate?
63. Map the full information architecture — top-level navigation, secondary navigation, page hierarchy.
64. Conduct card sorting exercises with target users to validate IA.
65. Define the primary user flows for each core use case (happy path).
66. Define secondary and edge case flows (error states, empty states, first-time use, permission denied).
67. Map the onboarding flow — from sign-up to activation moment, step by step.
68. Design the invitation and team setup flow (for multi-user SaaS).
69. Define the settings and configuration architecture.
70. Define the search and filtering model — how do users find and narrow down content?
71. Define the notification model — what events trigger notifications, where do they appear, how are they managed?
72. Create low-fidelity wireframes for all primary screens.
73. Define interaction patterns: modals vs. slide-overs vs. inline editing, drag-and-drop, bulk actions, keyboard shortcuts.
74. Map state transitions for key objects (e.g., draft > active > archived > deleted).
75. Define the empty state strategy — what does each screen look like with no data, and how does it guide the user?
76. Design error handling patterns — validation errors, system errors, permission errors, network errors.
77. Define the mobile/responsive strategy — responsive web, dedicated mobile app, or mobile-deferred?
78. Conduct tree testing to validate navigation findability.

---

## G. Visual and UI Design (Tasks 79-96)

79. Define or select a design system foundation (build custom, extend an open-source system, or use a component library).
80. Establish the visual design language: color palette, typography scale, spacing system, elevation/shadow model, border radius, iconography style.
81. Design the core component library: buttons, inputs, selectors, tables, cards, modals, toasts, tooltips, menus, tabs, accordions.
82. Design the layout grid and responsive breakpoint system.
83. Create high-fidelity mockups for all primary screens and flows.
84. Design data visualization components (charts, graphs, dashboards) if applicable.
85. Design the loading and skeleton state patterns.
86. Design the authentication screens (sign up, log in, password reset, SSO, MFA).
87. Design the billing and plan management screens.
88. Design the admin and settings screens.
89. Design the onboarding experience (welcome screens, guided tours, checklists, tooltips).
90. Define the illustration and imagery style (if applicable).
91. Define motion and animation principles — transitions, micro-interactions, loading animations.
92. Design for accessibility: color contrast, focus states, screen reader compatibility, keyboard navigation.
93. Create a dark mode variant (if applicable).
94. Design transactional email templates (welcome, invite, password reset, billing, notifications).
95. Design the marketing site / landing page in alignment with product visual language.
96. Document all design decisions in a design system reference (Figma library, Storybook, or equivalent).

---

## H. Prototyping and Validation (Tasks 97-108)

97. Build an interactive prototype of the core user flow(s).
98. Conduct moderated usability testing with 5-8 target users per round.
99. Test the onboarding flow specifically — measure completion rate and drop-off points.
100. Conduct unmoderated usability testing for broader reach and faster iteration.
101. Run a "fake door" or "painted door" test to validate demand for specific features.
102. Conduct A/B concept testing on positioning and value proposition messaging.
103. Test the pricing page and packaging with target buyers.
104. Conduct a design review with engineering to flag technical feasibility issues.
105. Conduct an accessibility audit on the prototype.
106. Iterate on designs based on usability findings — plan for at least 2-3 rounds of testing and refinement.
107. Validate the IA and navigation with a second round of tree testing or first-click testing.
108. Get final stakeholder sign-off on the validated design.

---

## I. Technical Design and Architecture Planning (Tasks 109-127)

109. Define the system architecture — monolith vs. microservices, serverless components, event-driven patterns.
110. Select the technology stack: frontend framework, backend language/framework, database(s), infrastructure/cloud provider.
111. Design the data model / database schema.
112. Design the API architecture — RESTful, GraphQL, or hybrid. Define resource structure and versioning strategy.
113. Define the authentication and authorization architecture (OAuth, JWT, RBAC, ABAC).
114. Define the multi-tenancy architecture — shared database with tenant ID, schema-per-tenant, or database-per-tenant.
115. Design the integration architecture — how will the product connect to third-party systems (APIs, webhooks, iPaaS)?
116. Define the file storage and media handling strategy.
117. Define the search architecture (full-text search engine selection, indexing strategy).
118. Define the real-time communication architecture if needed (WebSockets, SSE, polling).
119. Define the caching strategy.
120. Define the CI/CD pipeline and deployment strategy.
121. Define the monitoring, logging, and alerting strategy.
122. Define the disaster recovery and backup strategy.
123. Plan the infrastructure cost model — estimate hosting costs at various usage levels.
124. Conduct a security architecture review — threat modeling, encryption at rest and in transit, secrets management.
125. Define the feature flagging strategy for gradual rollouts.
126. Define the testing strategy — unit, integration, end-to-end, performance, and security testing.
127. Create architecture decision records (ADRs) for all significant technical choices.

---

## J. Analytics, Metrics, and Instrumentation Design (Tasks 128-137)

128. Define the North Star Metric for the product.
129. Define the input metrics that drive the North Star (acquisition, activation, engagement, retention, monetization).
130. Define the activation metric — what specific action signals that a user has experienced core value?
131. Design the event taxonomy — what user actions will be tracked, and what properties will be captured?
132. Define the analytics tooling stack (product analytics, session replay, error tracking, business intelligence).
133. Plan the instrumentation approach — where and how events will be fired in the codebase.
134. Define the key dashboards that will be needed at launch.
135. Define the experiment framework — how will A/B tests be run, measured, and decided?
136. Define the feedback collection strategy — in-app surveys, NPS, CSAT, feature request tracking.
137. Define data governance policies — what data is collected, how long it is retained, and how privacy requirements are met.

---

## K. Content and Copy Design (Tasks 138-146)

138. Define the product's voice and tone guidelines.
139. Write all UI copy: labels, buttons, tooltips, error messages, confirmation dialogs, empty states.
140. Write onboarding copy: welcome messages, guided tour text, tooltip walkthroughs.
141. Write transactional email copy: welcome, invite, billing, notification emails.
142. Write help and support content: knowledge base articles, FAQ, contextual help.
143. Write the initial changelog / release notes template.
144. Define the in-app messaging strategy (banners, modals, tooltips for announcements and education).
145. Write the terms of service, privacy policy, and cookie policy (with legal review).
146. Plan localization and internationalization requirements if targeting multiple markets.

---

## L. Go-to-Market Design (Tasks 147-156)

147. Define the launch strategy — private beta, public beta, waitlist, or general availability.
148. Define the beta program structure: participant criteria, feedback mechanisms, success metrics, timeline.
149. Create the positioning document — category, target audience, key differentiator, proof points.
150. Define the pricing page structure and copy.
151. Plan the sales enablement materials if sales-assisted (demo scripts, battle cards, one-pagers).
152. Define the customer support model at launch (self-serve, chat, email, phone).
153. Plan the documentation site structure and priority content.
154. Define the customer onboarding playbook — how will new customers be activated and supported post-signup?
155. Plan the feedback loop from beta users back into the product design process.
156. Define launch success metrics and a 30/60/90-day measurement plan.

---

## M. Operational and Process Design (Tasks 157-166)

157. Define the team structure and RACI for the build phase.
158. Choose the development methodology (Scrum, Kanban, Shape Up) and define cadences.
159. Set up the project management and collaboration tooling (Jira, Linear, Notion, Figma, etc.).
160. Define the design-to-engineering handoff process and tooling.
161. Define the QA process — who tests, when, and with what criteria.
162. Define the release management process — how will features move from development to production?
163. Define the incident response process for post-launch.
164. Create a risk register — identify key risks to the project and define mitigations.
165. Define the decision-making framework — who has authority to make which decisions (RACI, DACI).
166. Create the build phase project plan with milestones, dependencies, and estimated timelines.
