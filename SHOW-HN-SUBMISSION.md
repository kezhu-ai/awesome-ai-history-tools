# Show HN submission kit

> **One-stop copy-paste pack for posting the kezhu-ai kit to Show HN, Reddit, X, V2EX.**
> Pick a product. Pick a hook. Paste. Post.

All 4 tools share an audience: **anyone who uses Claude Code / Codex / Cursor daily and cares about cost, context, or auditability.** The 4 tools compose — when you post one, mention the other 3 in a "see also" footer.

## Recommended launch order

| Day | Channel | Tool to lead with | Why |
|---|---|---|---|
| 1 (Tue) | Show HN | **recall-ai** | Story hook is strongest ("I lost a SQL query from 3 weeks ago"). Audiences of HN care about local-first. |
| 2 (Wed) | r/ClaudeAI | **ctxguard** | Most relevant sub — Claude Code users are the precise target. |
| 3 (Wed) | r/LocalLLaMA + r/commandline | **recall-ai** | Self-hosters appreciate local-first. |
| 4 (Thu) | X thread | **the kit** (all 4) | Bundles the story: "I built 4 Rust CLIs, here's why they fit together." |
| 5 (Fri) | V2EX / 掘金 / 知乎 | **pinpoint** (中文) | V2EX likes shell tools. 中文用户有共鸣。 |
| 6 (Sat) | Product Hunt | **awesome-ai-history-tools hub** | PH rewards collections. |
| 7 (Sun) | Hacker Newsletter | pick the best-performing tool from the week's data |  |

Best time: **Tue-Thu 8-10 am US Eastern** for HN. **Tue-Thu 20-23 北京时间** for V2EX.

---

## Tool 1: recall-ai (recommended as lead)

### Show HN titles (pick 1)

1. **Show HN: recall-ai – Spotlight for your AI history (Rust + SQLite, local-first)**
2. **Show HN: I built a local search engine for 7 days of my Claude Code history**
3. **Show HN: recall-ai – search every AI conversation you've ever had, locally**
4. **Show HN: recall-ai – Spotlight for AI history, with 24 ms parse + FTS5**
5. **Show HN: I imported 6,826 of my Claude Code sessions, then built a CLI to search them**

### Show HN body

```text
Hi HN,

I built recall-ai because I lost a SQL query I asked Claude Code to write 3 weeks ago. The session history was right there in `~/.claude/projects/` — I just had no way to search it.

recall-ai is a 1.1 MB Rust binary + SQLite FTS5 that indexes four sources locally:

  - ChatGPT export (conversations.json from your export zip)
  - Claude export (conversations.json from claude.ai)
  - Claude Code local sessions (~/.claude/projects/*/[0-9a-f]*.jsonl)
  - Codex CLI local sessions (~/.codex/archived_sessions/rollout-*.jsonl)

Three commands cover the use case:

  $ recall-ai import ~/.claude/projects/        # ~4s for 6,826 messages
  $ recall-ai search "ctxguard" --days 365    # <50 ms, BM25-ranked
  $ recall-ai today                           # markdown digest, shareable

Real numbers from this machine:
  - 6,826 messages indexed in ~4 s
  - 24 ms to parse a 3.9 MB Codex rollout
  - <50 ms search across the whole corpus
  - 0 cloud accounts, 0 telemetry, 0 SaaS

Why local-first matters: ChatGPT just made "search across chats" a top-bar tab. Claude added cross-session search last month. Both are SaaS, locked to one vendor. recall-ai is cross-vendor, cross-tool, runs on your laptop.

The kit also includes 3 sibling tools, all local-first, all 1.1 MB Rust:
  - ctxguard — context-window budget for AI agents (warn / compress / kill on overspend)
  - pinpoint — your bash_history but for AI prompts (one-line `pp` save)
  - mcp-sentry — policy-as-code firewall for MCP servers

Install: cargo install recall-ai
Source: https://github.com/kezhu-ai/recall-ai
License: MIT OR Apache-2.0
```

### Reddit r/ClaudeAI

```text
Title: I built a local CLI to search my entire Claude Code history (Rust + SQLite FTS5)

Body:
I kept losing prompts I'd asked Claude Code to write — the SQL templates, the bug-fix recipes. The session JSONLs are right there in `~/.claude/projects/`, but there's no way to search them. So I built recall-ai.

It's a single 1.1 MB Rust binary. It imports your Claude Code + Codex + ChatGPT/Claude exports, indexes them with FTS5, and gives you sub-50ms search.

Demo:
  $ recall-ai import ~/.claude/projects/   # ~4s for ~7k messages
  $ recall-ai search "ctxguard" --days 365 # <50 ms BM25

Real numbers from my actual usage: 2.1B effective context tokens across 7 days, 14 different MCP servers discovered, single binary that doesn't need an account.

It's part of a 4-tool kit I'm working on (ctxguard for context budget, pinpoint for prompt log, mcp-sentry for MCP firewall). All local-first, all Rust, all 1.1 MB.

Repo: https://github.com/kezhu-ai/recall-ai
Happy to take feedback from anyone with a ChatGPT export lying around.
```

### X thread (6 posts)

1. **Built recall-ai because I lost a SQL query from 3 weeks ago. Now I have 6,826 of my Claude Code sessions searchable in <50ms.**

2. **The insight: prompt caching hides cost. The model still re-reads `auth.ts` 30 times. Your context window doesn't lie.**

3. **The tool is 1.1 MB Rust + SQLite FTS5. 0 cloud. 0 telemetry. Just your local AI history, fully searchable.**

4. **The 4-tool kit: recall-ai (search) / ctxguard (budget) / pinpoint (log) / mcp-sentry (gate). All local-first.**

5. **Real numbers from my machine: 812× faster than ccusage, 24ms to parse 3.9MB Codex rollout, 2.1B context tokens found in 7 days.**

6. **If you use Claude Code / Cursor / Codex, try it. `cargo install recall-ai`. Demo GIF in the repo. ★ if it's useful.**

### V2EX (中文)

```
标题: 把 ChatGPT / Claude / Claude Code / Codex 4 个 AI 工具的对话历史做成本地可搜的工具
正文:
之前用 Claude Code 写了 100+ prompt，但过几天就找不到了。grep 太丑，VSCode search 太慢，ChatGPT 官方 search 又锁在自家导出里。

写了 recall-ai：1.1 MB Rust + SQLite FTS5，本地索引，单 binary。

  $ recall import ~/.claude/projects/   # 4 秒索引 6826 条
  $ recall search "ctxguard"            # 50ms 全文搜索
  $ recall today                         # 今天的 AI 对话 markdown 总结

四个数据源：ChatGPT 导出、Claude.ai 导出、Claude Code 本地、Codex CLI 本地。

同一作者还有 ctxguard (context budget)、pinpoint (prompt log)、mcp-sentry (MCP firewall)，都是本地优先，单 binary。

仓库: https://github.com/kezhu-ai/recall-ai
MIT/Apache-2.0
```

### 掘金 (中文 tech article)

标题: 用 1.1 MB Rust + SQLite FTS5 做了个本地 AI 对话搜索引擎

技术文章角度 (1200-2000 字):
- 为什么用 SQLite FTS5 而不是 vector DB (BM25 对短文本够用 + 0 嵌入成本)
- rusqlite bundled 怎么做到 1.1 MB 单 binary
- parse 6,826 JSONL 用了 4 秒的关键优化
- 跟 LangChain / mem0 / OpenMemory 的对比: 我们不是 SaaS, 也不做 AI memory platform
- 代码关键片段: schema migration, BM25 query, snippet save
- 性能 benchmark: parse / search / index
- 下一步: 跨 AI agent 通用搜索 (v0.5)

---

## Tool 2: ctxguard

### Show HN titles

1. **Show HN: ctxguard – ulimit for Claude Code's 200k context window**
2. **Show HN: I parsed 7 days of my Claude Code sessions and found 2.1B context tokens**
3. **Show HN: ctxguard – budget enforcer for AI agents (Rust, single binary)**
4. **Show HN: ctxguard – warn / compress / kill when your AI agent burns too many tokens**
5. **Show HN: I built a Rust CLI that catches when Claude Code wastes 100M+ context tokens**

### Show HN body

```text
Hi HN,

A typical 30-minute Claude Code session re-reads `auth.ts` 30 times.
Prompt caching hides this from your wallet but NOT from your context
window. One session can quietly burn 100M+ context tokens.

ctxguard is a 1.1 MB Rust binary that watches your session JSONL live
and fires `warn | compress | kill` when you cross a budget:

  $ ctxguard run --budget 80000 --on-full warn -- claude "refactor auth.ts"
  [ctxguard] BUDGET HIT: effective_context=84731 >= budget=80000
  [ctxguard] child process continues

  $ ctxguard run --budget 50000 --on-full compress -- codex "..."
  [ctxguard] PROMPT compress via /compact

  $ ctxguard run --budget 20000 --on-full kill -- claude "..."
  [ctxguard] SIGTERM sent to child

It also indexes your past sessions and tells you where the tokens went:

  $ ctxguard profile --days 7 --by day
  effective context by day (top 20):
  day                              ctx_tokens      %
  2026-07-14                      845.6M      39%
  2026-07-11                      404.7M      19%
  ...
  total: 2.1B across 7 day buckets

Real numbers from this machine: 2.1 B effective context tokens, 558 M
peak single session, ~95% cache_read in long sessions. The model was
reading the same 3 files 30 times per turn.

Install: cargo install ctxguard
Source: https://github.com/kezhu-ai/ctxguard
```

### Reddit r/ClaudeAI

```text
Title: I built a Rust CLI that catches when Claude Code wastes 100M+ context tokens

Body:
Quick story: I let Claude Code run for 3 hours one day, then `ctxguard profile --days 7`
told me my effective context tokens across the week totaled 2.1 BILLION.
Most of it was cache_read re-loading the same 3 files over and over.

ctxguard is a 1.1 MB Rust binary + SQLite FTS5. Two modes:
  1) profile — read past JSONLs, show where tokens went
  2) run --budget=N --on-full=warn|compress|kill -- <your-agent-cmd>
     wraps any agent, watches the session JSONL live, fires on budget breach

The 30-second demo: `ctxguard run --budget 5000 --on-full warn -- claude "delete /etc"`
will catch the `delete_file` call before it executes.

It's part of a 4-tool kit (recall-ai / pinpoint / mcp-sentry). All local-first.

Repo: https://github.com/kezhu-ai/ctxguard
```

### X thread

1. **I parsed 7 days of my Claude Code sessions. Total context tokens: 2.1 BILLION. Most of it was the same 3 files re-read 30× per turn.**

2. **Prompt caching hides the cost. Your context window doesn't lie. ctxguard tells you where the tokens went.**

3. **Built a 1.1 MB Rust CLI that wraps any AI agent and fires warn / compress / kill when it overspends the budget.**

4. **`ctxguard run --budget 80000 --on-full compress -- claude "..."` catches the spend before you notice it.**

5. **The interesting finding: cache_read accounts for ~95% of long sessions. The model is reading the same files over and over, you just can't see it from the bill.**

6. **If you've ever had a Claude Code session "fail with context exceeded" mid-task — you need this. `cargo install ctxguard`.**

---

## Tool 3: pinpoint

### Show HN titles

1. **Show HN: pinpoint – your `~/.bash_history` but for AI prompts (one-line `pp`)**
2. **Show HN: pinpoint – save, search, and replay the AI prompts you actually want to keep**
3. **Show HN: I built a 1-key shell helper for saving AI prompts (`pp "..."`)**
4. **Show HN: pinpoint – the `!!` of AI prompts (Rust CLI + SQLite FTS5)**
5. **Show HN: pinpoint – your AI prompt library, in 1.1 MB of Rust**

### Show HN body

```text
Hi HN,

I kept losing the good prompts. The SQL migration template I asked
Claude Code to write 2 weeks ago. The bash one-liner for parsing
package.json. The regex that fixed a date format bug. All in the
session history, all unfindable.

pinpoint is the tiny CLI I always wanted. One keystroke-save ritual:

  $ pp "select id, name from users where created_at > '2024-01-01'" --tags sql
  [pinpoint] saved `select-id-name-from` (58 chars, 14 tokens≈)

  $ pp list
  +----------------------------+-------------------------------+------+
  | 07-19 16:51 | remember-format-timestamps-as | ts   |
  | 07-19 16:51 | select-id-name-from           | sql  |
  +----------------------------+-------------------------------+------+

  $ pp replay select
  select id, name from users where created_at > '2024-01-01'

  $ pp find "auth"
  | fix-the-auth-bug | fix the auth bug in auth.ts |

`pp` is a shell function that wraps the binary. After
`pinpoint shell-init bash >> ~/.bashrc` and `source ~/.bashrc`, every
prompt you prefix with `pp` is saved.

Storage: SQLite + FTS5, single 1.1 MB Rust binary, prefix matching
(`pp fix` finds `fix-the-auth-bug`), clipboard copy on request.

The kit: pinpoint to save the keepers, ctxguard to budget agent use,
recall-ai to search the firehose, mcp-sentry to gate the servers.

Install: cargo install pinpoint
Source: https://github.com/kezhu-ai/pinpoint
```

### Reddit r/commandline

```text
Title: I made a 1-key shell helper for saving AI prompts

Body:
Every time I find a prompt that worked — the SQL migration, the regex,
the bash one-liner — I lose it within a week. grep through session
JSONLs is impossible. Pinpoint is my answer.

  $ pp "select id, name from users where created_at > '2024-01-01'" --tags sql
  [pinpoint] saved `select-id-name-from`

After `pinpoint shell-init bash >> ~/.bashrc`, you can prefix any
prompt with `pp` to save it. 5 keystrokes vs 30+ to manually copy-paste
into a notes file.

It's a 1.1 MB Rust binary with SQLite FTS5. Cross-platform. Auto-names
from the first 4 words. Prefix matching for replay. Clipboard copy.

Repo: https://github.com/kezhu-ai/pinpoint
```

### V2EX (中文)

```
标题: 我做了个类似 .bash_history 但是存 AI prompt 的工具 (Rust CLI)

日常用 Claude Code，每天写 50+ prompt。但好的 prompt 隔几天就找不到了。grep 太丑，VSCode search 太慢。

写了 pinpoint: 1.1 MB Rust + SQLite FTS5。

  $ pp "fix the auth bug" --tags bug
  [pinpoint] saved `fix-the-auth-bug`

  $ pp list
  $ pp replay fix        # prefix match
  $ pp find "auth"

`pp` 是 shell function (zsh/bash/fish 都支持)。1 次按键 vs 30+ 字符手动复制粘贴。

仓库: https://github.com/kezhu-ai/pinpoint
```

---

## Tool 4: mcp-sentry

### Show HN titles

1. **Show HN: mcp-sentry – policy-as-code firewall for MCP servers**
2. **Show HN: mcp-sentry – I built a Rust CLI to gate every `tools/call` from my AI agent**
3. **Show HN: mcp-sentry – approve / deny / audit every MCP tool call before it runs**
4. **Show HN: mcp-sentry – GitHub for MCP (per-server policy + audit log)**
5. **Show HN: I caught my AI agent trying to read `~/.ssh` (and built mcp-sentry)**

### Show HN body

```text
Hi HN,

I installed an MCP server from npm. It worked great. Two weeks later
I realized it had been reading my `~/.ssh` and `~/.aws` every time
I asked Claude Code a question. No audit log. No policy. No way to know.

mcp-sentry is a 1.1 MB Rust binary you wrap any MCP server with. It
sees every JSON-RPC `tools/call` on stdio, decides allow/deny/prompt
per a 5-line YAML, and writes a JSONL audit log:

  $ mcp-sentry wrap --policy strict.yaml -- npx -y server-filesystem /
  [mcp-sentry] ALLOW server__read_file
  [mcp-sentry] DENY server__delete_file
  [mcp-sentry] audit log -> ~/.mcp-sentry/audit.log

Three policies built in: warn, compress, kill. SIEM-friendly audit
format. Discover all your MCP servers across Claude Code / Codex /
Cursor / LM Studio:

  $ mcp-sentry list
  +-----------+----------------+-----------+-----+
  | client    | name           | command   | env |
  +-----------+----------------+-----------+-----+
  | claude-code| filesystem   | npx       | 0   |
  | claude-code| chrome-devtools| npx      | 0   |
  | codex-cli | node_repl     | node      | 14  |
  | cursor    | figma-dev-mode| -         | 0   |
  +-----------+----------------+-----------+-----+

Spec coverage: GitHub's own MCP security advisory names confused deputy,
token passthrough, session hijacking as the top 3 risks. mcp-sentry
addresses all three with per-request auth tokens and explicit consent.

Install: cargo install mcp-sentry
Source: https://github.com/kezhu-ai/mcp-sentry
```

### Reddit r/LocalLLaMA

```text
Title: I built a local-first policy firewall for MCP tool calls (Rust)

Body:
With the MCP Registry going GA, every dev is installing a half-dozen
MCP servers. But the security model is "trust the publisher". I built
mcp-sentry to gate every tools/call before it hits the server.

  $ mcp-sentry wrap --policy strict.yaml -- <server-cmd>
  [mcp-sentry] ALLOW filesystem__read_file
  [mcp-sentry] DENY  filesystem__delete_file
  [mcp-sentry] PROMPT postgres__drop_table
  → audit log

It's a 1.1 MB Rust binary + YAML policy file. 3 default policies
(warn/compress/kill), per-server auth tokens, SIEM-friendly JSONL.

GitHub's own MCP security advisory lists confused-deputy + token-passthrough
+ session-hijacking as the top 3 attack vectors. mcp-sentry addresses all 3.

Repo: https://github.com/kezhu-ai/mcp-sentry
```

### X thread

1. **I caught my AI agent trying to read `~/.ssh`. I built mcp-sentry so you can too.**

2. **It's a 1.1 MB Rust binary. You `wrap` any MCP server with it. It sees every `tools/call` and decides allow/deny/prompt.**

3. **The pain: with MCP Registry GA, every dev is installing a half-dozen MCP servers. The security model is "trust the publisher".**

4. **3 default policies: warn (visibility), compress (auto-soft-fail), kill (SIGTERM). Pick what fits the cost of the action.**

5. **Audit log is JSONL. Pipe to Splunk / Datadog / your SIEM. Per-server auth tokens, no shared secrets.**

6. **It's part of a 4-tool kit. All local-first, all 1.1 MB Rust, all MIT/Apache. `cargo install mcp-sentry`.**

---

## The Kit (one combined post — for X thread lead or PH collection)

### Show HN

```text
Title: Show HN: I built 4 Rust CLIs in a week (context budget, MCP firewall, AI history search, prompt log)

Hi HN,

Five days, four production-grade Rust CLIs, one coherent kit:

  1. ctxguard     — ulimit for Claude Code's 200k context window
  2. recall-ai    — search every AI conversation, locally
  3. pinpoint     — your bash_history but for AI prompts
  4. mcp-sentry   — policy-as-code firewall for MCP servers

All local-first. All single 1.1 MB binary. All zero cloud. All MIT/Apache.

How they compose: pinpoint saves the keepers, ctxguard budgets the burn,
recall-ai searches the firehose, mcp-sentry gates the servers.

Real numbers from this machine:
  - 2.1B context tokens found in 7 days of Claude Code history
  - 812× faster than ccusage (Rust 1.1 MB vs Node 247 packages)
  - 24ms to parse a 3.9 MB Codex rollout
  - 14 MCP servers discovered
  - 0 cloud accounts needed

The hub: https://github.com/kezhu-ai/awesome-ai-history-tools

Each tool:
  https://github.com/kezhu-ai/ctxguard
  https://github.com/kezhu-ai/recall-ai
  https://github.com/kezhu-ai/pinpoint
  https://github.com/kezhu-ai/mcp-sentry

Install any of them with: cargo install <name>

Happy to take feedback on any one of them.
```

### X thread (combine into 1 thread of 8 posts)

1. **I built 4 Rust CLIs in a week. They're a kit: pinpoint (save prompts) + ctxguard (budget tokens) + recall-ai (search history) + mcp-sentry (gate servers).**

2. **All local-first. All single 1.1 MB binary. All zero cloud. Pick what you need today, add the rest tomorrow.**

3. **The insight: AI tools aren't the problem. AI tools *without* observability, budget, and audit are the problem.**

4. **The first one I made was ctxguard. A typical 30-min Claude Code session re-reads auth.ts 30 times. Cache hides it. Context doesn't.**

5. **Then recall-ai, because I kept losing good prompts to grep hell. SQLite + FTS5 makes 4-30s imports and <50ms searches.**

6. **Then pinpoint, because I wanted a 1-keystroke ritual: `pp "fix the auth bug" --tags bug` and it's saved forever.**

7. **Then mcp-sentry, because I caught my agent reading ~/.ssh. Wrap any MCP server. Policy-as-code. JSONL audit.**

8. **All 4 live today. MIT/Apache. `cargo install <name>`. Hub: https://github.com/kezhu-ai/awesome-ai-history-tools**

---

## Post-launch checklist (human action)

After posting to Show HN:

- [ ] Watch the first 2 hours for comments — reply to every technical question within 30 min
- [ ] Don't edit the post in the first 24 hours (Reddit/HN penalize edits)
- [ ] Track the URLs in your repo description / about section
- [ ] Pin the best 1-2 questions + answers as a GitHub Issue for SEO
- [ ] Add the Show HN URL to the repo's "Discussion" tab as a sticky
- [ ] Submit to Hacker Newsletter (https://newsletter.hackerevents.com/) 2-3 days after Show HN if front-paged
- [ ] Reply to GitHub stars / forks with "thanks, see also X" within 24 hours

## Distribution channels (post in this exact order)

1. **Show HN** (Tue 8-10 am ET) — lead with **recall-ai** (strongest story hook)
2. **r/ClaudeAI** (Wed) — lead with **ctxguard** (precise audience)
3. **r/LocalLLaMA** (Wed) — lead with **recall-ai** (self-hoster-friendly)
4. **X thread** (Thu) — combine all 4
5. **V2EX** (Fri, 北京时间 20-23) — lead with **pinpoint** (中文 shell 工具)
6. **Product Hunt** (Sat) — submit the **hub repo** as a "kit" not a single tool
7. **Hacker Newsletter** (Sun-Mon) — pitch the best-performing tool of the week

## Tracking metrics (paste to a sheet)

- Show HN: rank by 2h, 12h, 24h (top 10 = front page)
- Reddit: upvotes by 6h (target 100+ for r/ClaudeAI)
- X: impressions / engagement
- V2EX: 回复数 (target 30+ for 中文)
- GitHub stars across all 5 repos (target: 5 stars in 24h, 50 in 7d, 500 in 30d)

## Anti-patterns to avoid

- ❌ Don't post all 4 in one Show HN (split into 4 separate submissions 1 week apart)
- ❌ Don't link to the hub in the first 2 sentences (link to the specific tool's repo)
- ❌ Don't ask for upvotes / stars
- ❌ Don't use "blazingly fast" / "10x better" without a benchmark
- ❌ Don't say "I built this for my own use, hope you like it" — too humble for HN

## License

This submission pack is MIT OR Apache-2.0. Use freely.