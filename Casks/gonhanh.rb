cask "gonhanh" do
  version "1.0.60"
  sha256 "fc929d69fc70f4bb37bc056072fa580e3e8f944617cae7c45b0b1968e3529dd2"

  url "https://github.com/khaphanspace/gonhanh.org/releases/download/v#{version}/GoNhanh.dmg"
  name "Gõ Nhanh"
  desc "High-performance Vietnamese Input Method Engine for macOS"
  homepage "https://github.com/khaphanspace/gonhanh.org"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Gõ Nhanh.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Gõ Nhanh.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/space.khaphan.gonhanh.plist",
    "~/Library/Application Support/Gõ Nhanh",
  ]
end
