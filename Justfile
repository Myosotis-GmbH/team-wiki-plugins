_default:
    @just --list

_cmd cmd:
    @command -v "{{cmd}}" >/dev/null || { echo "Missing command: {{cmd}}" >&2; exit 1; }

# Validate shared instructions and plugin metadata.
check: (_cmd "jq")
    @cmp openai/references/operating-contract.md claude/plugins/confluence-wiki/skills/confluence-wiki/references/operating-contract.md
    @cmp openai/references/workflows.md claude/plugins/confluence-wiki/skills/confluence-wiki/references/workflows.md
    @jq -e -s 'map({name, version, description, author}) | .[0] == .[1]' openai/plugin.json openai/.codex-plugin/plugin.json >/dev/null
    @jq -e -s '.[0].extensions["com.openai"] == (.[1] | {interface, apps})' openai/plugin.json openai/.codex-plugin/plugin.json >/dev/null
    @jq -e -s 'map(.version) | unique | length == 1' openai/plugin.json openai/.codex-plugin/plugin.json claude/plugins/confluence-wiki/.claude-plugin/plugin.json >/dev/null
    @jq -e 'type == "object"' openai/.app.json claude/.claude-plugin/marketplace.json claude/plugins/confluence-wiki/.mcp.json >/dev/null
    @git diff --check

# Build both plugin archives after validation.
package: check (_cmd "zip")
    @rm -f team-wiki-claude.zip team-wiki-openai.zip
    @cd claude/plugins/confluence-wiki && zip -qr ../../../team-wiki-claude.zip .claude-plugin .mcp.json skills -x '*.DS_Store'
    @cd openai && zip -qr ../team-wiki-openai.zip plugin.json .codex-plugin .app.json skills references README.md -x '*.DS_Store'

# Publish both archives to a matching version tag.
[positional-arguments]
release tag: package (_cmd "gh")
    @test "$1" = "v$(jq -r .version openai/plugin.json)" || { echo "Release tag must match plugin versions" >&2; exit 1; }
    gh release create "$1" team-wiki-claude.zip team-wiki-openai.zip --verify-tag --generate-notes
