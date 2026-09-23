---
name: maintain-team-wiki
description: Run a scoped health check or requested maintenance of a team Confluence wiki for stale evidence, contradictory claims, orphan pages, broken links, duplicates, gaps, and incomplete ingests.
---

# Maintain the team wiki
Read ../../references/operating-contract.md first.

1. Resolve the team and scan scope. Read Rules and Index; enumerate bound-space pages with pagination where possible. Report coverage and inaccessible content. Use configured freshness thresholds; if none exist, report evidence ages instead of inventing expiration rules.
2. Inspect missing/broken internal links, stale evidence, contradictory claims, missing citations, unindexed/orphan pages, duplicate entities/sources, unresolved reviews, and partial Activity operations. Distinguish inaccessible links from proven broken links. Check inbound links from the inspected page set and state its boundaries.
3. Prioritize findings by impact and include page links, evidence, and a concrete suggested repair. Propose useful missing topics or new research questions. Do not fetch outside sources unless within the user's request.
4. A health check is read-only by default. If repairs are requested, fix supported navigation/citation issues with guarded edits, resume incomplete operations idempotently, and route disputed factual or substantive human changes through Reviews. Do not automatically delete, archive, or merge pages that may contain distinct human work.
5. When asked to publish a report, create a dated health report and Activity record in the bound space. State repaired, pending, and unverified items separately. Do not claim that periodic scans are configured unless a scheduling tool has actually created and verified them.
