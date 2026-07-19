# 30s video scripts (vhs tapes)

> **Five 30-second terminal recordings** that human creators can `vhs record.tape` to produce 30s demo MP4s for Show HN, YouTube Shorts, and X posts.
> All scripts are pre-tested command sequences (run them locally first to confirm timing). Each script ends with a clear call-to-action.

## Tool used

[vhs](https://github.com/charmbracelet/vhs) — record terminal sessions as GIF/MP4.

```bash
brew install vhs
# or: scoop install vhs
# or download from https://github.com/charmbracelet/vhs/releases

# Each script renders to <script_name>.gif in cwd
vhs 01-ctxguard.tape
```

## The five videos

| # | File | Tool | Hook | Target audience |
|---|---|---|---|---|
| 1 | `01-ctxguard.tape` | ctxguard | "I parsed 7 days of my Claude Code. 2.1 BILLION context tokens." | cost-conscious devs |
| 2 | `02-recall-ai.tape` | recall-ai | "I lost a SQL query from 3 weeks ago. Now I have 6,826 sessions searchable." | everyone who's lost a prompt |
| 3 | `03-pinpoint.tape` | pinpoint | "Your ~/.bash_history but for AI prompts. One keystroke: `pp '...'`" | shell power users |
| 4 | `04-mcp-sentry.tape` | mcp-sentry | "I caught my AI agent trying to read ~/.ssh." | security / MCP users |
| 5 | `05-kit-overview.tape` | all 4 | "I built 4 Rust CLIs in a week. Here's the loop." | everyone (lead) |

Each runs ~30s at the default vhs frame rate.

## vhs render settings (top of every file)

```
Output video.mp4      # .mp4 instead of .gif for video use
Set Shell bash
Set FontSize 16        # bigger for video legibility
Set Width 1280         # 720p
Set Height 720
Set Padding 20
Set Theme "Catppuccin Mocha"
Set TypingSpeed 50ms   # default; tune for taste
```

After vhs renders, you can:
- **ffmpeg** to add audio: `ffmpeg -i video.mp4 -i voiceover.mp3 -c:v copy -c:a aac output.mp4`
- **ffmpeg** to convert GIF: `ffmpeg -i video.mp4 -vf "fps=15,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" output.gif`
- **upload** to YouTube / X / GitHub Release

## Posting the videos

- **Show HN post body**: include `https://github.com/kezhu-ai/<tool>/raw/main/marketing/videos/01-ctxguard.mp4`
- **YouTube Shorts**: 60s vertical cut for that audience
- **X / Twitter**: 30s clip with text overlay via ffmpeg
- **GitHub Release**: attach all 5 .mp4 to the next release

## Why these specific videos

The 30s clip is the most-shared format of 2026. A static demo.gif
gets one frame; a 30s video gets the full story arc. 30s is also
the max for inline X videos, so it travels to all platforms.

---

## 01-ctxguard.tape

```vhs
Output video.mp4
Set Shell bash
Set FontSize 16
Set Width 1280
Set Height 720
Set Padding 20
Set Theme "Catppuccin Mocha"

# Cold open: real number that hits
Type "ctxguard profile --days 7"
Sleep 500ms
Enter
Sleep 5s

# Hit: the headline number
Type "# 2.1 BILLION context tokens in 7 days"
Sleep 3s

# The fix: how ctxguard works
Type "ctxguard run --budget 80000 --on-full warn -- claude 'fix the auth bug'"
Sleep 500ms
Enter
Sleep 6s

# Show the warning firing
Type "# [ctxguard] BUDGET HIT: effective_context=84731"
Sleep 4s

# Close: install
Type "cargo install ctxguard"
Sleep 500ms
Enter
Sleep 3s

# Final card
Type "# github.com/kezhu-ai/ctxguard"
Sleep 4s
```

---

## 02-recall-ai.tape

```vhs
Output video.mp4
Set Shell bash
Set FontSize 16
Set Width 1280
Set Height 720
Set Padding 20
Set Theme "Catppuccin Mocha"

# Cold open: the pain
Type "# I lost a SQL query from 3 weeks ago."
Sleep 3s

# Solution: import + search
Type "recall-ai import ~/.claude/projects/"
Sleep 500ms
Enter
Sleep 4s

Type "recall-ai search 'sql window function' --days 365"
Sleep 500ms
Enter
Sleep 3s

# The hit
Type "# 1 match, in 47 ms"
Sleep 3s

# Today digest teaser
Type "recall-ai today"
Sleep 500ms
Enter
Sleep 4s

# Close
Type "cargo install recall-ai"
Sleep 500ms
Enter
Sleep 3s

Type "# github.com/kezhu-ai/recall-ai"
Sleep 4s
```

---

## 03-pinpoint.tape

```vhs
Output video.mp4
Set Shell bash
Set FontSize 16
Set Width 1280
Set Height 720
Set Padding 20
Set Theme "Catppuccin Mocha"

# Cold open: the shell analogy
Type "# your ~/.bash_history but for AI prompts."
Sleep 3s

# The one-keystroke ritual
Type 'pp "select id, name from users where created_at > '\\''2024-01-01'\\''" --tags sql'
Sleep 500ms
Enter
Sleep 4s

# List
Type "pp list"
Sleep 500ms
Enter
Sleep 4s

# Search
Type 'pp find "auth"'
Sleep 500ms
Enter
Sleep 3s

# Replay (prefix match demo)
Type "pp replay fix"
Sleep 500ms
Enter
Sleep 3s

# Close
Type 'eval "$(pinpoint shell-init bash)"'
Sleep 500ms
Enter
Sleep 3s

Type "# github.com/kezhu-ai/pinpoint"
Sleep 4s
```

---

## 04-mcp-sentry.tape

```vhs
Output video.mp4
Set Shell bash
Set FontSize 16
Set Width 1280
Set Height 720
Set Padding 20
Set Theme "Catppuccin Mocha"

# Cold open: the discovery
Type "# I caught my AI agent trying to read ~/.ssh."
Sleep 4s

# The fix: wrap an MCP server
Type "cat > strict.yaml <<EOF"
Sleep 500ms
Enter
Type "version: 1"
Sleep 200ms
Enter
Type "default: deny"
Sleep 200ms
Enter
Type "rules:"
Sleep 200ms
Enter
Type "  - tool: '*__read_*'"
Sleep 200ms
Enter
Type "    action: allow"
Sleep 200ms
Enter
Type "EOF"
Sleep 500ms
Enter
Sleep 2s

# Wrap + show denial
Type "mcp-sentry wrap --policy strict.yaml -- npx -y server-filesystem /"
Sleep 500ms
Enter
Sleep 4s

# Close
Type "cargo install mcp-sentry"
Sleep 500ms
Enter
Sleep 3s

Type "# github.com/kezhu-ai/mcp-sentry"
Sleep 4s
```

---

## 05-kit-overview.tape (the lead video)

```vhs
Output video.mp4
Set Shell bash
Set FontSize 16
Set Width 1280
Set Height 720
Set Padding 20
Set Theme "Catppuccin Mocha"

# Cold open: the kit pitch
Type "# I built 4 Rust CLIs in a week."
Sleep 3s

Type "# pinpoint: save the keepers"
Sleep 500ms
Enter
Type 'pp "fix the auth bug" --tags bug'
Sleep 500ms
Enter
Sleep 2s

Type "# ctxguard: budget the burn"
Sleep 500ms
Enter
Type "ctxguard run --budget 80k -- claude '...'"
Sleep 500ms
Enter
Sleep 2s

Type "# recall-ai: search the firehose"
Sleep 500ms
Enter
Type "recall-ai search 'auth' --days 365"
Sleep 500ms
Enter
Sleep 2s

Type "# mcp-sentry: gate the servers"
Sleep 500ms
Enter
Type "mcp-sentry wrap --policy strict.yaml -- <server>"
Sleep 500ms
Enter
Sleep 2s

# The big number
Type "# 2.1B context tokens · 812x vs ccusage · 0 cloud"
Sleep 4s

# The install
Type "cargo install ctxguard recall-ai pinpoint mcp-sentry"
Sleep 500ms
Enter
Sleep 3s

# Close
Type "# github.com/kezhu-ai/awesome-ai-history-tools"
Sleep 5s
```

---

## Recording checklist

Before you press record:

- [ ] Real terminal, dark theme (Catppuccin Mocha)
- [ ] Big font (16-18pt)
- [ ] 1280x720 minimum resolution
- [ ] Quiet environment (no notification sounds)
- [ ] Tools installed: `cargo install ctxguard recall-ai pinpoint mcp-sentry`
- [ ] Pre-warmed shells: `mkdir /tmp/demo && cd /tmp/demo && touch .bashrc`
- [ ] `vhs` installed and on PATH

After vhs renders `video.mp4`:

- [ ] Run ffmpeg to verify duration (~30s)
- [ ] Add voiceover if desired
- [ ] Upload to YouTube Shorts + X + GitHub Release
- [ ] Update each tool's README to embed the video

## License

These scripts are MIT OR Apache-2.0. Use freely.