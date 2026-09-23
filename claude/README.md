# shared-wiki-plugins

## confluence-wiki

A team-shared [LLM Wiki](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f) that lives in Confluence. Claude ingests sources, maintains interlinked pages, answers from them and lints them. Everyone on the team works on the same wiki.

The plugin bundles the official Atlassian MCP server (`https://mcp.atlassian.com/v2/mcp`).

### Install

```
/plugin marketplace add <path-to-this-repo>/claude
/plugin install confluence-wiki@shared-wiki-plugins
/mcp            # authenticate "atlassian"
```

### Use

- "set up a shared wiki in Confluence space ENG"
- "ingest this into the wiki: <url / file / text>"
- "what does the wiki say about X?"
- "review this proposal"
- "lint the wiki"

Put `Confluence wiki: <root page url>` in your project's `CLAUDE.md` so every teammate's Claude finds the wiki. The conventions live on the wiki's `Wiki Rules` (or legacy `Wiki Schema`) page in Confluence, where the team can edit them together.

### Shared with OpenAI

Both plugins use the same [contract](plugins/confluence-wiki/skills/confluence-wiki/references/operating-contract.md) and [workflows](plugins/confluence-wiki/skills/confluence-wiki/references/workflows.md). A wiki can occupy an existing or dedicated space. Existing Wiki Root/Schema/Index/Log pages and category layouts are reused by ID; setup does not rename or duplicate them.

Requested ingestion publishes immutable source records and supported factual additions, with review proposals for disputed or substantive human changes. Repeated ingests skip verified completed sources or resume partial work. Queries and health checks are read-only; saving an answer, publishing a report, or repairing pages requires corresponding intent. Installation creates no scheduled jobs.

### claude.ai

Download `confluence-wiki.zip` from the latest [release](https://github.com/Myosotis-GmbH/team-wiki-plugins/releases/latest) and upload it as a plugin. To cut a release, synchronize `version` in the Claude manifest and both OpenAI manifests, then `git tag vX.Y.Z && git push --tags`.

### Development

From the repository root, install the pinned tool with `mise install`, then run `just check`. Keep both packaged copies of the shared contract and workflows identical; the check detects drift and inconsistent manifest versions. Keep the Claude manifest and both OpenAI manifests on the same release version.
