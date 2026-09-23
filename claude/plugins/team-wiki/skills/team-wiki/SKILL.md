---
name: team-wiki
description: Set up, ingest into, query, review, or health-check a shared Confluence wiki. Also consult it when questions or work depend on internal decisions, processes, terminology, or project context, even without mentioning the wiki or plugin. Skip general questions that do not need team context.
---

# Team Wiki

Maintain persistent, linked, cited team knowledge in Confluence. Humans and agents share the same wiki, including teammates using the OpenAI plugin.

Read [the shared operating contract](references/operating-contract.md) before every task. Follow [the shared workflows](references/workflows.md), reading the section for the requested operation:

| Request | Workflow |
| --- | --- |
| Initialize or configure a wiki | Setup |
| Add a document, notes, URL, or source revision | Ingest |
| Answer a team question, consult internal context for work, or save an answer | Ask |
| Assess, revise, reject, or apply a proposal | Review |
| Lint, check health, or repair wiki issues | Maintain |

## Atlassian integration

Use the bundled `atlassian` MCP server. Discover the available resource, page, search, create, and update operations and their schemas; names may differ by server version. Use Markdown when supported. Supply the verified cloudId and the connector's page-version or snapshot guard on updates. If no Atlassian tools are available, explain how to authenticate `atlassian` through `/mcp` in Claude Code or connect Atlassian in claude.ai, then stop before wiki work.

## Find the shared root

Use an explicit user-provided root first. Otherwise look for `Confluence wiki: <url>` in `CLAUDE.md`, `CLAUDE.local.md`, or claude.ai Project instructions, then resolve and verify the binding using the contract. A user may belong to multiple wikis: if there is any doubt, always ask which wiki to use before proceeding. Do not infer a default from membership or a previous task. On requested setup, offer to persist a labeled root pointer in project instructions while preserving other wiki pointers; all team rules remain in Confluence.

Recognize Wiki Home/Rules and legacy Wiki Root/Schema by their actual page IDs. Ordinary questions and health checks cause no writes; requested ingest includes routine source, index, and activity writes without repeated confirmation.
