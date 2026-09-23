# shared-wiki-plugins

## team-wiki

A team-shared [LLM Wiki](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f) that lives in Confluence. Claude ingests sources, maintains interlinked pages, answers from them and lints them. Everyone on the team works on the same wiki.

The plugin bundles the official Atlassian MCP server (`https://mcp.atlassian.com/v2/mcp`).

### Install

```
/plugin marketplace add <path-to-this-repo>/claude
/plugin install team-wiki@shared-wiki-plugins
/mcp            # authenticate "atlassian"
```

### Use

- "set up a shared wiki in Confluence space ENG"
- "ingest this into the wiki: <url / file / text>"
- "what does the wiki say about X?"
- "review this proposal"
- "lint the wiki"

Put labeled `Confluence wiki: <root page url>` pointers in your project's `CLAUDE.md`. A user may belong to multiple wikis; if the intended wiki is uncertain, the agent always asks which one to use, including for read-only tasks. The conventions live on the wiki's `Wiki Rules` (or legacy `Wiki Schema`) page in Confluence, where the team can edit them together.

### Shared with OpenAI

Both plugins use the same [contract](plugins/team-wiki/skills/team-wiki/references/operating-contract.md) and [workflows](plugins/team-wiki/skills/team-wiki/references/workflows.md). A wiki can occupy an existing or dedicated space. Existing Wiki Root/Schema/Index/Log pages and category layouts are reused by ID; setup does not rename or duplicate them.

Requested ingestion publishes immutable source records and supported factual additions, with review proposals for disputed or substantive human changes. Repeated ingests skip verified completed sources or resume partial work. Queries and health checks are read-only; saving an answer, publishing a report, or repairing pages requires corresponding intent. Installation creates no scheduled jobs.

Any team member can review another member's proposal. Approval requires one team member who did not author or substantively revise the proposed changes; no special reviewer role or prior assignment is needed.

### claude.ai

Download `team-wiki-claude.zip` from the latest [release](https://github.com/Myosotis-GmbH/team-wiki-plugins/releases/latest) and upload it as a plugin. To cut a release, set the same version in the Claude manifest and both OpenAI manifests, commit the changes, then push a matching `vX.Y.Z` tag. GitHub Actions validates and publishes both plugin archives. Run `just package` to build the archives locally.

### Development

From the repository root, install the pinned tool with `mise install`, then run `just check`. Keep both packaged copies of the shared contract and workflows identical; the check detects drift and inconsistent manifest versions. Keep the Claude manifest and both OpenAI manifests on the same release version.
