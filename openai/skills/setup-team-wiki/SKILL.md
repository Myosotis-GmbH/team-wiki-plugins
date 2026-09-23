---
name: setup-team-wiki
description: Set up or configure a collaborative Team Wiki in a dedicated Confluence space for a team, including shared rules, source records, navigation, reviews, and activity.
---

# Set up Team Wiki
Read ../../references/operating-contract.md first.

1. Ask only for missing essentials: team name and dedicated Confluence space URL (or explicit request to create a new space). Resolve site and space using supported reads. Do not create or select a company-wide space silently. If space creation is requested, discover support and use it only with verified details and authority; otherwise explain the exact administrator setup needed.
2. Inspect the space and look for an existing Wiki Home/Rules. Reuse matching structures and page IDs. If multiple roots match, clarify before writes. Inspect existing space permissions where supported; do not change them implicitly.
3. Initialize Wiki Home with children: Wiki Rules, Index, Sources, Knowledge, Reviews, Activity. Under Knowledge, create Topics, Entities, Syntheses, Decisions as useful navigation pages. Use actual returned parent IDs. Keep a running setup record; on a timeout search before recreating pages.
4. Write Wiki Rules with the contract's binding/configuration and defaults: collaborative factual additions; review for disputed, policy, decision, or substantive human edits; no background jobs; no automatic cross-team copying. Record stewards only when identified. Include naming conventions, source provenance, review rules, and how to resume partial operations.
5. Explain contributors supply sources and corrections, the agent compiles linked knowledge, and stewards adjudicate conflicts. Use Confluence page history for auditing and explicit review pages for proposed changes. Do not imply those conventions enforce permissions or execute native approval workflows.
6. Populate Home with verified links, quick-start examples (ingest this source, ask our wiki, review this proposal, check wiki health), and the actual setup status. Verify links and return Home/Rules URLs plus any remaining prerequisites.

Reuse a single plugin for many teams. Each team's configuration lives in its own space. Never hardcode a company, site, team, or steward into the plugin.
