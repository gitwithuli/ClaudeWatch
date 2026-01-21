cask "claudewatch" do
  version "1.0.1"
  sha256 "3e775b68f4022f67569a9304c2ec6b3bda5c693408c94e4dcf699f854a244d6f"

  url "https://github.com/gitwithuli/usage-watcher/releases/download/v#{version}/ClaudeWatch.zip"
  name "ClaudeWatch"
  desc "Menu bar app to track Claude Code Pro/Max usage limits"
  homepage "https://github.com/gitwithuli/usage-watcher"

  app "ClaudeWatch.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/ClaudeWatch.app"],
                   sudo: false
  end

  uninstall quit: "com.gitwithuli.claudewatch"

  zap trash: [
    "~/Library/Logs/claude-usage-monitor.log",
    "~/Library/LaunchAgents/com.claude.usage-monitor.plist",
  ]
end
