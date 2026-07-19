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
