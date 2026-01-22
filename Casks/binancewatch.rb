cask "binancewatch" do
  version "1.0.0"
  sha256 "63f3298c2e2cc196ddcc907973097c3973c3824cf3d9c37f0ff06841e62760d7"

  url "https://github.com/gitwithuli/binancewatch/releases/download/v#{version}/BinanceWatch.zip"
  name "BinanceWatch"
  desc "Menu bar app showing Binance Futures coins with high 24h volume"
  homepage "https://github.com/gitwithuli/binancewatch"

  app "BinanceWatch.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/BinanceWatch.app"],
                   sudo: false
  end

  uninstall quit: "com.binancewatch.app"

  zap trash: []
end
