# Homebrew Tap for ClaudeWatch

## Install

```bash
brew tap gitwithuli/tap
brew install --cask claudewatch
```

## What is ClaudeWatch?

A minimal macOS menu bar app to track your Claude Code Pro/Max usage limits.

- 🟢🟡🟠🔴 Color-coded 5h + weekly usage in menu bar
- macOS notifications at 70%, 85%, 95%
- **No Python required** - standalone app

## Prerequisites

Claude Code CLI must be authenticated first:

```bash
npm install -g @anthropic-ai/claude-code
claude  # opens browser for OAuth
```

## More Info

https://github.com/gitwithuli/claudewatch

## Uninstall

```bash
brew uninstall --cask claudewatch
```
