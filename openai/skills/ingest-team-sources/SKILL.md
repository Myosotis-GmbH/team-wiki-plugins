---
name: ingest-team-sources
description: Ingest supplied documents, meeting notes, URLs, or source revisions into a team Confluence wiki; synthesize and link persistent knowledge while preserving evidence and human edits.
---

# Ingest team sources
Read ../../references/operating-contract.md first.

1. Resolve the team binding and read Rules, Index, relevant knowledge pages, and the supplied source in full. Process bounded batches; do not scan all company content without a scoped request. Identify unreadable pages, missing attachments, and partial transcripts before drawing conclusions.
2. Canonicalize the source identity and version/fingerprint. Search source records and Activity to detect prior ingestion. An unchanged already-completed ingest is a no-op; a partial one resumes; a changed source gets a new record. Resolve duplicate identities conservatively.
3. Extract factual claims, entities, concepts, decisions actually made, open questions, and contradictions. Attach specific evidence locators. Distinguish participant proposals from adopted decisions, and model inference from source statements. Check existing claims rather than appending an isolated summary.
4. Draft the source record and affected-page changes. For compatible facts, create/update topic/entity/synthesis pages under the appropriate roots. Use specific citations, related-page links, and consistent terminology. Avoid unnecessary one-claim pages. Preserve Human notes.
5. Under review-first policy or for disputed/high-impact changes, write a review proposal with exact deltas and citations. Retain competing evidence on existing pages without silently declaring a winner. Never turn a proposal into canonical policy or an approved decision.
6. Create an Activity operation record, then perform guarded sequential writes. Journal actual returned page IDs, reconcile duplicate creates if detected, update Index, and complete the record. If source storage or any update fails, retain partial status and clear resume instructions.
7. Return links to source record, changed pages, and proposals, with what is pending. Do not claim pages were updated merely because a draft was produced.
