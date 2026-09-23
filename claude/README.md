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
- "lint the wiki"

Put `Confluence wiki: <root page url>` in your project's `CLAUDE.md` so every teammate's Claude finds the wiki. The conventions live on the wiki's `Wiki Schema` page in Confluence, where the team can edit them together.
