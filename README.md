# Homebrew Tap for ClaudeWatch

This tap contains the [ClaudeWatch](https://github.com/gitwithuli/usage-watcher) cask.

## Installation

```bash
brew tap gitwithuli/tap
brew install --cask claudewatch
```

## What is ClaudeWatch?

A minimal macOS menu bar app to track your Claude Code Pro/Max usage limits.

- 🟢🟡🟠🔴 Color-coded 5h + weekly usage in menu bar
- macOS notifications at 70%, 85%, 95%
- Auto-retry on failures

## Prerequisites

Claude Code CLI must be installed and authenticated first:

```bash
npm install -g @anthropic-ai/claude-code
claude  # opens browser for auth
```

## Uninstall

```bash
brew uninstall --cask claudewatch
```
