cask "claudewatch" do
  version "1.0.3"
  sha256 "5c4a874e1967106bb3835ea289a3c9654e20fc1462b4e070b1f7e5101ecf671f"

  url "https://github.com/gitwithuli/claudewatch/releases/download/v#{version}/ClaudeWatch.zip"
  name "ClaudeWatch"
  desc "Menu bar app to track Claude Code Pro/Max usage limits"
  homepage "https://github.com/gitwithuli/claudewatch"

  app "ClaudeWatch.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/ClaudeWatch.app"],
                   sudo: false
  end

  uninstall quit: "com.gitwithuli.claudewatch"

  zap trash: [
    "~/Library/Logs/claude-usage-monitor.log",
    "~/Library/LaunchAgents/com.gitwithuli.claudewatch.plist",
  ]
end
