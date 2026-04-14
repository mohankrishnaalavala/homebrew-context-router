# homebrew-context-router

Homebrew tap for [context-router](https://github.com/mohankrishnaalavala/context-router) — a local-first CLI and MCP server that selects the minimum useful context for AI coding agents.

## Install

```bash
brew tap mohankrishnaalavala/context-router
brew install context-router
```

## Usage

```bash
# 1. Initialise a project
context-router init

# 2. Configure your AI coding agent (auto-detects Claude Code, Copilot, Cursor, Windsurf, Codex)
context-router setup

# 3. Index the repository
context-router index

# 4. Get a ranked context pack
context-router pack --mode implement --query "add pagination to the users endpoint"
```

## What is context-router?

context-router indexes your repo's symbols, dependency edges, call graphs, and test coverage into a local SQLite database, then ranks and serves the minimum relevant context within a token budget — typically **64–80% token reduction** vs feeding the whole codebase.

- **13 MCP tools** compatible with Claude Code, Cursor, and Windsurf
- **5 language analyzers**: Python, TypeScript/JS, Java, .NET/C#, YAML
- **4 task modes**: review, implement, debug, handover
- No API key required — runs fully local

## Other install methods

```bash
# uv (recommended)
uv tool install context-router-cli

# pip / pipx
pip install context-router-cli
pipx install context-router-cli
```

## Links

- [GitHub](https://github.com/mohankrishnaalavala/context-router)
- [PyPI](https://pypi.org/project/context-router-cli/)
- [Documentation](https://github.com/mohankrishnaalavala/context-router#readme)

## Updating the formula

When a new version is released on PyPI:

1. Get the new wheel URL and sha256 from [PyPI](https://pypi.org/project/context-router-cli/#files)
2. Update `version`, `url`, and `sha256` in `Formula/context-router.rb`
3. Update any dependency versions if needed
4. Commit and push to this repo
