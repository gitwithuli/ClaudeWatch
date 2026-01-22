cask "binancewatch" do
  version "1.0.1"
  sha256 "2bc8eb90866dec1adc5555bfe9acfb06e485fa364c884abc99d5f318757f0661"

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
