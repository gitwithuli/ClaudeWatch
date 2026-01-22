cask "binancewatch" do
  version "1.0.2"
  sha256 "5cf8c0613951d16e657225ecf77f0ba47831ba6c8ba04d807cf7ab221462c65f"

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
