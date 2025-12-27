cask "gonhanh" do
  version "1.0.92"
  sha256 "fdab859d1e0e0e35dc4182452c61764f7906d26fae069393d87ccb13ae95ade7"

  url "https://github.com/khaphanspace/gonhanh.org/releases/download/v#{version}/GoNhanh.dmg"
  name "Gõ Nhanh"
  desc "High-performance Vietnamese Input Method Engine for macOS"
  homepage "https://github.com/khaphanspace/gonhanh.org"

  auto_updates true

  livecheck do
    url :url
    strategy :github_latest
  end

  app "GoNhanh.app"

  preflight do
    # Quit app before install/reinstall
    system_command "/usr/bin/osascript",
         args: ["-e", 'tell application id "org.gonhanh.GoNhanh" to quit'],
         sudo: false
    sleep 1
  end

  uninstall quit: "org.gonhanh.GoNhanh"

  postflight do
    system_command "/usr/bin/xattr",
         args: ["-cr", "#{appdir}/GoNhanh.app"],
         sudo: false
    system_command "/usr/bin/open",
         args: ["-a", "GoNhanh"],
         sudo: false
  end

  zap trash: [
    "~/Library/Preferences/space.khaphan.gonhanh.plist",
    "~/Library/Application Support/GoNhanh",
  ]
end
