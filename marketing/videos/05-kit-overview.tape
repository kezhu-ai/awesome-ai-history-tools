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
