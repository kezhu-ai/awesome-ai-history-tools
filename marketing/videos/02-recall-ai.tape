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
