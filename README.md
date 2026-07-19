# awesome-ai-history-tools

> Four Rust CLIs that work together to make your AI coding workflow less wasteful, more searchable, and more controllable. Local-first, single binary, zero cloud.

```
$ pinpoint log "fix the auth bug in auth.ts"        # save the keepers
$ ctxguard run --budget 80000 -- claude "..."      # budget the burn
$ recall-ai search "auth bug"                      # find what you forgot
$ mcp-sentry wrap --policy=strict.yaml -- ...      # gate the servers
```

## The kit

| Tool | One-liner | Star | Install |
|---|---|---|---|
| **[ctxguard](https://github.com/kezhu-ai/ctxguard)** | ulimit for Claude Code's 200k context window | ![ctxguard](https://img.shields.io/github/stars/kezhu-ai/ctxguard) | `cargo install ctxguard` |
| **[mcp-sentry](https://github.com/kezhu-ai/mcp-sentry)** | policy-as-code firewall for MCP servers | ![mcp-sentry](https://img.shields.io/github/stars/kezhu-ai/mcp-sentry) | `cargo install mcp-sentry` |
| **[recall-ai](https://github.com/kezhu-ai/recall-ai)** | search every AI conversation you've ever had, locally | ![recall-ai](https://img.shields.io/github/stars/kezhu-ai/recall-ai) | `cargo install recall-ai` |
| **[pinpoint](https://github.com/kezhu-ai/pinpoint)** | your `~/.bash_history` but for AI prompts | ![pinpoint](https://img.shields.io/github/stars/kezhu-ai/pinpoint) | `cargo install pinpoint` |

## How they fit together

```
                ┌─────────────────────────────────────────┐
                │       You + AI coding agent            │
                │  (Claude Code / Codex / Cursor / etc)  │
                └─────────────────────────────────────────┘
                              │
       ┌──────────────────────┼──────────────────────┐
       │                      │                      │
       ▼                      ▼                      ▼
┌────────────┐         ┌────────────┐         ┌────────────┐
│ pinpoint   │         │  ctxguard  │         │  recall-ai │
│            │         │            │         │            │
│ save the   │         │ budget the │         │ search the │
│ keepers    │         │ burn       │         │ firehose   │
│ (1 line)   │         │ (per run)  │         │ (1 sec)    │
└────────────┘         └────────────┘         └────────────┘
       │                      │                      │
       └────────────┬─────────┴──────────┬───────────┘
                    ▼                    ▼
              ┌────────────┐         ┌────────────┐
              │  mcp-sentry│         │ (your db)  │
              │            │         │ ~/.recall/  │
              │ gate the   │         │ ~/.pinpoint/│
              │ servers    │         │ ~/.ctxguard/│
              └────────────┘         └────────────┘
```

**Loop**: Find keepers (`pinpoint`) → budget usage (`ctxguard`) → search forgotten (`recall-ai`) → gate servers (`mcp-sentry`).

## Why four tools, not one

Each tool is a different "view" of the same problem: AI agents are expensive and hard to audit. A single megaproject would be a maintenance burden. Four single-purpose CLIs that work together give you:

- **Composability** — use just the one you need today, add another tomorrow
- **Independent release cycles** — each ships at its own pace
- **Different audiences** — `pinpoint` for shell users, `recall-ai` for "I lost a prompt" people, `ctxguard` for cost-conscious teams, `mcp-sentry` for security folks
- **Same author voice** — same coding style, same README pattern, same release cadence

## Architecture decisions across the kit

| Decision | Why |
|---|---|
| Rust 1.94 + rusqlite (bundled) | 1.1 MB single binary, zero runtime deps, no glibc compat issues |
| SQLite + FTS5 (porter + unicode61) | BM25 sub-100ms search without a server, no embedding infra needed |
| clap for CLI | de-facto standard, derive macros cut boilerplate |
| Local-first, no cloud | you own your data, no SaaS dependency, no API key required |
| `~/.local/share/<tool>/` data dir | XDG-compliant, overridable via `*_DATA_DIR` env var |
| GitHub Actions matrix (ubuntu + macos + windows) | all 4 release binaries built on every `v*` tag |

## What the kit doesn't do (deliberate)

- ❌ No cloud sync (you don't need Anthropic / OpenAI reading your prompts)
- ❌ No team mode (this is a personal kit; teams can fork and self-host)
- ❌ No SaaS control plane (we make local-first CLIs, period)
- ❌ No embeddings (yet) — FTS5 BM25 is enough for the 80% case
- ❌ No Windows ARM64 binary (matrix skip; open an issue if you need it)

## Author

Made by [@kezhu-ai](https://github.com/kezhu-ai). Solo dev, 5 days, 4 production-grade CLIs. All MIT OR Apache-2.0.

## License

MIT OR Apache-2.0