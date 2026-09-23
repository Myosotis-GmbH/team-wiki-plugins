---
name: confluence-wiki
description: Maintain a team-shared LLM wiki in Confluence (Karpathy's "LLM Wiki" pattern) using the Atlassian MCP tools. Use when the user wants to set up, ingest a source into, query, file an answer into, or lint/health-check the shared wiki, or mentions "the wiki", "wiki ingest", "wiki lint", or a Confluence knowledge base the LLM maintains.
---

# Confluence LLM Wiki

A persistent, compounding wiki that the LLM writes and maintains, and that humans read. It is
stored in Confluence, so the whole team shares one wiki. Pattern:
https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f

You never answer from raw sources alone when the wiki exists. You compile knowledge **into** the
wiki once, keep it current, and answer from it.

## Tools

Use the Atlassian MCP server bundled with this plugin (server name `atlassian`). The tools you need
are: `getAccessibleAtlassianResources` (to get the `cloudId`), `getConfluenceSpaces`,
`getConfluencePage`, `getConfluencePageDescendants`, `searchConfluenceUsingCql`,
`createConfluencePage`, `updateConfluencePage` and `createConfluenceFooterComment`. The exact names
can differ between server versions; use whatever the server lists for the same job. Write page
bodies as Markdown (`contentFormat: "markdown"`) when the tool supports it.

If no Atlassian tools are available, tell the user to run `/mcp` and authenticate `atlassian`, then stop.

## Locating the wiki

The wiki is one Confluence root page (the **Wiki Root**) and everything under it. Find its URL in
this order:

1. A line `Confluence wiki: <url>` in the project's `CLAUDE.md`/`CLAUDE.local.md` (Claude Code) or
   in the claude.ai Project instructions.
2. Ask the user. Offer to add that line to `CLAUDE.local.md`, or on claude.ai tell them to paste it
   into their Project instructions so later chats find it.

## Layout

```
Wiki Root                     overview + links to the pages below
├── Wiki Schema               conventions + workflows; the team co-evolves it
├── Wiki Index                catalog of every wiki page, by category
├── Wiki Log                  append-only timeline
├── Sources                   raw sources, one child page each; immutable
└── <category pages>          e.g. Entities, Concepts, Topics, Analyses
    └── <wiki pages>
```

**Read `Wiki Schema` at the start of every wiki task.** It overrides the defaults in this skill
wherever they conflict. That page is how the whole team, not just one person's `CLAUDE.md`,
shapes how the wiki is maintained.

## Rules for a shared wiki

Several people and their agents edit the same pages. So:

- **Re-read before every write.** Fetch the page right before updating it, and merge your change
  into the current body. Never write back a body you read earlier in the session. If the update
  fails on a version conflict, fetch the page again, merge and retry.
- **Edit surgically.** Change the sections you need to and keep everything else as it is, including
  text other people wrote.
- **Sources are immutable.** Once created, never edit a page under `Sources`.
- **Attribute.** Every log entry names the person who asked for the change.
- **Contradictions are flagged, not settled silently.** When a new source disagrees with the wiki,
  keep both claims with their sources under a `> ⚠ Contradiction` callout.
- **Humans in the loop:** if a change would rewrite or delete a large part of a page, or delete or
  rename a page, describe it and get confirmation first.
- Link between wiki pages with Confluence page links, never `[[wikilinks]]`. Every claim on a wiki
  page cites the source page(s) it came from.

## Operations

### Init

Use this when there is no Wiki Root yet. Ask which space it belongs in and what the wiki's domain
is. Create the Wiki Root and, under it, `Wiki Schema`, `Wiki Index`, `Wiki Log` and `Sources`.
Seed `Wiki Schema` with the domain, the category pages the domain needs, page templates, and these
workflows. Tailor them with the user. Then save the root URL (see "Locating the wiki") and add the
`init` log entry.

### Ingest

The user gives a source: pasted text, a file, a URL, or an existing Confluence page.

1. Read `Wiki Schema`, then `Wiki Index`.
2. Create a page under `Sources` titled `<YYYY-MM-DD> <source title>`. Put the metadata (origin
   URL/file, who added it, date) at the top, and the source content or a faithful extract below.
3. Discuss the key takeaways with the user briefly, unless they asked for a batch or hands-off
   ingest.
4. Integrate. Create or update every entity, concept and topic page the source touches (often
   5–15 pages). Update summaries, add cross-links, and flag contradictions. Use
   `searchConfluenceUsingCql` (`ancestor = <rootId> AND text ~ "..."`) to find pages the index
   does not make obvious.
5. Update `Wiki Index`: one line per page, with the link, a one-line summary and the category.
6. Append to `Wiki Log`.
7. Report which pages you created and which you updated, with links.

### Query

1. Read `Wiki Schema` and `Wiki Index`. Pick the relevant pages from the index, and use CQL search
   to fill in gaps.
2. Read those pages and answer with citations as links to the wiki pages and sources.
3. If the answer is a reusable analysis, comparison or connection, offer to file it as a new wiki
   page (usually under `Analyses`), then update the index and the log.

Do not log trivial lookups.

### Lint

Health-check the wiki. Look for contradictions between pages, stale claims that newer sources
supersede, orphan pages (not in the index or with no inbound links), concepts that are mentioned
but have no page, missing cross-references, and gaps worth researching. Report your findings as a
list, fix the ones the user approves, and append a `lint` log entry. Suggest new questions and new
sources to look for.

## Log format

Put the newest entry at the bottom, with one heading per entry so anyone can scan it:

```
## [YYYY-MM-DD] ingest | <Source title> | by <person>
- created: <links>
- updated: <links>
```

The operation is one of `init`, `ingest`, `query`, `lint` or `schema`. If you change `Wiki Schema`,
log it as `schema` with a one-line reason.
