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
