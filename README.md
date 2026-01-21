# ClaudeWatch

A minimal macOS menu bar app to track your Claude Code Pro/Max usage limits.

**No Python required** - standalone native app.

![macOS](https://img.shields.io/badge/macOS-11+-blue) ![License](https://img.shields.io/badge/License-MIT-yellow)

## Install

```bash
brew tap gitwithuli/tap
brew install --cask claudewatch
```

Then run `claude` once to authenticate (if you haven't already), and launch ClaudeWatch.

## What You Get

| Menu Bar | Meaning |
|----------|---------|
| 🟢4 🟢12 | 5h: 4%, Weekly: 12% (healthy) |
| 🟡72 🟢15 | 5h at warning level |
| 🟠88 🟡75 | High usage |
| 🔴96 🟠85 | Critical |
| ⚠️ | Not authenticated |

Click the icon to see exact percentages, reset times, and refresh manually.

## Prerequisites

Claude Code CLI must be installed and authenticated:

```bash
# Install Claude Code
npm install -g @anthropic-ai/claude-code

# Authenticate (opens browser)
claude
```

This creates keychain credentials that ClaudeWatch reads. **No separate login needed.**

## Features

- 🟢🟡🟠🔴 Color-coded 5h + weekly usage in menu bar
- macOS notifications at 70%, 85%, 95%
- Auto-retry on connection failures
- Caches last known values when offline
- Updates every 2 minutes

## Manual Install

If you prefer not to use Homebrew:

1. Download `ClaudeWatch.zip` from [Releases](https://github.com/gitwithuli/claudewatch/releases)
2. Unzip and drag `ClaudeWatch.app` to `/Applications`
3. Double-click to run

## Auto-Start at Login

System Settings → General → Login Items → "+" → select ClaudeWatch

Or via terminal:
```bash
cat > ~/Library/LaunchAgents/com.gitwithuli.claudewatch.plist << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.gitwithuli.claudewatch</string>
    <key>ProgramArguments</key>
    <array>
        <string>/usr/bin/open</string>
        <string>-a</string>
        <string>ClaudeWatch</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
</dict>
</plist>
EOF
launchctl load ~/Library/LaunchAgents/com.gitwithuli.claudewatch.plist
```

## Troubleshooting

| Problem | Solution |
|---------|----------|
| Shows ⚠️ | Run `claude` in terminal to authenticate |
| Keychain prompts | Click "Always Allow" |
| Two instances | Quit one from menu bar |

Logs: `cat ~/Library/Logs/claude-usage-monitor.log`

## Uninstall

```bash
brew uninstall --cask claudewatch
brew untap gitwithuli/tap
```

Or manually:
```bash
rm -rf /Applications/ClaudeWatch.app
launchctl unload ~/Library/LaunchAgents/com.gitwithuli.claudewatch.plist 2>/dev/null
rm ~/Library/LaunchAgents/com.gitwithuli.claudewatch.plist 2>/dev/null
```

## Build from Source

For developers who want to modify:

```bash
git clone https://github.com/gitwithuli/claudewatch.git
cd claudewatch
python3 -m venv venv && source venv/bin/activate
pip install -r requirements.txt pyinstaller
pyinstaller ClaudeWatch.spec --noconfirm
cp -r dist/ClaudeWatch.app /Applications/
```

## Privacy

- No data collected or sent anywhere except Anthropic's usage API
- Credentials read from your local Keychain (created by Claude Code)
- All processing happens locally

## Credits

Built as a lightweight alternative to [CodexBar](https://github.com/steipete/CodexBar) for those who only need Claude Code tracking.

## License

MIT
