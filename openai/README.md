# Team Wiki

A shared Confluence wiki maintained through five skills: setup, ingest, ask, review, and maintain. The plugin requires the Atlassian app declared in `.app.json`.

## Use

- "Set up a shared wiki in Confluence space ENG."
- "Use this existing wiki: <root page URL>."
- "Ingest this into the wiki: <URL / file / text>."
- "What does the wiki say about X?"
- "Review this proposal."
- "Check wiki health."

Keep `Confluence wiki: <root page URL>` in project instructions so future tasks find the same root. Team conventions live in Confluence on Wiki Rules (or legacy Wiki Schema).

## Shared with Claude

Both plugins use the same [contract](references/operating-contract.md) and [workflows](references/workflows.md). A wiki can occupy an existing or dedicated space. Existing Wiki Root/Schema/Index/Log pages and category layouts are reused by ID; setup does not rename or duplicate them.

Requested ingestion publishes immutable source records and supported factual additions, with review proposals for disputed or substantive human changes. Repeated ingests skip verified completed sources or resume partial work. Queries and health checks are read-only; saving an answer, publishing a report, or repairing pages requires corresponding intent. Installation creates no scheduled jobs.

## Development

From the repository root, install the pinned tool with `mise install`, then run `just check`. Keep both packaged copies of the shared contract and workflows identical; the check detects drift and inconsistent manifest metadata. The root `plugin.json` and `.codex-plugin/plugin.json` retain the same identity and version.
