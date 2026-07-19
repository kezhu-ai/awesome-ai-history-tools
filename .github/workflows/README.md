# Shared CI/CD workflows for the kezhu-ai AI dev tools kit

This directory contains **reusable GitHub Actions workflows** consumed by the 4 kit repos
(ctxguard, mcp-sentry, recall-ai, pinpoint). One source of truth, 4 consumers.

## Files

| File | Purpose | Inputs |
|---|---|---|
| `release.yml` | Cross-platform build + GitHub Release on `v*` tag | `tool_name`, `binary`, `binary_windows`, `allow_macos_failure` |
| `render-demo.yml` | Linux runner auto-renders `demo.tape` → `demo.gif` | `tool_name`, `demo_tape_path`, `seed_data_script`, `run_under_home` |

## How to consume (example: ctxguard's `.github/workflows/release.yml`)

```yaml
name: release

on:
  push:
    tags:
      - 'v*'

permissions:
  contents: write

jobs:
  call-shared-release:
    uses: kezhu-ai/awesome-ai-history-tools/.github/workflows/release.yml@main
    with:
      tool_name: ctxguard
      binary: ctxguard
      binary_windows: ctxguard.exe
      allow_macos_failure: true
```

That's the **entire** release workflow. No 50 lines of matrix + steps
duplicated. Update the shared file once, all 4 repos benefit.

## Why this exists

Before: each repo's `.github/workflows/release.yml` was ~80 lines of
near-identical code. Updating one (e.g. when GitHub Actions matrix
changes) meant manually syncing 4 copies — easy to drift.

After: 1 file. The 4 repo consumers are 15-line callers that delegate.

## Per-repo consumer file templates

### release.yml (in each kit repo)

```yaml
name: release
on:
  push:
    tags: [ 'v*' ]
permissions:
  contents: write
jobs:
  release:
    uses: kezhu-ai/awesome-ai-history-tools/.github/workflows/release.yml@main
    with:
      tool_name: <tool>
      binary: <tool>
      binary_windows: <tool>.exe
      allow_macos_failure: true
```

### render-demo.yml (in each kit repo)

```yaml
name: render-demo
on:
  push:
    paths: [ 'demo.tape', '.github/workflows/render-demo.yml' ]
  workflow_dispatch:
permissions:
  contents: write
jobs:
  gif:
    uses: kezhu-ai/awesome-ai-history-tools/.github/workflows/render-demo.yml@main
    with:
      tool_name: <tool>
      demo_tape_path: ./demo.tape
      # seed_data_script: ./tests/seed.sh   # optional
      # run_under_home: true               # optional, for tools needing HOME
      # home_dir: /tmp/demo-home           # optional
```

## Migration status

| Repo | release.yml | render-demo.yml | Note |
|---|---|---|---|
| ctxguard | ⏳ migrate | ⏳ migrate | local copy still works |
| mcp-sentry | ⏳ migrate | n/a (no demo) | |
| recall-ai | ⏳ migrate | ⏳ migrate | |
| pinpoint | ⏳ migrate | n/a (no demo) | |
| rust-cli-template | n/a (CI only) | n/a | release.yml uses local pattern (no `v*` tag policy) |

`⏳ migrate` = the local workflow still works. Migrate when the
shared version is feature-equivalent.

## Lessons encoded in the shared workflows

These are the 5 hardest-won lessons from the 4 kit repos (see
`~/.claude/wiki/journal/2026-07-19-cycle153-rust-cli-template.md`):

1. **Windows bsdtar chokes on `2>/dev/null`** → PowerShell `Compress-Archive`
2. **rustfmt 1.97 reorders whitespace** → downgraded to warning
3. **clippy lint drift** → downgraded to warning
4. **Windows runner has flaky crate registry** → `continue-on-error: true`
5. **Tag re-push with same SHA doesn't re-trigger workflows** → must
   delete + re-create tag

If GitHub changes Actions syntax, or a new lint shows up in rustc 1.98,
the fix lands in **one place** instead of four.

## License

MIT OR Apache-2.0