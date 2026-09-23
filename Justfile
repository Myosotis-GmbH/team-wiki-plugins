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
