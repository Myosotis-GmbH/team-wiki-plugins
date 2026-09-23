# Team Wiki

A shared Confluence wiki maintained through five skills: setup, ingest, ask, review, and maintain. The plugin requires the Atlassian app declared in `.app.json`.

## Use

- "Set up a shared wiki in Confluence space ENG."
- "Use this existing wiki: <root page URL>."
- "Ingest this into the wiki: <URL / file / text>."
- "What does the wiki say about X?"
- "Review this proposal."
- "Check wiki health."

Keep labeled `Confluence wiki: <root page URL>` pointers in project instructions. A user may belong to multiple wikis; if the intended wiki is uncertain, the agent always asks which one to use, including for read-only tasks. Team conventions live in Confluence on Wiki Rules (or legacy Wiki Schema).

## Shared with Claude

Both plugins use the same [contract](references/operating-contract.md) and [workflows](references/workflows.md). A wiki can occupy an existing or dedicated space. Existing Wiki Root/Schema/Index/Log pages and category layouts are reused by ID; setup does not rename or duplicate them.

Requested ingestion publishes immutable source records and supported factual additions, with review proposals for disputed or substantive human changes. Repeated ingests skip verified completed sources or resume partial work. Queries and health checks are read-only; saving an answer, publishing a report, or repairing pages requires corresponding intent. Installation creates no scheduled jobs.

Any team member can review another member's proposal. Approval requires one team member who did not author or substantively revise the proposed changes; no special reviewer role or prior assignment is needed.

## Development

Download `team-wiki-openai.zip` from the latest [release](https://github.com/Myosotis-GmbH/team-wiki-plugins/releases/latest). The archive includes both manifests, the Atlassian app mapping, skills, and shared references.

To cut a release, set the same version in both OpenAI manifests and the Claude manifest, commit the changes, then push a matching `vX.Y.Z` tag. GitHub Actions validates and publishes both plugin archives. Run `just package` to build the archives locally.

From the repository root, install the pinned tool with `mise install`, then run `just check`. Keep both packaged copies of the shared contract and workflows identical; the check detects drift and inconsistent manifest metadata. The root `plugin.json` and `.codex-plugin/plugin.json` retain the same identity and version.
