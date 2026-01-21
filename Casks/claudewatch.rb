cask "claudewatch" do
  version "1.0.2"
  sha256 "baa9184f783a1bbd595043507b61b97f60df658f5d18765cfde66ef29fe16c36"

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
