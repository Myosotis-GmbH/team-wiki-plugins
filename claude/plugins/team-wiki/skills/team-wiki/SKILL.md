---
name: team-wiki
description: Set up, ingest sources into, query, review changes to, or health-check a team-shared Confluence wiki maintained by the agent. Use for shared wiki requests, wiki ingest, wiki review, and wiki lint.
---

# Team Wiki

Maintain persistent, linked, cited team knowledge in Confluence. Humans and agents share the same wiki, including teammates using the OpenAI plugin.

Read [the shared operating contract](references/operating-contract.md) before every task. Follow [the shared workflows](references/workflows.md), reading the section for the requested operation:

| Request | Workflow |
| --- | --- |
| Initialize or configure a wiki | Setup |
| Add a document, notes, URL, or source revision | Ingest |
| Answer from the wiki or save an answer | Ask |
| Assess, revise, reject, or apply a proposal | Review |
| Lint, check health, or repair wiki issues | Maintain |

## Atlassian integration

Use the bundled `atlassian` MCP server. Discover the available resource, page, search, create, and update operations and their schemas; names may differ by server version. Use Markdown when supported. Supply the verified cloudId and the connector's page-version or snapshot guard on updates. If no Atlassian tools are available, explain how to authenticate `atlassian` through `/mcp` in Claude Code or connect Atlassian in claude.ai, then stop before wiki work.

## Find the shared root

Use an explicit user-provided root first. Otherwise look for `Confluence wiki: <url>` in `CLAUDE.md`, `CLAUDE.local.md`, or claude.ai Project instructions, then resolve and verify the binding using the contract. Ask only if the root remains missing or ambiguous. On requested setup, offer to persist the root pointer in project instructions; all team rules remain in Confluence.

Recognize Wiki Home/Rules and legacy Wiki Root/Schema by their actual page IDs. Ordinary questions and health checks cause no writes; requested ingest includes routine source, index, and activity writes without repeated confirmation.
