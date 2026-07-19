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
