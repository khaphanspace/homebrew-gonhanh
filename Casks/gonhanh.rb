cask "gonhanh" do
  version "1.0.76"
  sha256 "be676223b4269afcdd507ed996e4d30c732fd1a0e294efe9efdcc1d50a9269d3"

  url "https://github.com/khaphanspace/gonhanh.org/releases/download/v#{version}/GoNhanh.dmg"
  name "Gõ Nhanh"
  desc "High-performance Vietnamese Input Method Engine for macOS"
  homepage "https://github.com/khaphanspace/gonhanh.org"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "GoNhanh.app"

  postflight do
    system_command "/usr/bin/xattr",
         args: ["-cr", "#{appdir}/GoNhanh.app"],
         sudo: false
  end

  zap trash: [
    "~/Library/Preferences/space.khaphan.gonhanh.plist",
    "~/Library/Application Support/GoNhanh",
  ]
end
